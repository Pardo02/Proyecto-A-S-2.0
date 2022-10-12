delimiter $ 
create procedure sp_bajo_stock (
)
begin
 select * from producto where cantidad <= 15;
end
$