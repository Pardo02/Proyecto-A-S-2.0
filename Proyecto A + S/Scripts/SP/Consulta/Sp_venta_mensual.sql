-- procedimiento para calcular ventas mensuales 
delimiter $
create procedure sp_ventasmensuales (
in _añomes varchar (6)
)
begin
select sum(boleta.total) ventastotal
from boleta
where date_format(boleta.fecha, '%Y%m')  = _añomes;
end 

$