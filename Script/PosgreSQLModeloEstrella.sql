/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     12/12/2023 08:02:48 p. m.                    */
/*==============================================================*/


drop index DIM_AUTOR_PK;

drop table DIM_AUTOR;

drop index DIM_CLIENTE_PK;

drop table DIM_CLIENTE;

drop index DIM_GENERO_LITERARIO_PK;

drop table DIM_GENERO_LITERARIO;

drop index DIM_LIBRO_PK;

drop table DIM_LIBRO;

drop index RELATIONSHIP_4_FK;

drop index RELATIONSHIP_3_FK;

drop index RELATIONSHIP_2_FK;

drop index RELATIONSHIP_1_FK;

drop table HECHO_PRESTAMO;

/*==============================================================*/
/* Table: DIM_AUTOR                                             */
/*==============================================================*/
create table DIM_AUTOR (
   ID_AUTOR             SERIAL               not null,
   NOMBRE_AUTOR         VARCHAR(30)          null,
   constraint PK_DIM_AUTOR primary key (ID_AUTOR)
);

/*==============================================================*/
/* Index: DIM_AUTOR_PK                                          */
/*==============================================================*/
create unique index DIM_AUTOR_PK on DIM_AUTOR (
ID_AUTOR
);

/*==============================================================*/
/* Table: DIM_CLIENTE                                           */
/*==============================================================*/
create table DIM_CLIENTE (
   ID_CLIENTE           INT4                 not null,
   NOMBRE_CLIENTE       VARCHAR(50)          null,
   DIRECCCION_CLIENTE   VARCHAR(20)          null,
   NUMERO_TELEFONO      VARCHAR(11)          null,
   constraint PK_DIM_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: DIM_CLIENTE_PK                                        */
/*==============================================================*/
create unique index DIM_CLIENTE_PK on DIM_CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Table: DIM_GENERO_LITERARIO                                  */
/*==============================================================*/
create table DIM_GENERO_LITERARIO (
   ID_GENERO            SERIAL               not null,
   NOMBRE_GENERO        CHAR(30)             null,
   constraint PK_DIM_GENERO_LITERARIO primary key (ID_GENERO)
);

/*==============================================================*/
/* Index: DIM_GENERO_LITERARIO_PK                               */
/*==============================================================*/
create unique index DIM_GENERO_LITERARIO_PK on DIM_GENERO_LITERARIO (
ID_GENERO
);

/*==============================================================*/
/* Table: DIM_LIBRO                                             */
/*==============================================================*/
create table DIM_LIBRO (
   ID_LIBRO             INT4                 not null,
   TITULO_LIBRO         CHAR(30)             null,
   FECHA_PUBLICACION    DATE                 null,
   NUMERO_COPIAS_DISPONIBLES INT4                 null,
   constraint PK_DIM_LIBRO primary key (ID_LIBRO)
);

/*==============================================================*/
/* Index: DIM_LIBRO_PK                                          */
/*==============================================================*/
create unique index DIM_LIBRO_PK on DIM_LIBRO (
ID_LIBRO
);

/*==============================================================*/
/* Table: HECHO_PRESTAMO                                        */
/*==============================================================*/
create table HECHO_PRESTAMO (
   ID_AUTOR             INT4                 null,
   ID_GENERO            INT4                 null,
   ID_LIBRO             INT4                 null,
   ID_CLIENTE           INT4                 null,
   FECHA_PRESTAMO       DATE                 null,
   FECHA_DEVOLUCION     DATE                 null,
   ESTADO               VARCHAR(15)          null
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on HECHO_PRESTAMO (
ID_AUTOR
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on HECHO_PRESTAMO (
ID_GENERO
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on HECHO_PRESTAMO (
ID_LIBRO
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on HECHO_PRESTAMO (
ID_CLIENTE
);

alter table HECHO_PRESTAMO
   add constraint FK_HECHO_PR_RELATIONS_DIM_AUTO foreign key (ID_AUTOR)
      references DIM_AUTOR (ID_AUTOR)
      on delete restrict on update restrict;

alter table HECHO_PRESTAMO
   add constraint FK_HECHO_PR_RELATIONS_DIM_GENE foreign key (ID_GENERO)
      references DIM_GENERO_LITERARIO (ID_GENERO)
      on delete restrict on update restrict;

alter table HECHO_PRESTAMO
   add constraint FK_HECHO_PR_RELATIONS_DIM_LIBR foreign key (ID_LIBRO)
      references DIM_LIBRO (ID_LIBRO)
      on delete restrict on update restrict;

alter table HECHO_PRESTAMO
   add constraint FK_HECHO_PR_RELATIONS_DIM_CLIE foreign key (ID_CLIENTE)
      references DIM_CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

----------------------------------------------------------------------------
INSERCIONES
----------------------------------------------------------------------------
/*DIM_AUTOR*/
INSERT INTO DIM_AUTOR (NOMBRE_AUTOR) VALUES 
('Gabriel García Márquez'),
('J.K. Rowling'),
('Isabel Allende');

/*DIM_CLIENTE*/
INSERT INTO DIM_CLIENTE (NOMBRE_CLIENTE, DIRECCCION_CLIENTE, NUMERO_TELEFONO) VALUES 
('Ana Martínez', 'Calle 123, Ciudad', '555-1234'),
('Luis García', 'Av. Principal, Pueblo', '555-5678'),
('Marta Fernández', 'Calle 456, Villa', '555-9876');

/*DIM_GENERO_LITERARIO*/
INSERT INTO DIM_GENERO_LITERARIO (NOMBRE_GENERO) VALUES 
('Ficción'),
('Misterio'),
('Aventura');

/*DIM_LIBRO*/
INSERT INTO DIM_LIBRO (TITULO_LIBRO, FECHA_PUBLICACION, NUMERO_COPIAS_DISPONIBLES) VALUES 
('Cien Años de Soledad', '1967-05-30', 5),
('Harry Potter y la Piedra Filosofal', '1997-06-26', 8),
('La Casa de los Espíritus', '1982-01-01', 3);

/*HECHO_PRESTAMO*/
INSERT INTO HECHO_PRESTAMO (ID_PRESTAMO, ID_AUTOR, ID_GENERO, ID_LIBRO, ID_CLIENTE, FECHA_PRESTAMO, FECHA_DEVOLUCION, ESTADO) VALUES 
(1, 1, 1, 1, '2023-01-15', '2023-02-01', 'Devuelto'),
(2, 2, 1, 2, '2023-02-01', NULL, 'Pendiente'),
(3, 3, 2, 3, '2023-03-10', NULL, 'Pendiente');







