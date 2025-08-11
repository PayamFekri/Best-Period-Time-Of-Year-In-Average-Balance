USE [master]
GO
/****** Object:  UserDefinedFunction [dbo].[NextDay]    Script Date: 1/29/2025 11:26:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[NextDay](@date int)
returns int as
begin
	declare @d int ,@m int  , @y int 
	set @d = (@date%100) + 1
	set @m =(@date/100)%100
	set @y = @date/10000
	if  ((@m <7 and @d>31) OR 
		(@m >6 and @d>30) OR
		(@y%4<>3 and @m = 12 and @d>29))
		begin set @d = 1  set @m =@m + 1 end
	if (@m>12)
		begin set @m = 1 set @y+=1 end
return(@y*10000+ @m*100 + @d)
end
