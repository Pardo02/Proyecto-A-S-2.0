
-- Procedimiento creado para el ingreso de un avance en la tienda, se ingresan los datos, si el cliente ya tiene deuda se crea un update
-- y se le suma el monto, si no, se registra la deuda.

delimiter $
create procedure avances (
in _rut varchar (12),
in _monto double,
in _cuotas int
)
begin
declare montoxcuota double default 0;
declare validar_cliente varchar (12);
declare deuda_cliente double default 0;
select _monto / _cuotas into montoxcuota;
insert into avances (monto, cuotas, monto_x_cuota, fecha, rut)
	values (_monto, _cuotas, montoxcuota, date(now()), _rut);
select cl.rut into validar_cliente from clientecuotas cl
			where cl.rut = _rut;
if validar_cliente = _rut 
			then select cl.total_deuda into deuda_cliente from clientecuotas cl
				 where cl.rut = _rut;
				 update clientecuotas set total_deuda = _monto + deuda_cliente;
		 else insert into clientecuotas (rut, total_deuda)
			      values (_rut, _monto);
end if;
end
$