-- Crear la base de datos
CREATE DATABASE RurInnova;
GO

-- Usar la base de datos recién creada
USE RurInnova;
GO

-- Crear tablas
CREATE TABLE app (
  Plataforma VARCHAR(100) NOT NULL
);


CREATE TABLE tipo_usuario (
  Nombre_Tipo VARCHAR(50) UNIQUE
);

CREATE TABLE usuario (
  Id_Usuario INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Usuario VARCHAR(100),
  Correo_Electronico VARCHAR(255),
  Id_Tipo_Usuario INT,
  FOREIGN KEY (Id_Tipo_Usuario) REFERENCES tipo_usuario(Id_Tipo_Usuario)
);

CREATE TABLE capacitacion (
  Id_Capacitacion INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Programa VARCHAR(255),
  Descripcion_Programa TEXT,
  Fecha_Inicio DATE,
  Fecha_Fin DATE,
  Institucion VARCHAR(255),
  Duracion VARCHAR(50),
  Modalidad VARCHAR(50),
  Costo DECIMAL(10,2),
  Id_Usuario INT,
  FOREIGN KEY (Id_Usuario) REFERENCES usuario(Id_Usuario)
);

CREATE TABLE categoria_negocio (
  Id_Categoria INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Categoria VARCHAR(100) NOT NULL
);

CREATE TABLE tipo_concurso (
  Id_Tipo_Concurso INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Tipo_Concurso VARCHAR(100)
);

CREATE TABLE organizacion_patrocinadora (
  Id_Organizacion INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Organizacion VARCHAR(255),
  Tipo_Organizacion VARCHAR(100),
  Responsable VARCHAR(255),
  Correo_Electronico VARCHAR(255),
  Telefono VARCHAR(50),
  Direccion VARCHAR(255),
  Fecha_Ingreso DATE,
  Descripcion TEXT
);

CREATE TABLE concurso (
  Id_Concurso INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Concurso VARCHAR(255),
  Descripcion_Concurso TEXT,
  Fecha_Lanzamiento DATE,
  Fecha_Cierre DATE,
  Premios_Ofrecidos TEXT,
  Tema_Concurso VARCHAR(100),
  Numero_Participantes INT,
  Evaluador_Responsable INT,
  Id_Organizacion INT,
  Estado_Concurso VARCHAR(50),
  Id_Tipo_Concurso INT,
  FOREIGN KEY (Evaluador_Responsable) REFERENCES usuario(Id_Usuario),
  FOREIGN KEY (Id_Organizacion) REFERENCES organizacion_patrocinadora(Id_Organizacion),
  FOREIGN KEY (Id_Tipo_Concurso) REFERENCES tipo_concurso(Id_Tipo_Concurso)
);

CREATE TABLE distrito (
  Id_Distrito INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Distrito VARCHAR(100) UNIQUE
);

CREATE TABLE direccion (
  Id_Direccion INT IDENTITY(1,1) PRIMARY KEY,
  Id_Usuario INT NOT NULL,
  Distrito VARCHAR(100) NOT NULL,
  Direccion_Completa VARCHAR(255),
  Referencia VARCHAR(255),
  Latitud DECIMAL(10,8),
  Longitud DECIMAL(11,8),
  Tipo_Direccion VARCHAR(50),
  Fecha_Registro DATE DEFAULT GETDATE(),
  Id_Distrito INT,
  FOREIGN KEY (Id_Usuario) REFERENCES usuario(Id_Usuario),
  FOREIGN KEY (Id_Distrito) REFERENCES distrito(Id_Distrito)
);

CREATE TABLE emprendedor (
  Id_Emprendedor INT IDENTITY(1,1) PRIMARY KEY,
  Id_Usuario INT NOT NULL,
  Nombre_Completo VARCHAR(255),
  Fecha_Nacimiento DATE,
  DNI VARCHAR(20),
  Telefono VARCHAR(50),
  Correo_Electronico VARCHAR(255),
  Tipo_Emprendimiento VARCHAR(100),
  Estado_Emprendimiento VARCHAR(100),
  Fecha_Registro DATE DEFAULT GETDATE(),
  Distrito_Residencia VARCHAR(100),
  Descripcion_Negocio TEXT,
  Id_Distrito INT,
  FOREIGN KEY (Id_Usuario) REFERENCES usuario(Id_Usuario),
  FOREIGN KEY (Id_Distrito) REFERENCES distrito(Id_Distrito)
);

CREATE TABLE mentor (
  Id_Mentor INT IDENTITY(1,1) PRIMARY KEY,
  Id_Usuario INT NOT NULL,
  Nombre_Completo VARCHAR(255),
  Correo_Electronico VARCHAR(255),
  Telefono VARCHAR(50),
  Area_Especializacion VARCHAR(100),
  Años_Experiencia INT,
  Tipo_Mentoria VARCHAR(100),
  Fecha_Registro DATE DEFAULT GETDATE(),
  Numero_Sesiones_Mentoria INT DEFAULT 0,
  FOREIGN KEY (Id_Usuario) REFERENCES usuario(Id_Usuario)
);

