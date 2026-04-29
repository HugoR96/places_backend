
CREATE TABLE lugares (
                id_lugar INT AUTO_INCREMENT NOT NULL,
                descripcion VARCHAR(500) NOT NULL,
                provinicia VARCHAR(100) NOT NULL,
                nombre VARCHAR(200) NOT NULL,
                direccion VARCHAR(300) NOT NULL,
                longitud DECIMAL NOT NULL,
                latitud DECIMAL NOT NULL,
                munuicipio VARCHAR(100) NOT NULL,
                departamento VARCHAR(100) NOT NULL,
                PRIMARY KEY (id_lugar)
);


CREATE TABLE fotos (
                id_fotos INT NOT NULL,
                id_lugar INT NOT NULL,
                url VARCHAR(300) NOT NULL,
                descripcion VARCHAR(200) NOT NULL,
                PRIMARY KEY (id_fotos)
);


CREATE TABLE horarios (
                id_horario INT NOT NULL,
                id_lugar INT NOT NULL,
                dia VARCHAR(50) NOT NULL,
                fin TIME NOT NULL,
                inicio TIME NOT NULL,
                PRIMARY KEY (id_horario)
);


CREATE TABLE funcionalidades (
                id_funcionalidades INT NOT NULL,
                nombre VARCHAR(100) NOT NULL,
                PRIMARY KEY (id_funcionalidades)
);


CREATE TABLE roles (
                id_rol INT AUTO_INCREMENT NOT NULL,
                nombre VARCHAR(100) NOT NULL,
                PRIMARY KEY (id_rol)
);


CREATE TABLE privilegios (
                id_rol INT NOT NULL,
                id_funcionalidades INT NOT NULL,
                PRIMARY KEY (id_rol, id_funcionalidades)
);


CREATE TABLE Personas (
                id_persona INT NOT NULL,
                nombres VARCHAR(100) NOT NULL,
                fecha_nacimiento DATE NOT NULL,
                primer_apellido VARCHAR(100) NOT NULL,
                segundo_apellido VARCHAR(100) NOT NULL,
                genero VARCHAR(50) NOT NULL,
                telefono_fijo INT NOT NULL,
                celular INT NOT NULL,
                direccion VARCHAR(200) NOT NULL,
                ci VARCHAR(50) NOT NULL,
                complemento_ci VARCHAR(100) NOT NULL,
                PRIMARY KEY (id_persona)
);


CREATE TABLE usuarios (
                id_persona INT NOT NULL,
                usuario VARCHAR(50) NOT NULL,
                contrasena VARCHAR(200) NOT NULL,
                PRIMARY KEY (id_persona)
);


CREATE UNIQUE INDEX usuarios_idx
 ON usuarios
 ( usuario );

CREATE TABLE favoritos (
                id_persona INT NOT NULL,
                id_lugar INT NOT NULL,
                PRIMARY KEY (id_persona, id_lugar)
);


CREATE TABLE comentarios (
                id_comentarios INT NOT NULL,
                id_lugar INT NOT NULL,
                id_persona INT NOT NULL,
                calificacion INT NOT NULL,
                fecha_de_comentario DATE NOT NULL,
                comentario VARCHAR(500) NOT NULL,
                id_recomentarios INT NOT NULL,
                PRIMARY KEY (id_comentarios)
);


CREATE TABLE cuentas (
                id_persona INT NOT NULL,
                id_rol INT NOT NULL,
                PRIMARY KEY (id_persona, id_rol)
);


ALTER TABLE horarios ADD CONSTRAINT lugares_horarios_fk
FOREIGN KEY (id_lugar)
REFERENCES lugares (id_lugar)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE fotos ADD CONSTRAINT lugares_fotos_fk
FOREIGN KEY (id_lugar)
REFERENCES lugares (id_lugar)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comentarios ADD CONSTRAINT lugares_comentarios_fk
FOREIGN KEY (id_lugar)
REFERENCES lugares (id_lugar)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE favoritos ADD CONSTRAINT lugares_favoritos_fk
FOREIGN KEY (id_lugar)
REFERENCES lugares (id_lugar)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE privilegios ADD CONSTRAINT funcionalidades_privilegios_fk
FOREIGN KEY (id_funcionalidades)
REFERENCES funcionalidades (id_funcionalidades)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE cuentas ADD CONSTRAINT roles_cuentas_fk
FOREIGN KEY (id_rol)
REFERENCES roles (id_rol)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE privilegios ADD CONSTRAINT roles_privilegios_fk
FOREIGN KEY (id_rol)
REFERENCES roles (id_rol)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE usuarios ADD CONSTRAINT personas_usuarios_fk
FOREIGN KEY (id_persona)
REFERENCES Personas (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE cuentas ADD CONSTRAINT usuarios_cuentas_fk
FOREIGN KEY (id_persona)
REFERENCES usuarios (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comentarios ADD CONSTRAINT usuarios_comentarios_fk
FOREIGN KEY (id_persona)
REFERENCES usuarios (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE favoritos ADD CONSTRAINT usuarios_favoritos_fk
FOREIGN KEY (id_persona)
REFERENCES usuarios (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comentarios ADD CONSTRAINT comentarios_comentarios_fk
FOREIGN KEY (id_recomentarios)
REFERENCES comentarios (id_comentarios)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
