-- Generado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   en:        2026-09-11 16:49:38 CLST
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE BOLETA_VENTA 
    ( 
     numero_boleta      VARCHAR2 (4)  NOT NULL , 
     fecha_venta        DATE  NOT NULL , 
     monto_total        NUMBER (10)  NOT NULL , 
     CLIENTE_id_cliente NUMBER (5)  NOT NULL , 
     SUCURSAL_sigla     NVARCHAR2 (10)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE BOLETA_VENTA 
    ADD CONSTRAINT BOLETA_VENTA_PK PRIMARY KEY ( numero_boleta ) ;

CREATE TABLE CATEGORIA 
    ( 
     id_categoria     NUMBER (4)  NOT NULL , 
     nombre_categoria NVARCHAR2 (20)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE CATEGORIA 
    ADD CONSTRAINT CATEGORIA_PK PRIMARY KEY ( id_categoria ) ;

CREATE TABLE CLIENTE 
    ( 
     id_cliente           NUMBER (5)  NOT NULL , 
     nombre               NVARCHAR2 (40)  NOT NULL , 
     segundo_nombre       NVARCHAR2 (40) , 
     apellido             NVARCHAR2 (40)  NOT NULL , 
     segundo_apellido     NVARCHAR2 (40) , 
     telefono             VARCHAR2 (10)  NOT NULL , 
     COMUNA_codigo_comuna VARCHAR2 (20)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE CLIENTE 
    ADD CONSTRAINT CLIENTE_PK PRIMARY KEY ( id_cliente ) ;

CREATE TABLE COMUNA 
    ( 
     codigo_comuna        VARCHAR2 (20)  NOT NULL , 
     nombre_comuna        NVARCHAR2 (30)  NOT NULL , 
     REGION_codigo_region VARCHAR2 (20)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE COMUNA 
    ADD CONSTRAINT COMUNA_PK PRIMARY KEY ( codigo_comuna ) ;

CREATE TABLE DETALLE_BOLETA 
    ( 
     precio_unitario            NUMBER (10)  NOT NULL , 
     cantidad                   NUMBER (5)  NOT NULL , 
     BOLETA_VENTA_numero_boleta VARCHAR2 (4)  NOT NULL , 
     PRODUCTO_id_producto       NUMBER (4)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE DETALLE_BOLETA 
    ADD CONSTRAINT DETALLE_BOLETA_PK PRIMARY KEY ( BOLETA_VENTA_numero_boleta, PRODUCTO_id_producto ) ;

CREATE TABLE MARCA 
    ( 
     id_marca     NUMBER (4)  NOT NULL , 
     nombre_marca NVARCHAR2 (30)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE MARCA 
    ADD CONSTRAINT MARCA_PK PRIMARY KEY ( id_marca ) ;

CREATE TABLE MODELO 
    ( 
     id_modelo_producto NUMBER (4)  NOT NULL , 
     descripcion_modelo NVARCHAR2 (20)  NOT NULL , 
     MARCA_id_marca     NUMBER (4)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE MODELO 
    ADD CONSTRAINT MODELO_PK PRIMARY KEY ( id_modelo_producto, MARCA_id_marca ) ;

CREATE TABLE PRODUCTO 
    ( 
     id_producto               NUMBER (4)  NOT NULL , 
     nombre_producto           NVARCHAR2 (30)  NOT NULL , 
     fecha_vencimiento         DATE , 
     CATEGORIA_id_categoria    NUMBER (4)  NOT NULL , 
     MODELO_id_modelo_producto NUMBER (4)  NOT NULL , 
     MODELO_MARCA_id_marca     NUMBER (4)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_PK PRIMARY KEY ( id_producto ) ;

CREATE TABLE PROVEEDOR 
    ( 
     rut_proveedor      NVARCHAR2 (10)  NOT NULL , 
     telefono_proveedor VARCHAR2 (10)  NOT NULL , 
     dv                 NVARCHAR2 (1)  NOT NULL , 
     tipo_proveedor     NVARCHAR2 (10)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE PROVEEDOR 
    ADD CONSTRAINT PROVEEDOR_PK PRIMARY KEY ( rut_proveedor ) ;

CREATE TABLE PROVEEDOR_EMPRESA 
    ( 
     rut_proveedor  NVARCHAR2 (10)  NOT NULL , 
     rut_proveedor1 VARCHAR2 (10)  NOT NULL , 
     nombre_empresa NVARCHAR2 (40)  NOT NULL , 
     sitio_web      NVARCHAR2 (50) 
    ) 
    LOGGING 
;

ALTER TABLE PROVEEDOR_EMPRESA 
    ADD CONSTRAINT PROVEEDOR_EMPRESA_PK PRIMARY KEY ( rut_proveedor ) ;

ALTER TABLE PROVEEDOR_EMPRESA 
    ADD CONSTRAINT PROVEEDOR_EMPRESA_PKv1 UNIQUE ( rut_proveedor1 ) ;

CREATE TABLE PROVEEDOR_PERSONA 
    ( 
     rut_proveedor    NVARCHAR2 (10)  NOT NULL , 
     rut_proveedor1   VARCHAR2 (10)  NOT NULL , 
     primer_nombre    NVARCHAR2 (40)  NOT NULL , 
     segundo_nombre   NVARCHAR2 (40) , 
     apellido         NVARCHAR2 (40)  NOT NULL , 
     segundo_apellido NVARCHAR2 (40) 
    ) 
    LOGGING 
;

ALTER TABLE PROVEEDOR_PERSONA 
    ADD CONSTRAINT PROVEEDOR_PERSONA_PK PRIMARY KEY ( rut_proveedor ) ;

ALTER TABLE PROVEEDOR_PERSONA 
    ADD CONSTRAINT PROVEEDOR_PERSONA_PKv1 UNIQUE ( rut_proveedor1 ) ;

CREATE TABLE REGION 
    ( 
     codigo_region VARCHAR2 (20)  NOT NULL , 
     nombre_region NVARCHAR2 (30)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE REGION 
    ADD CONSTRAINT REGION_PK PRIMARY KEY ( codigo_region ) ;

CREATE TABLE SUCURSAL 
    ( 
     sigla                NVARCHAR2 (10)  NOT NULL , 
     nombre_sucursal      NVARCHAR2 (30)  NOT NULL , 
     COMUNA_codigo_comuna VARCHAR2 (20)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE SUCURSAL 
    ADD CONSTRAINT SUCURSAL_PK PRIMARY KEY ( sigla ) ;

ALTER TABLE BOLETA_VENTA 
    ADD CONSTRAINT BOLETA_VENTA_CLIENTE_FK FOREIGN KEY 
    ( 
     CLIENTE_id_cliente
    ) 
    REFERENCES CLIENTE 
    ( 
     id_cliente
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE BOLETA_VENTA 
    ADD CONSTRAINT BOLETA_VENTA_SUCURSAL_FK FOREIGN KEY 
    ( 
     SUCURSAL_sigla
    ) 
    REFERENCES SUCURSAL 
    ( 
     sigla
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE CLIENTE 
    ADD CONSTRAINT CLIENTE_COMUNA_FK FOREIGN KEY 
    ( 
     COMUNA_codigo_comuna
    ) 
    REFERENCES COMUNA 
    ( 
     codigo_comuna
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE COMUNA 
    ADD CONSTRAINT COMUNA_REGION_FK FOREIGN KEY 
    ( 
     REGION_codigo_region
    ) 
    REFERENCES REGION 
    ( 
     codigo_region
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE DETALLE_BOLETA 
    ADD CONSTRAINT DETALLE_BOLETA_BOLETA_VENTA_FK FOREIGN KEY 
    ( 
     BOLETA_VENTA_numero_boleta
    ) 
    REFERENCES BOLETA_VENTA 
    ( 
     numero_boleta
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE DETALLE_BOLETA 
    ADD CONSTRAINT DETALLE_BOLETA_PRODUCTO_FK FOREIGN KEY 
    ( 
     PRODUCTO_id_producto
    ) 
    REFERENCES PRODUCTO 
    ( 
     id_producto
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE MODELO 
    ADD CONSTRAINT MODELO_MARCA_FK FOREIGN KEY 
    ( 
     MARCA_id_marca
    ) 
    REFERENCES MARCA 
    ( 
     id_marca
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_CATEGORIA_FK FOREIGN KEY 
    ( 
     CATEGORIA_id_categoria
    ) 
    REFERENCES CATEGORIA 
    ( 
     id_categoria
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_MODELO_FK FOREIGN KEY 
    ( 
     MODELO_id_modelo_producto,
     MODELO_MARCA_id_marca
    ) 
    REFERENCES MODELO 
    ( 
     id_modelo_producto,
     MARCA_id_marca
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE PROVEEDOR_EMPRESA 
    ADD CONSTRAINT PROVEEDOR_EMPRESA_PROVEEDOR_FK FOREIGN KEY 
    ( 
     rut_proveedor
    ) 
    REFERENCES PROVEEDOR 
    ( 
     rut_proveedor
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE PROVEEDOR_PERSONA 
    ADD CONSTRAINT PROVEEDOR_PERSONA_PROVEEDOR_FK FOREIGN KEY 
    ( 
     rut_proveedor
    ) 
    REFERENCES PROVEEDOR 
    ( 
     rut_proveedor
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE SUCURSAL 
    ADD CONSTRAINT SUCURSAL_COMUNA_FK FOREIGN KEY 
    ( 
     COMUNA_codigo_comuna
    ) 
    REFERENCES COMUNA 
    ( 
     codigo_comuna
    ) 
    NOT DEFERRABLE 
;

--  ERROR: No Discriminator Column found in Arc Arc_1 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc Arc_1 - constraint trigger for Arc cannot be generated

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                             0
-- ALTER TABLE                             27
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
-- ERRORS                                   4
-- WARNINGS                                 0
