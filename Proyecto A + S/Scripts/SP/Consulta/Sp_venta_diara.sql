-- procedimiento para calcular ventas diaras
delimiter $
create procedure sp_ventadiara(
in _dia date
)
begin
select sum(boleta.total) ventastotal
from boleta
where boleta.fecha = _dia;
end 
$