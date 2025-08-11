USE [master]
GO
/****** Object:  UserDefinedFunction [dbo].[avg_Balance]    Script Date: 1/29/2025 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[avg_Balance](@acc int , @Sdate int , @Edate int)
returns int as 
begin
declare @date int = @Sdate
declare @S int =0    
declare @B int = 0 
declare @i int =0
while (@date <= @Edate)
	begin
	set @B = dbo.getMinBalance(@acc,@date)
	set @S = @S+@B
	set @date = dbo.NextDay(@date)
	set @i =@i+1
	end
set @S = @S / @i
return (@S) 
end
