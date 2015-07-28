CREATE DATABASE IF NOT EXISTS datatabs_auditoria DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE datatabs_auditoria;

CREATE TABLE IF NOT EXISTS tb_tipoauditoria (
	id_tipoAuditoria TINYINT(1)                            NOT NULL AUTO_INCREMENT,
	codigo           CHAR(3)    COLLATE utf8_spanish_ci NOT NULL,
	activo           TINYINT(1)                         NOT NULL DEFAULT '1',
	PRIMARY KEY (id_tipoAuditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de tipo de auditoria';

CREATE TABLE IF NOT EXISTS tb_tipoauditoria_t (
	id_tipoAuditoria_t    TINYINT(1)                           NOT NULL AUTO_INCREMENT,
	tipoAuditoria         VARCHAR(50)  COLLATE utf8_spanish_ci NOT NULL,
	descripcion           VARCHAR(200) COLLATE utf8_spanish_ci NOT NULL,
	id_tipoAuditoria      TINYINT(1)                           NOT NULL,
	id_idioma             TINYINT(1)                           NOT NULL,
	id_usuarioCreador     INT(11)                              DEFAULT NULL,
	id_usuarioModificador INT(11)                              DEFAULT NULL,
	activo                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (id_tipoAuditoria_t)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de tipos de auditoria';

ALTER TABLE tb_tipoauditoria_t
ADD CONSTRAINT tb_tipoauditoria_t__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria           (id_tipoAuditoria),
ADD CONSTRAINT tb_tipoauditoria_t__tb_idioma        FOREIGN KEY (id_idioma)        REFERENCES datatabs_general.tb_idioma (id_idioma);

CREATE TABLE IF NOT EXISTS tb_auditoriaidioma (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de idiomas';

ALTER TABLE tb_auditoriaidioma
ADD CONSTRAINT tb_auditoriaidioma__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriapais (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de paises';

ALTER TABLE tb_auditoriapais
ADD CONSTRAINT tb_auditoriapais__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriaestado (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de estados';

ALTER TABLE tb_auditoriaestado
ADD CONSTRAINT tb_auditoriaestado__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriaciudad (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de ciudades';

ALTER TABLE tb_auditoriaciudad
ADD CONSTRAINT tb_auditoriaciudad__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriaperfil (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de perfiles';

ALTER TABLE tb_auditoriaperfil
ADD CONSTRAINT tb_auditoriaperfil__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriasexo (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de sexos';

ALTER TABLE tb_auditoriasexo
ADD CONSTRAINT tb_auditoriasexo__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriagrupo (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de grupos';

ALTER TABLE tb_auditoriagrupo
ADD CONSTRAINT tb_auditoriagrupo__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriacontrolador (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de controladores';

ALTER TABLE tb_auditoriacontrolador
ADD CONSTRAINT tb_auditoriacontrolador__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriavista (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de vistas';

ALTER TABLE tb_auditoriavista
ADD CONSTRAINT tb_auditoriavista__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriausuario (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de usuarios';

ALTER TABLE tb_auditoriausuario
ADD CONSTRAINT tb_auditoriausuario__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriasuperdistribuidor (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de super distribuidores';

ALTER TABLE tb_auditoriasuperdistribuidor
ADD CONSTRAINT tb_auditoriasuperdistribuidor__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriadistribuidor (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de distribuidores';

ALTER TABLE tb_auditoriadistribuidor
ADD CONSTRAINT tb_auditoriadistribuidor__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriaempresa (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de empresas';

ALTER TABLE tb_auditoriaempresa
ADD CONSTRAINT tb_auditoriaempresa__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriasucursal (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de sucursales';

ALTER TABLE tb_auditoriasucursal
ADD CONSTRAINT tb_auditoriasucursal__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriausuariod (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de informacion de usuarios';

ALTER TABLE tb_auditoriausuariod
ADD CONSTRAINT tb_auditoriausuariod__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriadispositivo (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de dispositivos';

ALTER TABLE tb_auditoriadispositivo
ADD CONSTRAINT tb_auditoriadispositivo__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriamodem (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de modems';

ALTER TABLE tb_auditoriamodem
ADD CONSTRAINT tb_auditoriamodem__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriaconsumidor (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de consumidores';

ALTER TABLE tb_auditoriaconsumidor
ADD CONSTRAINT tb_auditoriaconsumidor__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriamultimedia (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de multimedia';

ALTER TABLE tb_auditoriamultimedia
ADD CONSTRAINT tb_auditoriamultimedia__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriaevento (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de eventos';

ALTER TABLE tb_auditoriaevento
ADD CONSTRAINT tb_auditoriaevento__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditorianodo (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de nodos';

ALTER TABLE tb_auditorianodo
ADD CONSTRAINT tb_auditorianodo__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriatiempoespera (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de tiempos de espera';

ALTER TABLE tb_auditoriatiempoespera
ADD CONSTRAINT tb_auditoriatiempoespera__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriacheckin (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de check in';

ALTER TABLE tb_auditoriacheckin
ADD CONSTRAINT tb_auditoriacheckin__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriapregunta (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de preguntas';

ALTER TABLE tb_auditoriapregunta
ADD CONSTRAINT tb_auditoriapregunta__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriamensaje (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de mensaje';

ALTER TABLE tb_auditoriamensaje
ADD CONSTRAINT tb_auditoriamensaje__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriaformularioconsumidor (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de formularios';

ALTER TABLE tb_auditoriaformularioconsumidor
ADD CONSTRAINT tb_auditoriaformularioconsumidor__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriamensajepantalla (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de mensajes por pantalla';

ALTER TABLE tb_auditoriamensajepantalla
ADD CONSTRAINT tb_auditoriamensajepantalla__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriainvitacion (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de invitaciones';

ALTER TABLE tb_auditoriainvitacion
ADD CONSTRAINT tb_auditoriainvitacion__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriaconfiguracion (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de configuracion de nodos';

ALTER TABLE tb_auditoriaconfiguracion
ADD CONSTRAINT tb_auditoriaconfiguracion__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriaplantilla (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de plantillas';

ALTER TABLE tb_auditoriaplantilla
ADD CONSTRAINT tb_auditoriaplantilla__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);

CREATE TABLE IF NOT EXISTS tb_auditoriacondicionnodo (
	id_auditoria     INT(11)                               NOT NULL AUTO_INCREMENT,
	id_usuario       INT(11)                               DEFAULT NULL,
	usuario          VARCHAR(50)   COLLATE utf8_spanish_ci DEFAULT NULL,
	id_registro      INT(11)                               NOT NULL,
	fechaRegistro    DATETIME                              NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_tipoAuditoria TINYINT(1)                            NOT NULL,
	tabla            VARCHAR(50)   COLLATE utf8_spanish_ci NOT NULL,
	datos_a          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	datos_d          VARCHAR(5000) COLLATE utf8_spanish_ci DEFAULT NULL,
	PRIMARY KEY (id_auditoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de auditoria de condiciones de nodo';

ALTER TABLE tb_auditoriacondicionnodo
ADD CONSTRAINT tb_auditoriacondicionnodo__tb_tipoauditoria FOREIGN KEY (id_tipoAuditoria) REFERENCES tb_tipoauditoria (id_tipoAuditoria);