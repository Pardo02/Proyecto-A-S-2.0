
-- procedimiento para ingresar pagos y descontar a la deuda total.
delimiter $
create procedure sp_pagos_familycard (
in _rut varchar (12),
in _tipopago int,
in _monto double
)
begin
declare deuda_actual double default 0;
select total_deuda into deuda_actual from clientecuotas
	where clientecuotas.rut = _rut;
insert into pagos (rut, id_tipo_pago_familycard, monto)
	values (_rut, _tipopago, _monto);
update clientecuotas set total_deuda = deuda_actual - _monto
	where clientecuotas.rut = _rut;
end
$