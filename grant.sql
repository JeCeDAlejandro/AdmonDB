use La_esperanza;
grant select
on Sucursal
to rec_hum;

grant update
on Proveedor
to rec_hum;

deny select
on Empleado
to rec_hum;

deny select
on Proveedor
to rec_hum;

select * from Sucursal
select * from Empleado
select * from Proveedor

UPDATE Proveedor
SET dir_prov = 'upiicsa'
WHERE id_prov = 1;
