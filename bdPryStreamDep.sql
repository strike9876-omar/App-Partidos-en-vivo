drop database bdPryStreamDep;
create database bdPryStreamDep;
use bdPryStreamDep;

/*-------------------------------------------*/
/*          creacion de las tablas           */
/*-------------------------------------------*/
create table tUsuario(
	Usuario varchar(10) not null unique,
    Contrasenia varchar(40) not null unique,
    Nombre varchar(50),
    primary key(Usuario)
);
create table tLiga(
	CodLiga varchar(5) NOT NULL UNIQUE,
    NombreLiga varchar(50) NOT NULL UNIQUE,    
    PRIMARY KEY(CodLiga)
);
create table tEquipo
(
    CodEquipo varchar(5) NOT NULL UNIQUE,
    NombreEquipo varchar(50) NOT NULL UNIQUE,
    DirectorTec varchar(50),
    Pais varchar(50),
    PRIMARY KEY(CodEquipo)
);
create table tDetalleLiga
(
    CodLiga varchar(5) NOT NULL,
    CodEquipo varchar(10) NOT NULL,
    PRIMARY KEY(CodLiga,CodEquipo),
    FOREIGN KEY(CodLiga) REFERENCES tLiga(CodLiga),
    FOREIGN KEY(CodEquipo) REFERENCES tEquipo(CodEquipo)
);

create table tEstadio
(
    CodEstadio varchar(5) NOT NULL UNIQUE,
    NombreEstadio varchar(50) NOT NULL UNIQUE,
    Pais varchar(50),
    Capacidad int,
    PRIMARY KEY(CodEstadio)
);

create table tJugador
(
    CodJugador varchar(5) NOT NULL UNIQUE,
    NombreJugador varchar(50) NOT NULL,
    Apellidos varchar(50),
    Pais varchar(50),
    PRIMARY KEY(CodJugador)
);

create table tDetalleEquipo
(
    CodEquipo varchar(5) NOT NULL,
    CodJugador varchar(50) NOT NULL,
    NroCamiseta int,
    PRIMARY KEY(CodEquipo,CodJugador),
    FOREIGN KEY(CodEquipo) REFERENCES tEquipo(CodEquipo),
    FOREIGN KEY(CodJugador) REFERENCES tJugador(CodJugador)
);

create table tPartido
(
    CodPartido varchar(5) NOT NULL,
    CodLiga varchar(5) NOT NULL,
    CodEstadio varchar(5) NOT NULL,
    Fecha date,
    Hora time,
    PRIMARY KEY(CodPartido),
    FOREIGN KEY(CodLiga) REFERENCES tLiga(CodLiga),
    FOREIGN KEY(CodEstadio) REFERENCES tEstadio(Codestadio)
);

create table tDetallePartido
(
    CodPartido varchar(5) NOT NULL,
    CodEquipo varchar(5) NOT NULL,
    NroTarjetasRojas int,
    NroTarjetasAmarillas int,
    Marcador int,
    Cambio int,
    Pases int,
    DisparosFueraPuerta int,
    DisparonPuerta int,

    PRIMARY KEY(CodPartido,CodEquipo),
    FOREIGN KEY(CodPartido) REFERENCES tPartido(CodPartido),
    FOREIGN KEY(CodEquipo) REFERENCES tEquipo(CodEquipo)
);

-- -----------------------------------------------------------
--             Ingreso de datos a las tablas                --
-- -----------------------------------------------------------
-- --------Tabla Usuario----------
insert into tusuario values ('omar123','oculto','Omar Daniel');
insert into tusuario values ('rony123','oculto1','Rony Bolaños');

-- --------Tabla Estadio-----------
insert into tEstadio(CodEstadio, NombreEstadio, Pais, Capacidad)
 values ('S0001','La Bombonera','Argentina',15000); 
insert into tEstadio(CodEstadio, NombreEstadio, Pais, Capacidad)
 values ('S0002','Cmp Nou','España',20000); 
