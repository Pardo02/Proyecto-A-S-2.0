
-- Procedimiento para ingresar producto y asignar stock--
-- Se valida que el producto no este ingresado --
-- Si el producto esta ingresado se le suma la cantidad --
-- Si el producto no esta ingresado, se ingresa --
delimiter $ 
create procedure Ingresar_Producto (
	in _id_producto varchar(30),
	in _descripcion varchar (100),
	in _marca varchar (30),
	in _precio double,
    in _cantidad int
)
begin
declare stockactual int default 0 ;
declare validarproducto varchar(30) ; 
select id_producto into validarproducto from producto 
	where id_producto = _id_producto;
if validarproducto = _id_producto then
	select cantidad into stockactual from producto 
		where id_producto = _id_producto; 
    update producto set producto.cantidad = stockactual + _cantidad
		where producto.id_producto = _id_producto;
	else insert into producto (id_producto, descripcion, marca, precio, cantidad)
			values (_id_producto, _descripcion, _marca, _precio, _cantidad); 
end if;
end 
$