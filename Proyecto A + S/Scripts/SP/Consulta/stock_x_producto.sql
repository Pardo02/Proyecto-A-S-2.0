delimiter $ 
create procedure sp_stock_x_producto (
in _producto varchar (30)
)
begin
 select * from producto p
	where p.id_producto = _producto;
end
$