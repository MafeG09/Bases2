-- Generado por Oracle SQL Developer Data Modeler 21.2.0.165.1515
--   en:        2023-10-10 13:43:37 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE articulo (
    id_articulo     NUMBER(10) NOT NULL,
    nombre          VARCHAR2(50),
    descripcion     VARCHAR2(100),
    tipo            VARCHAR2(20),
    precio_unitario NUMBER(10, 2),
    id_hotel        NUMBER(10) NOT NULL
)
LOGGING;

ALTER TABLE articulo ADD CONSTRAINT articulo_pk PRIMARY KEY ( id_articulo );

CREATE TABLE carro (
    id_carro   NUMBER(10) NOT NULL,
    marca      VARCHAR2(50),
    modelo     VARCHAR2(50),
    tipo       VARCHAR2(20),
    gama       VARCHAR2(20),
    precio_dia NUMBER(10, 2),
    id_hotel   NUMBER(10) NOT NULL
)
LOGGING;

ALTER TABLE carro ADD CONSTRAINT carro_pk PRIMARY KEY ( id_carro );

CREATE TABLE ciudad (
    id_ciudad       NUMBER(10) NOT NULL,
    nombre          VARCHAR2(50) NOT NULL,
    poblacion       NUMBER(10) NOT NULL,
    id_departamento NUMBER(10) NOT NULL
)
LOGGING;

ALTER TABLE ciudad ADD CONSTRAINT ciudad_pk PRIMARY KEY ( id_ciudad );

CREATE TABLE cliente (
    id_cliente NUMBER(10) NOT NULL,
    nombre     VARCHAR2(50) NOT NULL,
    correo     VARCHAR2(50) NOT NULL,
    telefono   VARCHAR2(20),
    direccion  VARCHAR2(100),
    id_ciudad  NUMBER(10) NOT NULL
)
LOGGING;

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id_cliente );

ALTER TABLE cliente ADD CONSTRAINT index_1 UNIQUE ( correo );

CREATE TABLE compra_articulo (
    id_compra    NUMBER(10) NOT NULL,
    id_cliente   NUMBER(10) NOT NULL,
    cantidad     NUMBER(5) NOT NULL,
    precio_total NUMBER(10, 2) NOT NULL,
    estado       VARCHAR2(20) NOT NULL
)
LOGGING;

ALTER TABLE compra_articulo ADD CONSTRAINT compra_articulo_pk PRIMARY KEY ( id_compra );

CREATE TABLE compra_paquete (
    id_compra       NUMBER(10) NOT NULL,
    id_cliente      NUMBER(10) NOT NULL,
    fecha_compra    DATE NOT NULL,
    numero_personas NUMBER(5) NOT NULL,
    precio_total    NUMBER(10, 2) NOT NULL,
    estado          VARCHAR2(20) NOT NULL
)
LOGGING;

ALTER TABLE compra_paquete ADD CONSTRAINT compra_paquete_pk PRIMARY KEY ( id_compra );

CREATE TABLE departamento (
    id_departamento NUMBER(10) NOT NULL,
    nombre          VARCHAR2(50) NOT NULL,
    poblacion       NUMBER(10) NOT NULL
)
LOGGING;

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( id_departamento );

CREATE TABLE detalle_compra_articulo (
    id_detalle   NUMBER(10) NOT NULL,
    id_compra    NUMBER(10) NOT NULL,
    id_cliente   NUMBER(10) NOT NULL,
    id_articulo  NUMBER(10) NOT NULL,
    cantidad     NUMBER(5) NOT NULL,
    precio_total NUMBER(10, 2) NOT NULL
)
LOGGING;

ALTER TABLE detalle_compra_articulo ADD CONSTRAINT detalle_compra_articulo_pk PRIMARY KEY ( id_detalle );

CREATE TABLE detalle_compra_paquete (
    id_detalle      NUMBER(10) NOT NULL,
    id_compra       NUMBER(10) NOT NULL,
    id_cliente      NUMBER(10) NOT NULL,
    id_paquete      NUMBER(10) NOT NULL,
    fecha_compra    DATE NOT NULL,
    numero_personas NUMBER(5) NOT NULL,
    precio_total    NUMBER(10, 2) NOT NULL
)
LOGGING;

ALTER TABLE detalle_compra_paquete ADD CONSTRAINT detalle_compra_paquete_pk PRIMARY KEY ( id_detalle );

