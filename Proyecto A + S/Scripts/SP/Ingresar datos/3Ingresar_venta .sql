-- En este procedimiento se actualiza la boleta con los campos necesarios y se ingresa, de pagar con credito de la tienda se agrega a la deuda del cliente--

delimiter $
create procedure sp_ingresarventa (
in _idboleta int,
in _idtipopago int,
in _cuotas int
)
begin 
declare preciototal double default 0;
declare _iva double default 0;
declare validar_cliente varchar (12);
declare _rut varchar (12);
declare deuda_cliente double;

select rut into _rut from boleta 
	where boleta.id_boleta = _idboleta;
select sum(precio_producto) into preciototal from detalle_boleta
	where detalle_boleta.id_boleta = _idboleta;
    
update boleta set rut = _rut, total = preciototal, iva = _iva, id_tipo_pago = _idtipopago
	where boleta.id_boleta = _idboleta;
    
if _idtipopago = 4 
	then insert into compra_familycard (rut, id_boleta, cuotas, monto)
			values (_rut, _idboleta, _cuotas, preciototal);
		 select cl.rut into validar_cliente from clientecuotas cl
			where cl.rut = _rut;
         if validar_cliente = _rut 
			then select cl.total_deuda into deuda_cliente from clientecuotas cl
				 where cl.rut = _rut;
				 update clientecuotas set total_deuda = preciototal + deuda_cliente
					where clientecuotas.rut = _rut;
		 else insert into clientecuotas (rut, total_deuda)
			      values (_rut, preciototal);
         end if;
		
end if;
end $