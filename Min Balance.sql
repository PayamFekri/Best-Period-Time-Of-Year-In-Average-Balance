USE [master]
GO
/****** Object:  UserDefinedFunction [dbo].[getMinBalance]    Script Date: 1/29/2025 11:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getMinBalance](@acc int, @date int) 
RETURNS BIGINT AS  -- Change the return type to BIGINT 
BEGIN 
    DECLARE @Balance BIGINT        -- Current balance 
    DECLARE @MINBalance BIGINT     -- Minimum balance 
    DECLARE @VALUE BIGINT          -- Net transaction value (VIN - VOUT) 
     
    DECLARE C CURSOR FOR 
    SELECT VIN - VOUT  
    FROM voucher 
    WHERE datee = @date AND acc = @acc 
    ORDER BY timee

    SET @Balance = (SELECT SUM(VIN) - SUM(VOUT)  
                    FROM voucher  
                    WHERE acc = @acc AND datee < @date) 
 
    SET @MINBalance = @Balance  -- Initialize minimum balance to the starting balance 
 
    OPEN C 
 
    FETCH NEXT FROM C INTO @VALUE  -- Fetch the first transaction of the day 
 
    WHILE @@FETCH_STATUS = 0       -- Loop through all transactions 
    BEGIN 
        SET @Balance = @Balance + @VALUE  -- Update current balance 
         
        -- Update minimum balance if the current balance is lower 
        IF @MINBalance > @Balance 
            SET @MINBalance = @Balance 
 
        FETCH NEXT FROM C INTO @VALUE  -- Fetch the next transaction 
    END 
 
    CLOSE C 
    DEALLOCATE C 
 
    RETURN @MINBalance  -- Return the lowest balance for the day 
END