CREATE TABLE detalle_reserva_carro (
    id_detalle            NUMBER(10) NOT NULL,
    id_reserva            NUMBER(10) NOT NULL,
    id_cliente            NUMBER(10) NOT NULL,
    id_carro              NUMBER(10) NOT NULL,
    fecha_inicio          DATE NOT NULL,
    fecha_fin             DATE NOT NULL,
    servicios_adicionales VARCHAR2(100),
    precio_total          NUMBER(10, 2) NOT NULL
)
LOGGING;

ALTER TABLE detalle_reserva_carro ADD CONSTRAINT detalle_reserva_carro_pk PRIMARY KEY ( id_detalle );

CREATE TABLE detalle_reserva_hotel (
    id_detalle        NUMBER(10) NOT NULL,
    id_reserva        NUMBER(10) NOT NULL,
    id_cliente        NUMBER(10) NOT NULL,
    id_hotel          NUMBER(10) NOT NULL,
    id_habitacion     NUMBER(10) NOT NULL,
    fecha_entrada     DATE NOT NULL,
    fecha_salida      DATE NOT NULL,
    numero_personas   NUMBER(5) NOT NULL,
    regimen_hospedaje VARCHAR2(20) NOT NULL,
    precio_total      NUMBER(10, 2) NOT NULL
)
LOGGING;

ALTER TABLE detalle_reserva_hotel ADD CONSTRAINT detalle_reserva_hotel_pk PRIMARY KEY ( id_detalle );

CREATE TABLE habitacion (
    id_habitacion NUMBER(10) NOT NULL,
    id_hotel      NUMBER(10) NOT NULL,
    nivel         VARCHAR2(20),
    capacidad     NUMBER(5),
    precio_noche  NUMBER(10, 2)
)
LOGGING;

ALTER TABLE habitacion ADD CONSTRAINT habitacion_pk PRIMARY KEY ( id_habitacion );

CREATE TABLE historial_compra_articulo (
    id_historial    NUMBER(10) NOT NULL,
    id_compra       NUMBER(10) NOT NULL,
    estado_anterior VARCHAR2(20) NOT NULL,
    estado_actual   VARCHAR2(20) NOT NULL,
    fecha_cambio    DATE NOT NULL
)
LOGGING;

ALTER TABLE historial_compra_articulo ADD CONSTRAINT historial_compra_articulo_pk PRIMARY KEY ( id_historial );

CREATE TABLE historial_compra_paquete (
    id_historial    NUMBER(10) NOT NULL,
    id_compra       NUMBER(10) NOT NULL,
    estado_anterior VARCHAR2(20) NOT NULL,
    estado_actual   VARCHAR2(20) NOT NULL,
    fecha_cambio    DATE NOT NULL
)
LOGGING;

ALTER TABLE historial_compra_paquete ADD CONSTRAINT historial_compra_paquete_pk PRIMARY KEY ( id_historial );

CREATE TABLE historial_reserva_carro (
    id_historial    NUMBER(10) NOT NULL,
    id_reserva      NUMBER(10) NOT NULL,
    estado_anterior VARCHAR2(20) NOT NULL,
    estado_actual   VARCHAR2(20) NOT NULL,
    fecha_cambio    DATE NOT NULL
)
LOGGING;

ALTER TABLE historial_reserva_carro ADD CONSTRAINT historial_reserva_carro_pk PRIMARY KEY ( id_historial );

CREATE TABLE historial_reserva_hotel (
    id_historial    NUMBER(10) NOT NULL,
    id_reserva      NUMBER(10) NOT NULL,
    estado_anterior VARCHAR2(20) NOT NULL,
    estado_actual   VARCHAR2(20) NOT NULL,
    fecha_cambio    DATE NOT NULL
)
LOGGING;

ALTER TABLE historial_reserva_hotel ADD CONSTRAINT historial_reserva_hotel_pk PRIMARY KEY ( id_historial );

CREATE TABLE hotel (
    id_hotel              NUMBER(10) NOT NULL,
    nombre                VARCHAR2(50) NOT NULL,
    ubicacion             VARCHAR2(100) NOT NULL,
    categoria             VARCHAR2(20),
    instalaciones         VARCHAR2(100),
    politicas_cancelacion VARCHAR2(100),
    id_ciudad             NUMBER(10) NOT NULL
)
LOGGING;

