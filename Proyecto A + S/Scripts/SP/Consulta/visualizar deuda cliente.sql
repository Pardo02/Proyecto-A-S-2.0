delimiter $
create procedure sp_visual_deuda_cliente (
in _rut varchar (12)
)
begin
Select * from clientecuotas
	where clientecuotas.rut = _rut;
end
$