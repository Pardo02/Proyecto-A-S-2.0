-- 1.-
delimiter $
create procedure sp_crearboleta ( 
	in _rut varchar (12)
)
begin
insert into boleta (rut, fecha, total, iva, id_tipo_pago)
	values (_rut, date(now()), null, null, null);
end
$
-- En el programa debemos guardar max(id_boleta) from boleta para utilizarlo en los siguientes procedimientos "ingresar productos" e "ingresar_venta"