insert into tEstadio(CodEstadio, NombreEstadio, Pais, Capacidad)
 values ('S0003','Wembley','Inglaterra',14000); 
insert into tEstadio(CodEstadio, NombreEstadio, Pais, Capacidad)
 values ('S0004','Estadio Azteca','Mexico',18000); 
insert into tEstadio(CodEstadio, NombreEstadio, Pais, Capacidad)
 values ('S0005','San Siro','Italia',17000); 
insert into tEstadio(CodEstadio, NombreEstadio, Pais, Capacidad)
 values ('S0006','Maracana','Brasil',19000); 
insert into tEstadio(CodEstadio, NombreEstadio, Pais, Capacidad)
 values ('S0007','Signal Iduna Park','Alemania',14000);
insert into tEstadio(CodEstadio, NombreEstadio, Pais, Capacidad)
 values ('S0008','Santiago Bernabéu','España',15000);
 
-- --------Tabla Jugador-----------
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0001','Juan','Peres del Solar','Perú');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0002','Pedro','Fujimori Manrrique','Colombia');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0003','Cesar','Dueñas Ttito','Perú');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0004','Pedro Pablo','Humala Guzman','Argentina');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0005','Edwin','Licona Mamani','Perú');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0006','Marco','Alvares Torres','Brazil');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0007','Cristiano Ronaldo','Dos Santos Aveiro','Portugal');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0008','Joel','Villena Chacon','Perú');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0009','Jose','Nina Ponce','Ecuador');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0010','Alexander','Hinojo Suarez','Perú');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0011','Bruno','Condori Huaman','Perú');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0012','Vladimir','Putin Kroski','Rusia');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0013','Donald','Trump Chomski','EEUU');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0014','Barack','Obama Curss','EEUU');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0015','Xing','Ping Ing','China');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0016','Guillermo','Tel Moseley','Inglaterra');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0017','Juan','Sto Mayor','Perú');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0018','Carlos','Contreras Vera','Chile');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0019','Sebastian','Piñera','Chile');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0020','Ollanta','Humala Tasso','Perú');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0021','Alejandro','Toledo Manrrique','Perú');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0022','Mario','Vera Paredes','Perú');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0023','Jesus','Torres del Castillo','Perú');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0024','Jorge','Del Catillo Peres','Ecuador');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0025','Hector','Gutierrez Infantas','Perú');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0026','Daniel','Callasaca Calderon','Chile');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0027','Edi','Fray Zuniga','Panama');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0028','Lalo','Montes Tito','Perú');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0029','Lucero','Prado Monteagudo','Uruguay');

insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais)
values ('J0030','Alexander Juan','Perse Suarez','Perú');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0031','Alex Bruno','Condori Soto','Perú');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0032','Vladi','Kroski Putin','Rusia');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0033','Ronald','Trump Chomsky','EEUU');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0034','Jhon','Obama Well','EEUU');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0035','Xing Lee','Ping Ho','China');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0036','Guillermo Carlos','Tell Mose','Inglaterra');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0037','Juan Carlos','Soto Menor','Chile');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0038','Pedro Juan','Collegue Standart','Chile');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0039','Sebastian Lucio','Piñera Solis','Chile');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0040','Antauro','Humala Tasso','Perú');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0041','Marco Lalo','Toledo Manrrique','Brazil');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0042','Jose','Fernandez Paredes','Uruguay');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0043','Jesus Noe','Torres del Castro','Perú');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0044','Jorge Cruz','Del Catillo Suarez','Ecuador');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0045','Hector Juan','Infantas Gutierrez','Perú');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0046','Daniel Jhon','Calla Calderon','Chile');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0047','Edi Randy','Fray Yorlan','Panama');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0048','Lalo Leonel','Torres Tito','Perú');
insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
values ('J0049','Jesus JOse','Prad Monteagudo','Uruguay');

