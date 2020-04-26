drop database bdPryStreamDep;
create database bdPryStreamDep;
use bdPryStreamDep;

/*-------------------------------------------*/
/* creacion de las tablas*/
/*-------------------------------------------*/
create table tUsuario(
	Usuario varchar(10) not null unique,
    Contrasenia varchar(40) not null unique,
    Nombre varchar(50),
    primary key(Usuario)
);
create table tLiga(
	CodLiga varchar(10) NOT NULL UNIQUE,
    NombreLiga varchar(50) NOT NULL UNIQUE,    
    PRIMARY KEY(CodLiga)
);
create table tEquipo
(
    CodEquipo varchar(10) NOT NULL UNIQUE,
    NombreEquipo varchar(50) NOT NULL UNIQUE,
    DirectorTec varchar(50),
    Pais varchar(50),
    PRIMARY KEY(CodEquipo)
);
create table tDetalleLiga
(
    CodLiga varchar(10) NOT NULL UNIQUE,
    CodEquipo varchar(10) NOT NULL UNIQUE,
    PRIMARY KEY(CodLiga,CodEquipo),
    FOREIGN KEY(CodLiga) REFERENCES tLiga(CodLiga),
    FOREIGN KEY(CodEquipo) REFERENCES tEquipo(CodEquipo)
);

create table tEstadio
(
    CodEstadio varchar(10) NOT NULL UNIQUE,
    NombreEstadio varchar(50) NOT NULL UNIQUE,
    Pais varchar(50),
    Capacidad int,
    PRIMARY KEY(CodEstadio)
);

create table tJugador
(
    CodJugador varchar(50) NOT NULL UNIQUE,
    NombreJugador varchar(50) NOT NULL,
    Apellidos varchar(50),
    Pais varchar(50),
    PRIMARY KEY(CodJugador)
);

create table tDetalleEquipo
(
    CodEquipo varchar(10) NOT NULL UNIQUE,
    CodJugador varchar(50) NOT NULL,
    NroCamiseta int,
    PRIMARY KEY(CodEquipo,CodJugador),
    FOREIGN KEY(CodEquipo) REFERENCES tEquipo(CodEquipo),
    FOREIGN KEY(CodJugador) REFERENCES tJugador(CodJugador)
);

create table tPartido
(
    CodPartido varchar(10) NOT NULL,
    CodLiga varchar(10) NOT NULL,
    CodEstadio varchar(10) NOT NULL,
    Fecha date,
    Hora time,
    PRIMARY KEY(CodPartido,CodLiga),
    FOREIGN KEY(CodLiga) REFERENCES tLiga(CodLiga),
    FOREIGN KEY(CodEstadio) REFERENCES tEstadio(Codestadio)
);

create table tDetallePartido
(
    CodPartido varchar(10) NOT NULL,
    CodEquipo varchar(10) NOT NULL,
    NroTarjetasRojas int,
    NroTarjetasAmarillas int,
    Marcador int,
    Cambio varchar(50),
    Pases int,
    DisparosFueraPuerta int,
    DisparonPuerta int,

    PRIMARY KEY(CodPartido,CodEquipo),
    FOREIGN KEY(CodPartido) REFERENCES tPartido(CodPartido),
    FOREIGN KEY(CodEquipo) REFERENCES tEquipo(CodEquipo)
);