CREATE TABLE curso (
  Id_Curso INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Curso VARCHAR(255),
  Descripcion_Curso TEXT,
  Area_Especializacion VARCHAR(100),
  Duracion VARCHAR(50),
  Nivel VARCHAR(50),
  Fecha_Inicio DATE,
  Fecha_Fin DATE,
  Instructor INT,
  Id_Capacitacion INT,
  FOREIGN KEY (Instructor) REFERENCES mentor(Id_Mentor),
  FOREIGN KEY (Id_Capacitacion) REFERENCES capacitacion(Id_Capacitacion)
);

CREATE TABLE estado_cuenta (
  Id_Estado INT IDENTITY(1,1) PRIMARY KEY,
  Estado VARCHAR(50) UNIQUE
);

CREATE TABLE eventos (
  Id_Evento INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Evento VARCHAR(255),
  Fecha_Evento DATE,
  Descripcion TEXT,
  Lugar VARCHAR(255)
);

CREATE TABLE facturacion (
  Id_Factura INT IDENTITY(1,1) PRIMARY KEY,
  Id_Emprendedor INT,
  Monto DECIMAL(10,2),
  Fecha_Factura DATE,
  Metodo_Pago VARCHAR(100),
  Estado_Pago VARCHAR(50),
  FOREIGN KEY (Id_Emprendedor) REFERENCES emprendedor(Id_Emprendedor)
);

CREATE TABLE feedback (
  Id_Feedback INT IDENTITY(1,1) PRIMARY KEY,
  Id_Usuario INT,
  Id_Emprendedor INT,
  Comentario TEXT,
  Valoracion INT,
  Fecha_Feedback DATE,
  FOREIGN KEY (Id_Usuario) REFERENCES usuario(Id_Usuario),
  FOREIGN KEY (Id_Emprendedor) REFERENCES emprendedor(Id_Emprendedor)
);

CREATE TABLE historico_emprendimiento (
  Id_Historico INT IDENTITY(1,1) PRIMARY KEY,
  Id_Emprendedor INT,
  Nombre_Negocio VARCHAR(255),
  Fecha_Inicio DATE,
  Fecha_Fin DATE,
  Estado VARCHAR(100),
  Descripcion TEXT,
  FOREIGN KEY (Id_Emprendedor) REFERENCES emprendedor(Id_Emprendedor)
);

CREATE TABLE negocio (
  Id_Negocio INT IDENTITY(1,1) PRIMARY KEY,
  Id_Emprendedor INT NOT NULL,
  Nombre_Negocio VARCHAR(255),
  Descripcion_Negocio TEXT,
  Tipo_Negocio VARCHAR(100),
  Estado_Negocio VARCHAR(100),
  Capital_Recibido DECIMAL(10,2),
  Fecha_Registro DATE DEFAULT GETDATE(),
  Monto_Objetivo DECIMAL(10,2),
  Fecha_Ultima_Actualizacion DATE,
  Id_Categoria INT,
  FOREIGN KEY (Id_Emprendedor) REFERENCES emprendedor(Id_Emprendedor),
  FOREIGN KEY (Id_Categoria) REFERENCES categoria_negocio(Id_Categoria)
);

CREATE TABLE premios_concurso (
  Id_Premio INT IDENTITY(1,1) PRIMARY KEY,
  Id_Concurso INT NOT NULL,
  Premio VARCHAR(255),
  Descripcion TEXT,
  FOREIGN KEY (Id_Concurso) REFERENCES concurso(Id_Concurso)
);

CREATE TABLE recursos (
  Id_Recurso INT IDENTITY(1,1) PRIMARY KEY,
  Tipo_Recurso VARCHAR(50),
  Titulo VARCHAR(255),
  Descripcion TEXT,
  Formato VARCHAR(50),
  Tamaño VARCHAR(50),
  Fecha_Publicacion DATE,
  Tamaño_Descarga VARCHAR(50),
  Id_Usuario INT,
  FOREIGN KEY (Id_Usuario) REFERENCES usuario(Id_Usuario)
);

CREATE TABLE redes_sociales (
  Id_Redes INT IDENTITY(1,1) PRIMARY KEY,
  Id_Usuario INT,
  Red_Social VARCHAR(100),
  Link_Red_Social VARCHAR(255),
  FOREIGN KEY (Id_Usuario) REFERENCES usuario(Id_Usuario)
);

CREATE TABLE sesion_mentoria (
  Id_Sesion INT IDENTITY(1,1) PRIMARY KEY,
  Id_Mentor INT NOT NULL,
  Id_Emprendedor INT NOT NULL,
  Fecha_Sesion DATE,
  Duracion VARCHAR(50),
  Tipo_Sesion VARCHAR(50),
  Objetivo TEXT,
  Tema_Trata VARCHAR(255),
  Comentarios_FinSesion TEXT,
  FOREIGN KEY (Id_Mentor) REFERENCES mentor(Id_Mentor),
  FOREIGN KEY (Id_Emprendedor) REFERENCES emprendedor(Id_Emprendedor)
);