-- --------Tabla Equipo-----------
insert into tEquipo(CodEquipo, NombreEquipo, DirectorTec, Pais) 
values ('E0001','Real Madrid','Juan Torres Vai','España');
insert into tEquipo(CodEquipo, NombreEquipo, DirectorTec, Pais) 
values ('E0002','Barcelona','Pep Guardiola','España');
insert into tEquipo(CodEquipo, NombreEquipo, DirectorTec, Pais) 
values ('E0003','Atletico Madrid','Ricardo Gareca','Argentina');
insert into tEquipo(CodEquipo, NombreEquipo, DirectorTec, Pais) 
values ('E0004','Valencia','Juan Celades','España');

-- --------Tabla DetalleEquipo-----------
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0001','J0001',10);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0001','J0002',11);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0001','J0003',12);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0001','J0004',13);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0001','J0005',14);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0001','J0006',15);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0001','J0007',16);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0001','J0008',17);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0001','J0009',18);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0001','J0010',19);

insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0002','J0011',10);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0002','J0012',11);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0002','J0013',12);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0002','J0014',13);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0002','J0015',14);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0002','J0016',15);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0002','J0017',16);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0002','J0018',17);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0002','J0019',18);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0002','J0020',19);

insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0003','J0021',10);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0003','J0022',11);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0003','J0023',12);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0003','J0024',13);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0003','J0025',14);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0003','J0026',15);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0003','J0027',16);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0003','J0028',17);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0003','J0029',18);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0003','J0030',19);

insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0004','J0031',10);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0004','J0032',11);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0004','J0033',12);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0004','J0034',13);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0004','J0035',14);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0004','J0036',15);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0004','J0037',16);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0004','J0038',17);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0004','J0039',18);
insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta)
values ('E0004','J0040',19);


-- --------Tabla LIGA-----------
insert into tLiga(CodLiga, NombreLiga) values('L0001','La Liga'); 
insert into tLiga(CodLiga, NombreLiga) values('L0002','Copa del Rey'); 
insert into tLiga(CodLiga, NombreLiga) values('L0003','UEFA Champions League'); 
insert into tLiga(CodLiga, NombreLiga) values('L0004','UEFA Europa League'); 
insert into tLiga(CodLiga, NombreLiga) values('L0005','Bundesliga'); 
insert into tLiga(CodLiga, NombreLiga) values('L0006','SuperLiga'); 

-- --------Tabla DETALLELIGA----------
insert into tDetalleLiga(CodLiga, CodEquipo) values ('L0001','E0001');
insert into tDetalleLiga(CodLiga, CodEquipo) values ('L0001','E0002');
insert into tDetalleLiga(CodLiga, CodEquipo) values ('L0001','E0003');

insert into tDetalleLiga(CodLiga, CodEquipo) values ('L0002','E0004');
insert into tDetalleLiga(CodLiga, CodEquipo) values ('L0002','E0003');
insert into tDetalleLiga(CodLiga, CodEquipo) values ('L0002','E0002');

insert into tDetalleLiga(CodLiga, CodEquipo) values ('L0003','E0002');
insert into tDetalleLiga(CodLiga, CodEquipo) values ('L0003','E0004');
insert into tDetalleLiga(CodLiga, CodEquipo) values ('L0003','E0001');

insert into tDetalleLiga(CodLiga, CodEquipo) values ('L0004','E0001');
insert into tDetalleLiga(CodLiga, CodEquipo) values ('L0004','E0002');
insert into tDetalleLiga(CodLiga, CodEquipo) values ('L0004','E0003');
insert into tDetalleLiga(CodLiga, CodEquipo) values ('L0004','E0004');

-- --------Tabla PARTIDO-----------
insert into tPartido(CodPartido, CodLiga, CodEstadio, Fecha, Hora) 
values('P0001','L0001','S0001','2020-04-25', '10:00:00');

insert into tPartido(CodPartido, CodLiga, CodEstadio, Fecha, Hora) 
values('P0002','L0001','S0002','2020-04-24', '07:00:00');

