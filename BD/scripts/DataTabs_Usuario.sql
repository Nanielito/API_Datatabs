CREATE DATABASE IF NOT EXISTS datatabs_usuario DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE datatabs_usuario;

CREATE TABLE IF NOT EXISTS tb_perfil (
	id_perfil             TINYINT(1)                         NOT NULL AUTO_INCREMENT,
	codigo                CHAR(10)   COLLATE utf8_spanish_ci NOT NULL,
	id_usuarioCreador     INT(11)                            DEFAULT NULL,
	id_usuarioModificador INT(11)                            DEFAULT NULL,
	activo                TINYINT(1)                         NOT NULL DEFAULT '1',
	PRIMARY KEY (id_perfil)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de perfiles';

CREATE TABLE IF NOT EXISTS tb_perfil_t (
	id_perfil_t           TINYINT(1)                           NOT NULL AUTO_INCREMENT,
	perfil                VARCHAR(50)  COLLATE utf8_spanish_ci NOT NULL,
	descripcion           VARCHAR(200) COLLATE utf8_spanish_ci DEFAULT NULL,
	id_perfil             TINYINT(1)                           NOT NULL,
	id_idioma             TINYINT(1)                           NOT NULL,
	id_usuarioCreador     INT(11)                              DEFAULT NULL,
	id_usuarioModificador INT(11)                              DEFAULT NULL,
	activo                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (id_perfil_t)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de perfiles';

ALTER TABLE tb_perfil_t
ADD CONSTRAINT tb_perfil_t__tb_perfil FOREIGN KEY (id_perfil) REFERENCES tb_perfil                  (id_perfil),
ADD CONSTRAINT tb_perfil_t__tb_idioma FOREIGN KEY (id_idioma) REFERENCES datatabs_general.tb_idioma (id_idioma);

CREATE TABLE IF NOT EXISTS tb_usuario (
	id_usuario            INT(11)                              NOT NULL AUTO_INCREMENT,
	usuario               VARCHAR(200) COLLATE utf8_spanish_ci NOT NULL,
    usuario_              VARCHAR(200) COLLATE utf8_spanish_ci NOT NULL,
	usuarioCorreo         VARCHAR(200) COLLATE utf8_spanish_ci DEFAULT NULL,
    usuarioCorreo_        VARCHAR(200) COLLATE utf8_spanish_ci DEFAULT NULL,
	contrasena            VARCHAR(255) COLLATE utf8_spanish_ci NOT NULL,
	fechaRegistro         DATETIME                             NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_usuarioCreador     INT(11)                              DEFAULT NULL,
	id_usuarioModificador INT(11)                              DEFAULT NULL,
	PRIMARY KEY (id_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de usuarios';

ALTER TABLE tb_usuario
ADD UNIQUE (usuario),
ADD UNIQUE (usuarioCorreo);

CREATE TABLE IF NOT EXISTS tb_sesion (
	id_sesion     INT(11)                              NOT NULL AUTO_INCREMENT,
	sesion        VARCHAR(255) COLLATE utf8_spanish_ci NOT NULL,
	fechaInicio   DATETIME                             NOT NULL DEFAULT CURRENT_TIMESTAMP,
	fechaUltimaOp DATETIME                             NOT NULL,
	id_usuario    INT(11)                              NOT NULL,
	activo        TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (id_sesion)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de sesiones';

ALTER TABLE tb_sesion
ADD CONSTRAINT tb_sesion__tb_usuario FOREIGN KEY (id_usuario) REFERENCES tb_usuario (id_usuario);

CREATE TABLE IF NOT EXISTS tb_usuarioactivo (
	id_usuarioActivo      INT(11)    NOT NULL AUTO_INCREMENT,
	id_usuario            INT(11)    NOT NULL,
	id_usuarioCreador     INT(11)    DEFAULT NULL,
	id_usuarioModificador INT(11)    DEFAULT NULL,
	activo                TINYINT(1) NOT NULL DEFAULT '1',
	PRIMARY KEY (id_usuarioActivo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para monitoreo de usuarios activos o no dentro de la aplicacion';

ALTER TABLE tb_usuarioactivo
ADD CONSTRAINT tb_usuarioactivo__tb_usuario FOREIGN KEY (id_usuario) REFERENCES tb_usuario (id_usuario);

CREATE TABLE IF NOT EXISTS tb_usuario_perfil (
	id_usuarioPerfil      INT(11)    NOT NULL AUTO_INCREMENT,
	id_usuario            INT(11)    NOT NULL,
	id_perfil             TINYINT(1) NOT NULL,
	id_usuarioCreador     INT(11)    DEFAULT NULL,
	id_usuarioModificador INT(11)    DEFAULT NULL,
	PRIMARY KEY (id_usuarioPerfil)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para asociar a un usuario con un perfil';

ALTER TABLE tb_usuario_perfil
ADD CONSTRAINT tb_usuario_perfil__tb_usuario FOREIGN KEY (id_usuario) REFERENCES tb_usuario (id_usuario),
ADD CONSTRAINT tb_usuario_perfil__tb_perfil  FOREIGN KEY (id_perfil)  REFERENCES tb_perfil  (id_perfil);

CREATE TABLE IF NOT EXISTS tb_tipousuariod (
	id_tipoUsuarioD       TINYINT(1)                         NOT NULL AUTO_INCREMENT,
	codigo                CHAR(10)   COLLATE utf8_spanish_ci NOT NULL,
	id_usuarioCreador     INT(11)                            DEFAULT NULL,
	id_usuarioModificador INT(11)                            DEFAULT NULL,
	activo                TINYINT(1)                         NOT NULL DEFAULT '1',
	PRIMARY KEY (id_tipoUsuarioD)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de tipos de usuarios';

CREATE TABLE IF NOT EXISTS tb_tipousuariod_t (
	id_tipoUsuarioD_t     TINYINT(1)                           NOT NULL AUTO_INCREMENT,
	tipoUsuarioD          VARCHAR(50)  COLLATE utf8_spanish_ci NOT NULL,
	descripcion           VARCHAR(200) COLLATE utf8_spanish_ci DEFAULT NULL,
	id_tipoUsuarioD       TINYINT(1)                           NOT NULL,
	id_idioma             TINYINT(1)                           NOT NULL,
	id_usuarioCreador     INT(11)                              DEFAULT NULL,
	id_usuarioModificador INT(11)                              DEFAULT NULL,
	activo                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (id_tipoUsuarioD_t)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para traducciones de tipos de usuario';

ALTER TABLE tb_tipousuariod_t
ADD CONSTRAINT tb_tipousuariod_t__tb_idioma       FOREIGN KEY (id_idioma)       REFERENCES datatabs_general.tb_idioma (id_idioma),
ADD CONSTRAINT tb_tipousuariod_t__tb_tipousuariod FOREIGN KEY (id_tipoUsuarioD) REFERENCES tb_tipousuariod            (id_tipoUsuarioD);

CREATE TABLE IF NOT EXISTS tb_usuariod (
	id_usuarioD           INT(11)                              NOT NULL AUTO_INCREMENT,
	identificacion        VARCHAR(25)  COLLATE utf8_spanish_ci DEFAULT NULL,
	nombres               VARCHAR(150) COLLATE utf8_spanish_ci DEFAULT NULL,
	apellidos             VARCHAR(150) COLLATE utf8_spanish_ci DEFAULT NULL,
	correo                VARCHAR(50)  COLLATE utf8_spanish_ci NOT NULL,
	tlfCasa               VARCHAR(25)  COLLATE utf8_spanish_ci DEFAULT NULL,
	tlfOficina            VARCHAR(25)  COLLATE utf8_spanish_ci DEFAULT NULL,
	tlfCelular            VARCHAR(25)  COLLATE utf8_spanish_ci DEFAULT NULL,
	avatar                VARCHAR(500) COLLATE utf8_spanish_ci DEFAULT NULL,
    id_sexo               TINYINT(1)                           NOT NULL,
	id_tipoUsuarioD       TINYINT(1)                           NOT NULL,
	id_ciudad             SMALLINT(6)                          NOT NULL,
	id_idioma             TINYINT(3)                           DEFAULT NULL,
	id_usuarioCreador     INT(11)                              DEFAULT NULL,
	id_usuarioModificador INT(11)                              DEFAULT NULL,
	activo                TINYINT(1)                           NOT NULL DEFAULT '1',
	PRIMARY KEY (id_usuarioD)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para registro de usuarios con detalles de informacion';

ALTER TABLE tb_usuariod
ADD CONSTRAINT tb_usuariod__tb_ciudad       FOREIGN KEY (id_ciudad)       REFERENCES datatabs_general.tb_ciudad (id_ciudad),
ADD CONSTRAINT tb_usuariod__tb_idioma       FOREIGN KEY (id_idioma)       REFERENCES datatabs_general.tb_idioma (id_idioma),
ADD CONSTRAINT tb_usuariod__tb_sexo         FOREIGN KEY (id_sexo)         REFERENCES datatabs_general.tb_sexo   (id_sexo),
ADD CONSTRAINT tb_usuariod__tb_tipousuariod FOREIGN KEY (id_tipoUsuarioD) REFERENCES tb_tipousuariod            (id_tipoUsuarioD);

CREATE TABLE IF NOT EXISTS tb_usuario_usuariod (
	id_usuarioUsuarioD    INT(11) NOT NULL AUTO_INCREMENT,
	id_usuario            INT(11) NOT NULL,
	id_usuarioD           INT(11) NOT NULL,
	id_usuarioCreador     INT(11) DEFAULT NULL,
	id_usuarioModificador INT(11) DEFAULT NULL,
	PRIMARY KEY (id_usuarioUsuarioD)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla para asociar a un usuario con el detalle de su informacion';

ALTER TABLE tb_usuario_usuariod
ADD CONSTRAINT tb_usuario_usuariod__tb_usuario  FOREIGN KEY (id_usuario)  REFERENCES tb_usuario  (id_usuario),
ADD CONSTRAINT tb_usuario_usuariod__tb_usuariod FOREIGN KEY (id_usuarioD) REFERENCES tb_usuariod (id_usuarioD);