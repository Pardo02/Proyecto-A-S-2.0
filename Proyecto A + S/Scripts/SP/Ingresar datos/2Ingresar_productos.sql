-- 2.-
-- En el siguiente procedimiento sp_ingresarproductos se debe llamar y dejar en bucle hasta que no se quieran agregar mas productos, y ir descontando del stock.
delimiter $
create procedure sp_ingresar_productos ( 
	in _idproducto varchar (30),
    in _idboleta int,
    in _cantidad int
)
begin
declare preciounitario double default 0;
declare preciodetalle double default 0;
declare stock int default 0;
select precio into preciounitario from producto 
	where producto.id_producto = _idproducto;
select preciounitario * _cantidad into preciodetalle;
insert into detalle_boleta (id_boleta, id_producto, cantidad_producto, precio_producto )  
	values (_idboleta, _idproducto, _cantidad, preciodetalle);
select cantidad into stock from producto 
	where producto.id_producto = _idproducto;
update producto set cantidad = stock - _cantidad
	where producto.id_producto = _idproducto;
end
$