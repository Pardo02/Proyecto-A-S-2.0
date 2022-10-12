delimiter $
create procedure sp_actualizar_datos (
in _rut varchar (12),
in _correo varchar(100),
in _celular varchar (12),
in _region int,
in _direccion varchar (100),
in _estadocivil int
)
begin
update cliente_familycard set correo = _correo, celular = _celular, id_region = _region, direccion = _direccion, id_estado_civil = _estadocivil
	where cliente_familycard.rut_cliente = _rut;
end
$