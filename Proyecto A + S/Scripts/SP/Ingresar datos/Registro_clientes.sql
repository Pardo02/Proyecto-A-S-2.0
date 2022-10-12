-- Procedimiento para registrar clientes --
delimiter $ 
Create procedure registrar_cliente (
	in _rutcliente varchar (12),
    in _nombre varchar (150),
	in _correo varchar (100),
    in _celular varchar (12),
    in _region int,
    in _direccion varchar (100),
    in _civil int,
    in _refenombre varchar (150),
    in _refecelular varchar (12)
    )
begin
insert into cliente_familycard (RUT_cliente, nombre, correo, celular, id_region, direccion, id_estado_civil, referencia_nombre, referencia_celular)
	values (_rutcliente, _nombre, _correo, _celular, _region, _direccion, _civil, _refenombre, _refecelular);
end 
$