ALTER TABLE hotel ADD CONSTRAINT hotel_pk PRIMARY KEY ( id_hotel );

CREATE TABLE paquete (
    id_paquete            NUMBER(10) NOT NULL,
    nombre                VARCHAR2(50),
    descripcion           VARCHAR2(100),
    duracion              VARCHAR2(20),
    precio_persona        NUMBER(10, 2),
    politicas_cancelacion VARCHAR2(100),
    id_hotel              NUMBER(10) NOT NULL
)
LOGGING;

ALTER TABLE paquete ADD CONSTRAINT paquete_pk PRIMARY KEY ( id_paquete );

CREATE TABLE reserva_carro (
    id_reserva            NUMBER(10) NOT NULL,
    id_cliente            NUMBER(10) NOT NULL,
    fecha_inicio          DATE NOT NULL,
    fecha_fin             DATE NOT NULL,
    servicios_adicionales VARCHAR2(100),
    precio_total          NUMBER(10, 2) NOT NULL,
    estado                VARCHAR2(20) NOT NULL
)
LOGGING;

ALTER TABLE reserva_carro ADD CONSTRAINT reserva_carro_pk PRIMARY KEY ( id_reserva );

CREATE TABLE reserva_hotel (
    id_reserva        NUMBER(10) NOT NULL,
    id_cliente        NUMBER(10) NOT NULL,
    id_hotel          NUMBER(10) NOT NULL,
    fecha_entrada     DATE NOT NULL,
    fecha_salida      DATE NOT NULL,
    numero_personas   NUMBER(5) NOT NULL,
    regimen_hospedaje VARCHAR2(20) NOT NULL,
    precio_total      NUMBER(10, 2) NOT NULL,
    estado            VARCHAR2(20) NOT NULL
)
LOGGING;

ALTER TABLE reserva_hotel ADD CONSTRAINT reserva_hotel_pk PRIMARY KEY ( id_reserva );

ALTER TABLE articulo
    ADD CONSTRAINT fk_articulo_hotel FOREIGN KEY ( id_hotel )
        REFERENCES hotel ( id_hotel )
    NOT DEFERRABLE;

ALTER TABLE carro
    ADD CONSTRAINT fk_carro_hotel FOREIGN KEY ( id_hotel )
        REFERENCES hotel ( id_hotel )
    NOT DEFERRABLE;

ALTER TABLE ciudad
    ADD CONSTRAINT fk_ciudad_departamento FOREIGN KEY ( id_departamento )
        REFERENCES departamento ( id_departamento )
    NOT DEFERRABLE;

ALTER TABLE cliente
    ADD CONSTRAINT fk_cliente_ciudad FOREIGN KEY ( id_ciudad )
        REFERENCES ciudad ( id_ciudad )
    NOT DEFERRABLE;

ALTER TABLE compra_articulo
    ADD CONSTRAINT fk_compra_articulo_cliente FOREIGN KEY ( id_cliente )
        REFERENCES cliente ( id_cliente )
    NOT DEFERRABLE;

ALTER TABLE compra_paquete
    ADD CONSTRAINT fk_compra_paquete_cliente FOREIGN KEY ( id_cliente )
        REFERENCES cliente ( id_cliente )
    NOT DEFERRABLE;

ALTER TABLE detalle_compra_articulo
    ADD CONSTRAINT fk_det_com_art_art FOREIGN KEY ( id_articulo )
        REFERENCES articulo ( id_articulo )
    NOT DEFERRABLE;

ALTER TABLE detalle_compra_articulo
    ADD CONSTRAINT fk_det_com_art_cli FOREIGN KEY ( id_cliente )
        REFERENCES cliente ( id_cliente )
    NOT DEFERRABLE;
 
ALTER TABLE detalle_compra_articulo
    ADD CONSTRAINT fk_det_com_art_com FOREIGN KEY ( id_compra )
        REFERENCES compra_articulo ( id_compra )
    NOT DEFERRABLE;

ALTER TABLE detalle_compra_paquete
    ADD CONSTRAINT fk_det_comp_paq_cli FOREIGN KEY ( id_cliente )
        REFERENCES cliente ( id_cliente )
    NOT DEFERRABLE;

ALTER TABLE detalle_compra_paquete
    ADD CONSTRAINT fk_det_com_paq_com FOREIGN KEY ( id_compra )
        REFERENCES compra_paquete ( id_compra )
    NOT DEFERRABLE;