-- --------Tabla DETALLEPARTIDO-----------
insert into tDetallePartido(CodPartido,CodEquipo,NroTarjetasRojas,NroTarjetasAmarillas,Marcador,Cambio,Pases,DisparosFueraPuerta,DisparonPuerta) 
values('P0001','E0001',2,1,1,12,5,2,10);
insert into tDetallePartido(CodPartido,CodEquipo,NroTarjetasRojas,NroTarjetasAmarillas,Marcador,Cambio,Pases,DisparosFueraPuerta,DisparonPuerta) 
values('P0001','E0002',2,1,0,12,5,2,11);

insert into tDetallePartido(CodPartido,CodEquipo,NroTarjetasRojas,NroTarjetasAmarillas,Marcador,Cambio,Pases,DisparosFueraPuerta,DisparonPuerta) 
values('P0002','E0003',2,1,4,12,5,2,10);
insert into tDetallePartido(CodPartido,CodEquipo,NroTarjetasRojas,NroTarjetasAmarillas,Marcador,Cambio,Pases,DisparosFueraPuerta,DisparonPuerta) 
values('P0002','E0002',2,1,1,12,5,20,11);

-- ===================================================================================================
--                              PROCEDIMIENTOS ALMACENaDOS
-- ===================================================================================================
-- *********************************************************
--      Prcocedimientos para la tabla LIGA y DETALLELIGA
-- *********************************************************
delimiter $
create procedure InsertarLiga(in Cod varchar(5),in Nombre varchar(50))
begin
	insert into tLiga(CodLiga, NombreLiga) values(Cod,Nombre);
end $

-- call InsertarLiga('L0008','UEFA')
-- select * from tLiga

delimiter $
create procedure InsertarDetalleLiga(in CodLig varchar(5),in CodEquip varchar(5))
begin
    insert into tDetalleLiga(CodLiga, CodEquipo) values (CodLig,CodEquip);
end $

-- call InsertarDetalleLiga('L0008','E0003')
-- select * from tDetalleLiga

delimiter $
create procedure ActualizarLiga(in Cod varchar(5),in Nombre varchar(50))
begin
	update tLiga
	set NombreLiga=Nombre where CodLiga=Cod;
end $

-- call ActualizarLiga('L008','Actualizado')

delimiter $
create procedure BorrarLiga(in CodLig varchar(5))
begin
	Delete from tLiga where CodLiga = CodLig;
end $
-- call BorrarLiga('L0008')

-- *********************************************************
--  Prococedimientos para la tabla tEQUIPO y tDETALLEEQUIPO
-- *********************************************************
delimiter $
create procedure InsertarEquipo(in Cod varchar(5),in Nombre varchar(50), in Director varchar(50), in Pai varchar(50))
begin
	insert into tEquipo(CodEquipo, NombreEquipo, DirectorTec, Pais) 
		values(Cod,Nombre,Director, Pai);
end $
-- call InsertarEquipo('E0009','Juventus','PPK','EEUU')
-- select * from tEquipo

delimiter $
create procedure ActualizarEquipo(in Cod varchar(5),in Nombre varchar(50), in Director varchar(50), in Pai varchar(50))
begin
	update tEquipo
	set NombreEquipo=Nombre, DirectorTec=Director, Pais=Pai where CodEquipo=Cod;
end $
-- call ActualizarEquipo('E0009','Juventus2','Omar','EEUU')

delimiter $
create procedure InsertarDetalleEquipo(in CodEquip varchar(5),in CodJugad varchar(5), in Nro int)
begin
	insert into tDetalleEquipo(CodEquipo, CodJugador, NroCamiseta) 
		values(CodEquip,CodJugad,Nro);
end $
-- call InsertarDetalleEquipo('E0009','J0040',1)
-- select* from tDetalleEquipo where CodEquipo='E0009'

delimiter $
create procedure ActualizarDetalleEquipo(in CodEquip varchar(5),in CodJugad varchar(5), in Nro int)
begin
	update tDetalleEquipo
	set NroCamiseta=Nro where CodEquipo=CodEquip and CodJugador=CodJugad;
end $
-- call ActualizarDetalleEquipo('E0009','J0040',5)

