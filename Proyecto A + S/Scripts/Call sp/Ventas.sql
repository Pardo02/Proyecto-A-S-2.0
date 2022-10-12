call sp_crearboleta ("20975149-6");
call sp_ingresar_productos ("2231107700038", 1, 2);
call sp_ingresarventa (1, 2, null);

call sp_crearboleta ("21199710-9");
call sp_ingresar_productos ("2241119800070", 2, 3);
call sp_ingresarventa (2, 3, null);

call sp_crearboleta ("21494002-7");
call sp_ingresar_productos ("2241191900023", 3, 1);
call sp_ingresarventa (3, 3, null);

call sp_crearboleta ("14049320-1");
call sp_ingresar_productos ("2289756489887", 4, 2);
call sp_ingresarventa (4, 4, 2);

call sp_crearboleta ("21603484-8");
call sp_ingresar_productos ("2299485748987", 5, 1);
call sp_ingresarventa (5, 4, 3);
