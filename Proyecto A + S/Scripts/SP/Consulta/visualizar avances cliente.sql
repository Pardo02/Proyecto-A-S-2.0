delimiter $
create procedure sp_visual_avances (
in _rut varchar (12)
)
begin
select a.monto,
	a.cuotas,
    a.monto_x_cuota,
    a.fecha,
    a.rut
from avances a
	where a.rut = _rut;
end
$