create function [dbo].[Next10Day](@date int)
returns int as
begin
	declare @d int ,@m int  , @y int ,@d_mande int ,@mm int
	
	set @d = (@date%100)+10
	set @d_mande =0 
	set @m =(@date/100)%100 
	set @mm = 0
	set @y = @date/10000
	
	if  ((@m <7 and @d>31))
		begin 
			set @d = -(31-@d)  
			set @m =@m + 1 
		end

	if  ((@m >6 and @d>30))
		begin 
			set @d = -(30-@d) 
			set @m =@m + 1 
		end
	if (@m>12)
		begin set @m = 1 set @y+=1 end

	if ((@y%4<>3 and @m = 12 and @d>29))
		begin set @d = 1  set @m =@m + 1 end

return(@y*10000+ @m*100 + @d)
end
