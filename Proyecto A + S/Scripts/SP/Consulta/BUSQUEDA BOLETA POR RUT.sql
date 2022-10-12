-- consulta para buscar boletas por rut --

delimiter $
create procedure buscar_boleta_rut (
_rut varchar (12) 
)
begin
 select b.rut,
	b.fecha,
    b.total,
    b.iva,
    db.cantidad_producto,
    db.precio_producto,
    p.descripcion,
    p.marca,
    P.ID_PRODUCTO
from boleta b
left join detalle_boleta db
	on db.id_boleta = b.id_boleta
left join producto p
	on db.id_producto = p.id_producto;
end
$