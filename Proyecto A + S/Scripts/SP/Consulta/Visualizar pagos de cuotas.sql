delimiter $
create procedure sp_visual_pagos (
in _rut varchar (12)
)
begin 
select p.rut,
	tpf.descipcion,
    p.fecha,
    p.monto
from pagos p
left join tipo_pago_familycard tpf
	on tpf.id_tipo_pago_familycard = p.id_tipo_pago_familycard
where p.rut = _rut;
end
$