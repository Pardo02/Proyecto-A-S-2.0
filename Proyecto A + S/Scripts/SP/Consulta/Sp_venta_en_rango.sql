-- procedimiento para calcular ventas en rango de año mes
delimiter $
create procedure sp_ventaenrango (
in _añomesinicio varchar (6),
in _añormesfinal varchar (6)
)
begin
select sum(boleta.total) ventastotal
from boleta
where date_format(boleta.fecha, '%Y%m')  between _añomesinicio and _añomesfinal;
end 
$