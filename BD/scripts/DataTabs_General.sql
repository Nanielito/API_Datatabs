CREATE DATABASE IF NOT EXISTS datatabs_general DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE datatabs_general;

CREATE TABLE IF NOT EXISTS tb_idioma (
	id_idioma             TINYINT(3)                         NOT NULL AUTO_INCREMENT,
	codigo                CHAR(3)    COLLATE utf8_spanish_ci NOT NULL,
	id_usuarioCreador     INT(11)                            DEFAULT NULL,
	id_usuarioModificador INT(11)                            DEFAULT NULL,
	activo                TINYINT(1)                         NOT NULL DEFAULT '1',
	PRIMARY KEY (id_idioma)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de idiomas';

CREATE TABLE IF NOT EXISTS tb_idioma_t (
	id_idioma_t           TINYINT(3)                          NOT NULL AUTO_INCREMENT,
	idioma                VARCHAR(20) COLLATE utf8_spanish_ci NOT NULL,
	id_idioma             TINYINT(1)                          NOT NULL,
	id_usuarioCreador     INT(11)                             DEFAULT NULL,
	id_usuarioModificador INT(11)                             DEFAULT NULL,
	activo                TINYINT(1)                          NOT NULL DEFAULT '1',
	PRIMARY KEY (id_idioma_t)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de idiomas';

ALTER TABLE tb_idioma_t
ADD CONSTRAINT tb_idioma_t__tb_idioma FOREIGN KEY (id_idioma) REFERENCES tb_idioma (id_idioma);

CREATE TABLE IF NOT EXISTS tb_pais (
	id_pais               SMALLINT(6)                         NOT NULL AUTO_INCREMENT,
	codigoNUM             CHAR(3)     COLLATE utf8_spanish_ci NOT NULL,
	codigoALP2            CHAR(2)     COLLATE utf8_spanish_ci NOT NULL,
	codigoALP3            CHAR(3)     COLLATE utf8_spanish_ci NOT NULL,
	id_usuarioCreador     INT(11)                             DEFAULT NULL,
	id_usuarioModificador INT(11)                             DEFAULT NULL,
	activo                TINYINT(1)                          NOT NULL DEFAULT '1',
	PRIMARY KEY (id_pais)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de paises';

CREATE TABLE IF NOT EXISTS tb_pais_t (
	id_pais_t             SMALLINT(6)                         NOT NULL AUTO_INCREMENT,
	pais                  VARCHAR(50) COLLATE utf8_spanish_ci NOT NULL,
	id_pais               SMALLINT(6)                         NOT NULL,
	id_idioma             TINYINT(1)                          NOT NULL,
	id_usuarioCreador     INT(11)                             DEFAULT NULL,
	id_usuarioModificador INT(11)                             DEFAULT NULL,
	activo                TINYINT(1)                          NOT NULL DEFAULT '1',
	PRIMARY KEY (id_pais_t)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de paises';

ALTER TABLE tb_pais_t
ADD CONSTRAINT tb_pais_t__tb_pais   FOREIGN KEY (id_pais)   REFERENCES tb_pais   (id_pais),
ADD CONSTRAINT tb_pais_t__tb_idioma FOREIGN KEY (id_idioma) REFERENCES tb_idioma (id_idioma);

CREATE TABLE IF NOT EXISTS tb_estado (
	id_estado             SMALLINT(6)                         NOT NULL AUTO_INCREMENT,
	codigo                CHAR(5)     COLLATE utf8_spanish_ci NOT NULL,
	id_pais               SMALLINT(6)                         NOT NULL,
	id_usuarioCreador     INT(11)                             DEFAULT NULL,
	id_usuarioModificador INT(11)                             DEFAULT NULL,
	activo                TINYINT(1)                          NOT NULL DEFAULT '1',
	PRIMARY KEY (id_estado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de estado, region, distrito, etc';

ALTER TABLE tb_estado
ADD CONSTRAINT tb_estado__tb_pais FOREIGN KEY (id_pais) REFERENCES tb_pais (id_pais);

CREATE TABLE IF NOT EXISTS tb_estado_t (
	id_estado_t           SMALLINT(6)                         NOT NULL AUTO_INCREMENT,
	estado                VARCHAR(50) COLLATE utf8_spanish_ci NOT NULL,
	id_estado             SMALLINT(6)                         NOT NULL,
	id_idioma             TINYINT(1)                          NOT NULL,
	id_usuarioCreador     INT(11)                             DEFAULT NULL,
	id_usuarioModificador INT(11)                             DEFAULT NULL,
	activo                TINYINT(1)                          NOT NULL DEFAULT '1',
	PRIMARY KEY (id_estado_t)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traduciones de estados, regiones, distritos, etc.';

ALTER TABLE tb_estado_t
ADD CONSTRAINT tb_estado_t__tb_estado FOREIGN KEY (id_estado) REFERENCES tb_estado (id_estado),
ADD CONSTRAINT tb_estado_t__tb_idioma FOREIGN KEY (id_idioma) REFERENCES tb_idioma (id_idioma);

CREATE TABLE IF NOT EXISTS tb_ciudad (
	id_ciudad             SMALLINT(6)                         NOT NULL AUTO_INCREMENT,
	codigo                CHAR(5)     COLLATE utf8_spanish_ci NOT NULL,
	id_estado             SMALLINT(6)                         NOT NULL,
	id_usuarioCreador     INT(11)                             DEFAULT NULL,
	id_usuarioModificador INT(11)                             DEFAULT NULL,
	activo                TINYINT(1)                          NOT NULL DEFAULT '1',
	PRIMARY KEY (`id_ciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de ciudades';

ALTER TABLE tb_ciudad
ADD CONSTRAINT tb_ciudad__tb_estado FOREIGN KEY (id_estado) REFERENCES tb_estado (id_estado);

CREATE TABLE IF NOT EXISTS tb_ciudad_t (
	id_ciudad_t           SMALLINT(6)                         NOT NULL AUTO_INCREMENT,
	ciudad                VARCHAR(50) COLLATE utf8_spanish_ci NOT NULL,
	id_ciudad             SMALLINT(6)                         NOT NULL,
	id_idioma             TINYINT(1)                          NOT NULL,
	id_usuarioCreador     INT(11)                             DEFAULT NULL,
	id_usuarioModificador INT(11)                             DEFAULT NULL,
	activo                TINYINT(1)                          NOT NULL DEFAULT '1',
	PRIMARY KEY (id_ciudad_t)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para ciudades y sus traducciones';

ALTER TABLE tb_ciudad_t
ADD CONSTRAINT tb_ciudad_t__tb_ciudad FOREIGN KEY (id_ciudad) REFERENCES tb_ciudad (id_ciudad),
ADD CONSTRAINT tb_ciudad_t__tb_idioma FOREIGN KEY (id_idioma) REFERENCES tb_idioma (id_idioma);

CREATE TABLE IF NOT EXISTS tb_sexo (
	id_sexo               TINYINT(1)                         NOT NULL AUTO_INCREMENT,
	codigo                CHAR(1)    COLLATE utf8_spanish_ci NOT NULL,
	id_usuarioCreador     INT(11)                            DEFAULT NULL,
	id_usuarioModificador INT(11)                            DEFAULT NULL,
	activo                TINYINT(1)                         NOT NULL DEFAULT '1',
	PRIMARY KEY (id_sexo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de sexo';

CREATE TABLE IF NOT EXISTS tb_sexo_t (
	id_sexo_t             TINYINT(1)                          NOT NULL AUTO_INCREMENT,
	sexo                  VARCHAR(20) COLLATE utf8_spanish_ci NOT NULL,
	id_sexo               TINYINT(1)                          NOT NULL,
	id_idioma             TINYINT(1)                          NOT NULL,
	id_usuarioCreador     INT(11)                             DEFAULT NULL,
	id_usuarioModificador INT(11)                             DEFAULT NULL,
	activo                TINYINT(1)                          NOT NULL DEFAULT '1',
	PRIMARY KEY (id_sexo_t)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de sexo';

ALTER TABLE tb_sexo_t
ADD CONSTRAINT tb_sexo_t__tb_sexo   FOREIGN KEY (id_sexo)   REFERENCES tb_sexo   (id_sexo),
ADD CONSTRAINT tb_sexo_t__tb_idioma FOREIGN KEY (id_idioma) REFERENCES tb_idioma (id_idioma);


/* TABLAS IMAGEN */
CREATE TABLE IF NOT EXISTS tb_tipoimagen (
	id_tipoImagen         TINYINT(1)                         NOT NULL AUTO_INCREMENT,
	codigo                CHAR(5)    COLLATE utf8_spanish_ci NOT NULL,
	id_usuarioCreador     INT(11)                            DEFAULT NULL,
	id_usuarioModificador INT(11)                            DEFAULT NULL,
	activo                TINYINT(1)                         NOT NULL DEFAULT '1',
	PRIMARY KEY (id_tipoImagen)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de tipos de imagenes';

CREATE TABLE IF NOT EXISTS tb_tipoimagen_t (
	id_tipoImagen_t       TINYINT(1)                           NOT NULL AUTO_INCREMENT,
	tipoImagen            VARCHAR(20)  COLLATE utf8_spanish_ci NOT NULL,
	descripcion           VARCHAR(200) COLLATE utf8_spanish_ci DEFAULT NULL,
	id_tipoImagen         TINYINT(1)                           NOT NULL,
	id_idioma             TINYINT(1)                           NOT NULL,
	id_usuarioCreador     INT(11)                              DEFAULT NULL,
	id_usuarioModificador INT(11)                              DEFAULT NULL,
	activo                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (id_tipoImagen_t)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de tipos de imagenes';

ALTER TABLE tb_tipoimagen_t
ADD CONSTRAINT tb_tipoimagen_t__tb_idioma     FOREIGN KEY (id_idioma)     REFERENCES tb_idioma     (id_idioma),
ADD CONSTRAINT tb_tipoimagen_t__tb_tipoimagen FOREIGN KEY (id_tipoImagen) REFERENCES tb_tipoimagen (id_tipoImagen);

CREATE TABLE IF NOT EXISTS tb_imagen (
	id_imagen             INT(11)                              NOT NULL AUTO_INCREMENT,
	imagen                VARCHAR(255) COLLATE utf8_spanish_ci NOT NULL,
	fechaRegistro         DATETIME                             NOT NULL DEFAULT CURRENT_TIMESTAMP,
	fechaActualizacion    DATETIME                             DEFAULT NULL,
	id_tipoImagen         TINYINT(1)                           NOT NULL,
	id_usuarioCreador     INT(11)                              DEFAULT NULL,
	id_usuarioModificador INT(11)                              DEFAULT NULL,
	PRIMARY KEY (`id_imagen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de imagenes';

ALTER TABLE tb_imagen
ADD CONSTRAINT tb_imagen__tb_tipoimagen FOREIGN KEY (id_tipoImagen) REFERENCES tb_tipoimagen (id_tipoImagen);
/* */

/* TABLAS VIDEO */
CREATE TABLE IF NOT EXISTS tb_video (
	id_video              INT(11)                              NOT NULL AUTO_INCREMENT,
	video                 VARCHAR(255) COLLATE utf8_spanish_ci NOT NULL,
	fechaRegistro         DATETIME                             NOT NULL DEFAULT CURRENT_TIMESTAMP,
	fechaActualizacion    DATETIME                             DEFAULT NULL,
	id_usuarioCreador     INT(11)                              DEFAULT NULL,
	id_usuarioModificador INT(11)                              DEFAULT NULL,
	PRIMARY KEY (id_video)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de videos';
/* */