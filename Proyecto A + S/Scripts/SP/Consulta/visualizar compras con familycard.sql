delimiter $
create procedure sp_visual_comprasfcard (
in _rut varchar (12)
)
begin
select cfc.rut,
	cfc.id_boleta,
    cfc.cuotas,
    cfc.monto,
    b.fecha
from compra_familycard cfc
left join boleta b
	on b.id_boleta = cfc.id_boleta
where cfc.rut = _rut;
end
$