ALTER TABLE detalle_compra_paquete
    ADD CONSTRAINT fk_det_com_paq_paq FOREIGN KEY ( id_paquete )
        REFERENCES paquete ( id_paquete )
    NOT DEFERRABLE;

ALTER TABLE detalle_reserva_carro
    ADD CONSTRAINT fk_detalle_reserva_carro_carro FOREIGN KEY ( id_carro )
        REFERENCES carro ( id_carro )
    NOT DEFERRABLE;

ALTER TABLE detalle_reserva_carro
    ADD CONSTRAINT fk_det_res_car_cli FOREIGN KEY ( id_cliente )
        REFERENCES cliente ( id_cliente )
    NOT DEFERRABLE;

ALTER TABLE detalle_reserva_carro
    ADD CONSTRAINT fk_det_res_car_res FOREIGN KEY ( id_reserva )
        REFERENCES reserva_carro ( id_reserva )
    NOT DEFERRABLE;

ALTER TABLE detalle_reserva_hotel
    ADD CONSTRAINT fk_det_res_hot_cli FOREIGN KEY ( id_cliente )
        REFERENCES cliente ( id_cliente )
    NOT DEFERRABLE;

ALTER TABLE detalle_reserva_hotel
    ADD CONSTRAINT fk_det_res_hot_hab FOREIGN KEY ( id_habitacion )
        REFERENCES habitacion ( id_habitacion )
    NOT DEFERRABLE;

ALTER TABLE detalle_reserva_hotel
    ADD CONSTRAINT fk_detalle_reserva_hotel_hotel FOREIGN KEY ( id_hotel )
        REFERENCES hotel ( id_hotel )
    NOT DEFERRABLE;

ALTER TABLE detalle_reserva_hotel
    ADD CONSTRAINT fk_det_res_hot_res FOREIGN KEY ( id_reserva )
        REFERENCES reserva_hotel ( id_reserva )
    NOT DEFERRABLE;

ALTER TABLE habitacion
    ADD CONSTRAINT fk_habitacion_hotel FOREIGN KEY ( id_hotel )
        REFERENCES hotel ( id_hotel )
    NOT DEFERRABLE;

ALTER TABLE historial_compra_articulo
    ADD CONSTRAINT fk_hist_com_art_com FOREIGN KEY ( id_compra )
        REFERENCES compra_articulo ( id_compra )
    NOT DEFERRABLE;

ALTER TABLE historial_compra_paquete
    ADD CONSTRAINT fk_hist_comp_paq_com FOREIGN KEY ( id_compra )
        REFERENCES compra_paquete ( id_compra )
    NOT DEFERRABLE;

ALTER TABLE historial_reserva_carro
    ADD CONSTRAINT fk_hist_res_car_res FOREIGN KEY ( id_reserva )
        REFERENCES reserva_carro ( id_reserva )
    NOT DEFERRABLE;

ALTER TABLE historial_reserva_hotel
    ADD CONSTRAINT fk_hist_res_hot_res FOREIGN KEY ( id_reserva )
        REFERENCES reserva_hotel ( id_reserva )
    NOT DEFERRABLE;

ALTER TABLE hotel
    ADD CONSTRAINT fk_hotel_ciudad FOREIGN KEY ( id_ciudad )
        REFERENCES ciudad ( id_ciudad )
    NOT DEFERRABLE;

ALTER TABLE paquete
    ADD CONSTRAINT fk_paquete_hotel FOREIGN KEY ( id_hotel )
        REFERENCES hotel ( id_hotel )
    NOT DEFERRABLE;

ALTER TABLE reserva_carro
    ADD CONSTRAINT fk_reserva_carro_cliente FOREIGN KEY ( id_cliente )
        REFERENCES cliente ( id_cliente )
    NOT DEFERRABLE;

ALTER TABLE reserva_hotel
    ADD CONSTRAINT fk_reserva_hotel_cliente FOREIGN KEY ( id_cliente )
        REFERENCES cliente ( id_cliente )
    NOT DEFERRABLE;

ALTER TABLE reserva_hotel
    ADD CONSTRAINT fk_reserva_hotel_hotel FOREIGN KEY ( id_hotel )
        REFERENCES hotel ( id_hotel )
    NOT DEFERRABLE;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            20
-- CREATE INDEX                             0
-- ALTER TABLE                             50
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