-- *********************************************************
--  Prococedimientos para la tabla tJUGADOR
-- *********************************************************
delimiter $
create procedure InsertarJugador(in Cod varchar(5),in Nombre varchar(50), in Apellido varchar(50), in Pai varchar(50))
begin
	insert into tJugador(CodJugador, NombreJugador, Apellidos, Pais) 
		values(Cod,Nombre,Apellido, Pai);
end $
-- call InsertarJugador('J0070','Joel','Soto Mamani','EEUU')
-- SELECT* from tJugador

delimiter $
create procedure ActualizarJugador(in Cod varchar(5),in Nombre varchar(50), in Apellido varchar(50), in Pai varchar(50))
begin
	update tJugador
	set NombreJugador=Nombre, Apellidos=Apellido, Pais=Pai where CodJugador=Cod;
end $
-- call ActualizarJugador('J0070','Joel Anderson','Soto Mamani','Perú')

delimiter $
create procedure BorrarJugador(in CodJugad varchar(5))
begin
	Delete from tJugador where CodJugador = CodJugad;
end $
-- call BorrarJugador('J0070')

-- **********************************************************
--  Prococedimientos para la tabla tPARTIDO y tDETALLEPARTIDO
-- **********************************************************
delimiter $
create procedure InsertarPartido(in CodPar varchar(5),in CodLig varchar(5), in CodEstad varchar(5), in Fech date, in Hor time)
begin
	insert into tPartido(CodPartido, CodLiga, CodEstadio, Fecha, Hora) 
		values(CodPar,CodLig,CodEstad,Fech, Hor);
end $
-- call InsertarPartido('P0010','L0001','S0002','2020-04-22', '03:00:00')
-- select* from tPartido

delimiter $
create procedure ActualizarPartido(in CodPar varchar(5),in CodLig varchar(5), in CodEstad varchar(5), in Fech date, in Hor time)
begin
	update tPartido
	set CodLiga=CodLig,CodEstadio=CodEstad, Fecha=Fech, Hora=Hor where CodPartido=CodPar;
end $
-- call ActualizarPartido('P0010','L0001','S0003','2020-04-24', '09:00:00')

delimiter $
create procedure BorrarPartido(in CodPart varchar(5))
begin
	Delete from tPartido where CodPartido = CodPart;
end $
-- call BorrarPartido('P0010','L0001')

delimiter $
create procedure InsertarDetallePartido(in CodPar varchar(5),in CodEquip varchar(5), in TR int, in TA int, in Marcdo int, in Camb int, in Pas int, in DisFuePuer int, in DispPuer int)
begin
	insert into tDetallePartido(CodPartido,CodEquipo,NroTarjetasRojas,NroTarjetasAmarillas,Marcador,Cambio,Pases,DisparosFueraPuerta,DisparonPuerta) 
	values(CodPar,CodEquip,TR,TA,Marcdo,Camb, Pas, DisFuePuer, DispPuer);
end $
-- call InsertarDetallePartido('P0010','E0002',0,1,0,0,0,2,1)
-- call InsertarDetallePartido('P0010','E0003',1,1,0,0,0,3,1)
-- select* from tDetallePartido where CodPartido='P0010'


delimiter $
-- drop procedure ActualizarDetallePartido
create procedure ActualizarDetallePartido(in CodPar varchar(5),in CodEquip varchar(5), in TR int, in TA int, in Marcdo int, in Camb int, in Pas int, in DisFuePuer int, in DispPuer int)
begin
	update tDetallePartido
	set NroTarjetasRojas=TR,NroTarjetasAmarillas=TA, Marcador=Marcdo, Cambio=Camb, Pases=Pas,DisparosFueraPuerta=DisFuePuer,DisparonPuerta=DispPuer where CodPartido=CodPar and CodEquipo=CodEquip;
end $
-- call ActualizarDetallePartido('P0010','E0002',3,1,5,12,5,20,11)
-- call ActualizarDetallePartido('P0010','E0003',8,2,8,2,5,21,1)