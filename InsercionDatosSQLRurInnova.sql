USE RURINNOVA
GO

--REGISTRO DE INSERT (DATOS)
SELECT * FROM TIPO_USUARIO --> COMPLETO
SELECT * FROM USUARIO --> COMPLETO
SELECT * FROM CATEGORIA_NEGOCIO --> COMPLETO
SELECT * FROM TIPO_CONCURSO --> COMPLETO
SELECT * FROM ORGANIZACION_PATROCINADORA  --> COMPLETO
SELECT * FROM CONCURSO  --> COMPLETO
SELECT * FROM DISTRITO --> COMPLETO
SELECT * FROM EMPRENDEDOR  --> COMPLETO
SELECT * FROM FACTURACION  --> COMPLETO
SELECT * FROM CAPACITACION  --> COMPLETO
SELECT * FROM FEEDBACK  --> COMPLETO
SELECT * FROM HISTORICO_EMPRENDIMIENTO --> COMPLETO
SELECT * FROM NEGOCIO  --> COMPLETO
SELECT * FROM PREMIOS_CONCURSO --> COMPLETO
SELECT * FROM MENTOR --> COMPLETO
SELECT * FROM SESION_MENTORIA --> COMPLETO
SELECT * FROM DIRECCION  --> COMPLETO
SELECT * FROM CURSO  --> COMPLETO
SELECT * FROM RECURSOS --> COMPLETO
SELECT * FROM REDES_SOCIALES --> COMPLETO

-- I M P O R T A N T E --
-- EN CASO DE FALLA PORQUE LA ID AUTOMATICA EMPIEZE EN OTRO NUMERO QUE NO SEA 1
-- EEMPLAZAR EL [NOMBRE] POR EL NOMBRE DE LA TABLA, ACTUALIZAN EL SEED, BORRAN LA TABLA Y VUELVEN A INGRESAR EL INSERT

DBCC CHECKIDENT('nombre de la tabla', RESEED, 0);
DELETE FROM usuario

-- EMPIECE EL EXECUTE DESDE AQUÍ --
-- TIPO USUARIO --
INSERT INTO tipo_usuario (Nombre_Tipo) VALUES ('Mentor');
INSERT INTO tipo_usuario (Nombre_Tipo) VALUES ('Emprendedor');
INSERT INTO tipo_usuario (Nombre_Tipo) VALUES ('Administrador');
INSERT INTO tipo_usuario (Nombre_Tipo) VALUES ('Usuario');
INSERT INTO tipo_usuario (Nombre_Tipo) VALUES ('Invitado');
INSERT INTO tipo_usuario (Nombre_Tipo) VALUES ('Evaluador');
INSERT INTO tipo_usuario (Nombre_Tipo) VALUES ('Visitante');
INSERT INTO tipo_usuario (Nombre_Tipo) VALUES ('Gestor');
INSERT INTO tipo_usuario (Nombre_Tipo) VALUES ('Analista');
INSERT INTO tipo_usuario (Nombre_Tipo) VALUES ('Facilitador');

-- USUARIO --
INSERT INTO usuario (Nombre_Usuario, Correo_Electronico, Id_Tipo_Usuario) VALUES ('Roldán Casanovas', 'roldán.casanovas@gmail.com', 8);
INSERT INTO usuario (Nombre_Usuario, Correo_Electronico, Id_Tipo_Usuario) VALUES ('Julia Fortuny', 'julia.fortuny@gmail.com', 2);
INSERT INTO usuario (Nombre_Usuario, Correo_Electronico, Id_Tipo_Usuario) VALUES ('Toribio Sáez', 'toribio.saez@gmail.com', 6);
INSERT INTO usuario (Nombre_Usuario, Correo_Electronico, Id_Tipo_Usuario) VALUES ('Carina Zurita', 'carina.zurita@gmail.com', 10);
INSERT INTO usuario (Nombre_Usuario, Correo_Electronico, Id_Tipo_Usuario) VALUES ('María Fernanda Coca', 'maría fernanda.coca@gmail.com', 9);
INSERT INTO usuario (Nombre_Usuario, Correo_Electronico, Id_Tipo_Usuario) VALUES ('Benita Montero', 'benita.montero@gmail.com', 4);
INSERT INTO usuario (Nombre_Usuario, Correo_Electronico, Id_Tipo_Usuario) VALUES ('Augusto Carretero', 'augusto.carretero@gmail.com', 5);
INSERT INTO usuario (Nombre_Usuario, Correo_Electronico, Id_Tipo_Usuario) VALUES ('Aránzazu Durán', 'aránzazu.durán@gmail.com', 8);
INSERT INTO usuario (Nombre_Usuario, Correo_Electronico, Id_Tipo_Usuario) VALUES ('Basilio Ayuso', 'basilio.ayuso@gmail.com', 7);
INSERT INTO usuario (Nombre_Usuario, Correo_Electronico, Id_Tipo_Usuario) VALUES ('Juan José Millán', 'juan josé.millán@gmail.com', 8);

-- CATEGORÍA_NEGOCIO --
INSERT INTO categoria_negocio (Nombre_Categoria) VALUES ('Emprendimiento');
INSERT INTO categoria_negocio (Nombre_Categoria) VALUES ('Negocio');
INSERT INTO categoria_negocio (Nombre_Categoria) VALUES ('Startup');
INSERT INTO categoria_negocio (Nombre_Categoria) VALUES ('Comercio');
INSERT INTO categoria_negocio (Nombre_Categoria) VALUES ('Servicios');
INSERT INTO categoria_negocio (Nombre_Categoria) VALUES ('Tecnología');
INSERT INTO categoria_negocio (Nombre_Categoria) VALUES ('Agricultura');
INSERT INTO categoria_negocio (Nombre_Categoria) VALUES ('Salud');
INSERT INTO categoria_negocio (Nombre_Categoria) VALUES ('Educación');
INSERT INTO categoria_negocio (Nombre_Categoria) VALUES ('Turismo');

-- TIPO_CONCURSO --
INSERT INTO tipo_concurso (Nombre_Tipo_Concurso) VALUES ('Presencial');
INSERT INTO tipo_concurso (Nombre_Tipo_Concurso) VALUES ('Virtual');
INSERT INTO tipo_concurso (Nombre_Tipo_Concurso) VALUES ('Híbrido');
INSERT INTO tipo_concurso (Nombre_Tipo_Concurso) VALUES ('Semipresencial');
INSERT INTO tipo_concurso (Nombre_Tipo_Concurso) VALUES ('Internacional');
INSERT INTO tipo_concurso (Nombre_Tipo_Concurso) VALUES ('Nacional');
INSERT INTO tipo_concurso (Nombre_Tipo_Concurso) VALUES ('Regional');
INSERT INTO tipo_concurso (Nombre_Tipo_Concurso) VALUES ('Local');
INSERT INTO tipo_concurso (Nombre_Tipo_Concurso) VALUES ('Sectorial');
INSERT INTO tipo_concurso (Nombre_Tipo_Concurso) VALUES ('Interuniversitario');

-- ORGANIZACIÓN PATROCINADORA --
INSERT INTO organizacion_patrocinadora (Nombre_Organizacion, Tipo_Organizacion, Responsable, Correo_Electronico, Telefono, Direccion, Fecha_Ingreso, Descripcion) VALUES ('Vilaplana LLC', 'Institución Pública', 'Álvaro de Zamorano', 'jmatas@aliaga.com', '+34710 69 19 05', 'Paseo de Marisa Barrio 6 Puerta 5 , Asturias, 05320', '2021-03-18', 'Desarrollo de proyectos rurales.');
INSERT INTO organizacion_patrocinadora (Nombre_Organizacion, Tipo_Organizacion, Responsable, Correo_Electronico, Telefono, Direccion, Fecha_Ingreso, Descripcion) VALUES ('Pons Ltd', 'Institución Pública', 'Carolina Casal-Perales', 'calisto94@paez.org', '+34737 01 44 27', 'Plaza Azeneth Barberá 64 Piso 2 , Vizcaya, 92699', '2020-08-07', 'Impulso de iniciativas públicas.');
INSERT INTO organizacion_patrocinadora (Nombre_Organizacion, Tipo_Organizacion, Responsable, Correo_Electronico, Telefono, Direccion, Fecha_Ingreso, Descripcion) VALUES ('Antúnez-Rivas', 'Empresa', 'Carmina Juliana Duque Pozo', 'hugoalberdi@gmail.com', '+34 737 333 237', 'Avenida Mariana Ayala 69, Cádiz, 03300', '2021-02-10', 'Apoyo a emprendedores rurales.');
INSERT INTO organizacion_patrocinadora (Nombre_Organizacion, Tipo_Organizacion, Responsable, Correo_Electronico, Telefono, Direccion, Fecha_Ingreso, Descripcion) VALUES ('Ferrández PLC', 'Empresa', 'Adoración Úrsula Valencia Robledo', 'leocadiacanovas@hotmail.com', '+34743 64 52 02', 'Ronda de Trinidad Acero 38, Huelva, 90442', '2020-03-07', 'Soluciones empresariales innovadoras.');
INSERT INTO organizacion_patrocinadora (Nombre_Organizacion, Tipo_Organizacion, Responsable, Correo_Electronico, Telefono, Direccion, Fecha_Ingreso, Descripcion) VALUES ('Sotelo-Alonso', 'ONG', 'Artemio Rodríguez Heras', 'escrivaaura@gmail.com', '+34 625 16 73 85', 'Urbanización Desiderio Cerdán 11 Piso 9 , Zaragoza, 43891', '2025-01-09', 'Promoción de proyectos sociales.');
INSERT INTO organizacion_patrocinadora (Nombre_Organizacion, Tipo_Organizacion, Responsable, Correo_Electronico, Telefono, Direccion, Fecha_Ingreso, Descripcion) VALUES ('Benet, Vives and Almagro', 'ONG', 'Domingo Roldán Benavides', 'valentin66@yahoo.com', '+34706 646 114', 'Cuesta de Priscila Diéguez 55, Santa Cruz de Tenerife, 65440', '2021-02-17', 'Asesoría para organizaciones no gubernamentales.');
INSERT INTO organizacion_patrocinadora (Nombre_Organizacion, Tipo_Organizacion, Responsable, Correo_Electronico, Telefono, Direccion, Fecha_Ingreso, Descripcion) VALUES ('Cervantes Ltd', 'Institución Pública', 'Viviana Franco Abellán', 'ema56@ortiz.com', '+34 704212077', 'Rambla de Victor Guzmán 20, Lugo, 34999', '2024-11-17', 'Cooperación institucional pública.');
INSERT INTO organizacion_patrocinadora (Nombre_Organizacion, Tipo_Organizacion, Responsable, Correo_Electronico, Telefono, Direccion, Fecha_Ingreso, Descripcion) VALUES ('Priego Inc', 'Institución Pública', 'Lupe Bru Vallejo', 'pinedanydia@hotmail.com', '+34724 36 15 98', 'Callejón Adrián Aguado 15, Pontevedra, 46749', '2024-12-24', 'Fortalecimiento de entidades locales.');
INSERT INTO organizacion_patrocinadora (Nombre_Organizacion, Tipo_Organizacion, Responsable, Correo_Electronico, Telefono, Direccion, Fecha_Ingreso, Descripcion) VALUES ('Bermejo-Aroca', 'Empresa', 'Maximiano Abellán Feijoo', 'anacleto71@borras.com', '+34 707973140', 'Ronda Javier Duque 4 Apt. 28 , Almería, 74609', '2021-10-02', 'Innovación y emprendimiento empresarial.');
INSERT INTO organizacion_patrocinadora (Nombre_Organizacion, Tipo_Organizacion, Responsable, Correo_Electronico, Telefono, Direccion, Fecha_Ingreso, Descripcion) VALUES ('Martin-Jove', 'Empresa', 'Moreno Herrero Calderon', 'caminoamalia@hotmail.com', '+34704 222 381', 'Cañada de Itziar Lloret 28 Puerta 7 , Palencia, 25515', '2020-08-19', 'Apoyo y mentoría a pequeñas empresas.');

-- CONCURSO --
INSERT INTO concurso (Nombre_Concurso, Descripcion_Concurso, Fecha_Lanzamiento, Fecha_Cierre, Premios_Ofrecidos, Tema_Concurso, Numero_Participantes, Evaluador_Responsable, Id_Organizacion, Estado_Concurso, Id_Tipo_Concurso)
VALUES
('Reto Innovación Rural I', 'Propuestas de tecnologías para zonas rurales.', '2025-01-01', '2025-02-15', 'Equipos, mentorías', 'Tecnología rural', 20, 1, 1, 'Cerrado', 1),
('Reto Innovación Rural II', 'Equipos de hardware open-source.', '2025-03-01', '2025-04-15', 'Kits, becas', 'Hardware libre', 25, 2, 1, 'Cerrado', 1),
('Concurso Agro Sostenible', 'Soluciones para agricultura sostenible.', '2025-05-01', '2025-06-15', 'Capital semilla', 'Agroecología', 30, 3, 2, 'Abierto', 2),
('Desafío Energía Limpia', 'Innovación en energías renovables.', '2025-07-01', '2025-08-15', 'Paneles solares', 'Energías', 40, 4, 2, 'Planificado', 2),
('Hackathon Rural', 'Desarrollo de apps para agricultura.', '2025-09-01', '2025-09-05', 'Premios en metálico', 'Software', 50, 5, 3, 'Planificado', 3),
('Innova Ganadera', 'Tecnologías para ganadería inteligente.', '2025-10-01', '2025-11-15', 'Drones, sensores', 'Ganadería', 35, 1, 3, 'Planificado', 2),
('Smart Riego', 'Sistemas de riego automatizado.', '2025-11-20', '2025-12-31', 'Kits IoT', 'IoT', 28, 2, 4, 'Planificado', 1),
('Biofertilizantes', 'Desarrollo de fertilizantes orgánicos.', '2026-01-10', '2026-02-25', 'Laboratorios', 'Biotecnología', 22, 3, 4, 'Planificado', 2),
('EcoConstrucción', 'Materiales de construcción ecológicos.', '2026-03-01', '2026-04-15', 'Talleres', 'Construcción', 18, 4, 5, 'Planificado', 3),
('Telemedicina Rural', 'Servicios médicos remotos.', '2026-05-01', '2026-06-15', 'Equipos médicos', 'Salud', 45, 5, 5, 'Planificado', 2);

-- DISTRITO --
INSERT INTO distrito (Nombre_Distrito) VALUES ('Miraflores');
INSERT INTO distrito (Nombre_Distrito) VALUES ('San Isidro');
INSERT INTO distrito (Nombre_Distrito) VALUES ('Barranco');
INSERT INTO distrito (Nombre_Distrito) VALUES ('Surco');
INSERT INTO distrito (Nombre_Distrito) VALUES ('La Molina');
INSERT INTO distrito (Nombre_Distrito) VALUES ('San Borja');
INSERT INTO distrito (Nombre_Distrito) VALUES ('San Miguel');
INSERT INTO distrito (Nombre_Distrito) VALUES ('Pueblo Libre');
INSERT INTO distrito (Nombre_Distrito) VALUES ('Jesús María');
INSERT INTO distrito (Nombre_Distrito) VALUES ('Lince');

-- EMPRENDEDOR --
INSERT INTO emprendedor (Id_Usuario, Nombre_Completo, Fecha_Nacimiento, DNI, Telefono, Correo_Electronico, Tipo_Emprendimiento, Estado_Emprendimiento, Fecha_Registro, Distrito_Residencia, Descripcion_Negocio, Id_Distrito)
VALUES
(1, 'Ana López Pérez', '1990-03-15', '12345678', '+51 912345678', 'ana.lopez@example.com', 'Comercio', 'Activo', '2024-01-10', 'Miraflores', 'Artesanías locales.', 1),
(2, 'Carlos Díaz Ramírez', '1985-11-22', '87654321', '+51 987654321', 'carlos.diaz@example.com', 'Servicios', 'Activo', '2025-02-05', 'Surco', 'Marketing digital.', 2),
(3, 'Lucía Morales Vega', '1992-07-08', '11223344', '+51 934567890', 'lucia.vega@example.com', 'Agricultura', 'Activo', '2025-03-12', 'Barranco', 'Hortalizas ecológicas.', 3),
(4, 'Miguel Torres Huerta', '1988-01-20', '55667788', '+51 945678901', 'miguel.huerta@example.com', 'Tecnología', 'Activo', '2025-04-18', 'San Isidro', 'Soluciones IoT.', 4),
(5, 'María Gonzales Paredes', '1991-12-05', '66778899', '+51 956789012', 'maria.paredes@example.com', 'Educación', 'Activo', '2025-05-22', 'Lince', 'Plataforma e-learning.', 5),
(6, 'José Ramírez Salas', '1987-09-30', '77889900', '+51 967890123', 'jose.salas@example.com', 'Salud', 'Activo', '2025-06-01', 'Jesus María', 'Clínica móvil.', 6),
(7, 'Patricia Flores Soto', '1993-02-14', '88990011', '+51 978901234', 'patricia.soto@example.com', 'Turismo', 'Activo', '2025-06-10', 'Callao', 'Tours rurales.', 7),
(8, 'Ricardo Paredes León', '1989-05-21', '99001122', '+51 989012345', 'ricardo.leon@example.com', 'Gastronomía', 'Activo', '2025-06-12', 'Lima', 'Restaurante orgánico.', 8),
(9, 'Elena Castro Moya', '1994-11-11', '10011001', '+51 990123456', 'elena.moya@example.com', 'Moda', 'Activo', '2025-06-13', 'Chorrillos', 'Ropa artesanal.', 9),
(10,'Diego Vega Ruiz', '1990-08-17', '11001100', '+51 991234567', 'diego.ruiz@example.com', 'Logística', 'Activo', '2025-06-14', 'Pueblo Libre', 'Transporte rural.', 10);

-- FACTURACION --
INSERT INTO facturacion (Id_Emprendedor, Monto, Fecha_Factura, Metodo_Pago, Estado_Pago)
VALUES
(1,1500,'2025-06-01','Tarjeta','Pagado'),
(2,2000.5,'2025-06-02','Transferencia','Pendiente'),
(3,250.75,'2025-06-03','Efectivo','Pagado'),
(4,300,'2025-06-04','Yape','Pagado'),
(5,500.2,'2025-06-05','Plin','Pendiente'),
(6,750,'2025-06-06','Tarjeta','Pagado'),
(7,1200,'2025-06-07','Transferencia','Pagado'),
(8,980.9,'2025-06-08','Efectivo','Pendiente'),
(9,1100,'2025-06-09','Yape','Pagado'),
(10,1300,'2025-06-10','Plin','Pendiente');

-- CAPACITACION --
INSERT INTO capacitacion (Nombre_Programa, Descripcion_Programa, Fecha_Inicio, Fecha_Fin, Institucion, Duracion, Modalidad, Costo, Id_Usuario)
VALUES
('Emprendimiento Digital', 'Formación integral sobre negocios digitales.', '2023-01-15', '2023-04-15', 'Universidad Nacional Mayor de San Marcos', '3 meses', 'Virtual', 1200.00, 1),
('Gestión Financiera', 'Curso sobre administración y gestión financiera.', '2023-03-01', '2023-06-01', 'Universidad del Pacífico', '3 meses', 'Presencial', 2500.50, 2),
('Innovación Empresarial', 'Capacitación sobre procesos innovadores en empresas.', '2022-07-10', '2022-10-10', 'PUCP', '3 meses', 'Semipresencial', 1800.75, 3),
('Marketing Digital', 'Herramientas y técnicas para el marketing online.', '2022-09-20', '2022-12-20', 'UTEC', '3 meses', 'Virtual', 2000.00, 4),
('Ventas Estratégicas', 'Curso especializado en técnicas de venta moderna.', '2022-11-01', '2023-02-01', 'ESAN', '3 meses', 'Presencial', 2200.30, 5),
('Tecnologías Emergentes', 'Aprendizaje de nuevas tecnologías aplicadas al negocio.', '2023-05-05', '2023-08-05', 'UPC', '3 meses', 'Virtual', 1500.00, 6),
('Gestión del Talento Humano', 'Desarrollo de habilidades en gestión de personas.', '2023-02-10', '2023-05-10', 'Universidad de Lima', '3 meses', 'Presencial', 1900.00, 7),
('Liderazgo Empresarial', 'Desarrollo de competencias de liderazgo empresarial.', '2023-04-15', '2023-07-15', 'Universidad Continental', '3 meses', 'Virtual', 1700.00, 8),
('Economía Circular', 'Introducción a la sostenibilidad y economía circular.', '2023-06-20', '2023-09-20', 'Universidad Cayetano Heredia', '3 meses', 'Semipresencial', 1600.00, 9),
('Logística Internacional', 'Curso práctico sobre procesos logísticos globales.', '2023-08-01', '2023-11-01', 'USIL', '3 meses', 'Presencial', 2100.50, 10);

-- FEEDBACK --
INSERT INTO feedback (Id_Usuario, Id_Emprendedor, Comentario, Valoracion, Fecha_Feedback)
VALUES
(1,1,'Excelente servicio.',5,'2025-06-01'),
(2,2,'Buena mentoría.',4,'2025-06-02'),
(3,3,'Respuesta rápida.',5,'2025-06-03'),
(4,4,'Información clara.',4,'2025-06-04'),
(5,5,'Atención personalizada.',5,'2025-06-05'),
(6,6,'Muy recomendable.',4,'2025-06-06'),
(7,7,'Plataforma intuitiva.',5,'2025-06-07'),
(8,8,'Interfaz amigable.',4,'2025-06-08'),
(9,9,'Contenido útil.',5,'2025-06-09'),
(10,10,'Navegación sencilla.',4,'2025-06-10');

-- HISTORICO EMPRENDIMIENTO --
INSERT INTO historico_emprendimiento (Id_Emprendedor, Nombre_Negocio, Fecha_Inicio, Fecha_Fin, Estado, Descripcion)
VALUES
(1,'Artesanías López','2024-01-15','2025-01-15','Finalizado','Éxito en feria'),
(2,'Digital Díaz','2025-02-10','2026-02-10','En curso','Expansión online'),
(3,'Eco Huertos','2023-03-01','2024-03-01','Finalizado','Ventas estables'),
(4,'IoT Smart','2025-04-01','2026-04-01','En curso','Alianzas nuevas'),
(5,'E-Learning Plus','2025-05-01','2026-05-01','En curso','Crecimiento usuarios'),
(6,'Clínica Móvil','2025-06-01','2026-06-01','En curso','Rutas ampliadas'),
(7,'Rutas Turísticas','2025-06-02','2026-06-02','En curso','Buenas reseñas'),
(8,'Orgánico Food','2025-06-03','2026-06-03','En curso','Nuevos distribuidores'),
(9,'Moda Andina','2025-06-04','2026-06-04','En curso','Expansión ventas'),
(10,'LogiRural','2025-06-05','2026-06-05','En curso','Optimización rutas');

-- NEGOCIO --
INSERT INTO negocio (Id_Emprendedor, Nombre_Negocio, Descripcion_Negocio, Tipo_Negocio, Estado_Negocio, Capital_Recibido, Monto_Objetivo, Fecha_Ultima_Actualizacion, Id_Categoria)
VALUES
(1,'López Artesanías','Productos hechos a mano','Local','Activo',5000,10000,'2025-06-01',1),
(2,'Marketing Díaz','Servicios de marketing','Regional','Activo',3000,8000,'2025-06-02',2),
(3,'Huertos Verdes','Venta de hortalizas','Local','Activo',2000,5000,'2025-06-03',3),
(4,'IoT Rural','Soluciones IoT','Nacional','Activo',6000,12000,'2025-06-04',4),
(5,'Educa Plus','Plataforma educativa','Regional','Activo',4000,9000,'2025-06-05',5),
(6,'Salud en Ruta','Clínica móvil','Local','Activo',7000,15000,'2025-06-06',6),
(7,'Tours Rurales','Turismo rural','Local','Activo',2500,6000,'2025-06-07',7),
(8,'Orgánico Market','Comercio orgánico','Nacional','Activo',5500,11000,'2025-06-08',8),
(9,'Moda Andina','Ropa artesanal','Local','Activo',3500,7000,'2025-06-09',9),
(10,'LogiRural','Transporte rural','Regional','Activo',4500,8500,'2025-06-10',10);

-- PREMIOS CONCURSO --
INSERT INTO premios_concurso (Id_Concurso, Premio, Descripcion)
VALUES
(1,'Innovadores Destacados','Top 3 proyectos.'),
(2,'Beca Completa','Formación empresarial.'),
(3,'Kit Tecnológico','Equipos de desarrollo.'),
(4,'Capital Semilla','Financiamiento inicial.'),
(5,'Mentoría VIP','Asesoría personalizada.'),
(6,'Viaje de Estudio','Visita de aprendizaje.'),
(7,'Publicación','Difusión mediática.'),
(8,'Networking','Acceso a inversores.'),
(9,'Certificación','Curso especializado.'),
(10,'Premio Popular','Voto del público.');

-- MENTOR --
INSERT INTO mentor (Id_Usuario, Nombre_Completo, Correo_Electronico, Telefono, Area_Especializacion, Años_Experiencia, Tipo_Mentoria, Fecha_Registro, Numero_Sesiones_Mentoria) VALUES (3, 'Guiomar Segura Montaña', 'armando98@salgado-arevalo.com', '+51 912345678', 'Representación turística', 6, 'Técnica', '2023-06-18', 15);
INSERT INTO mentor (Id_Usuario, Nombre_Completo, Correo_Electronico, Telefono, Area_Especializacion, Años_Experiencia, Tipo_Mentoria, Fecha_Registro, Numero_Sesiones_Mentoria) VALUES (10, 'Úrsula Benito Diez', 'gduran@checa-giner.net', '+51 987654321', 'Podología', 8, 'Marketing', '2021-06-24', 8);
INSERT INTO mentor (Id_Usuario, Nombre_Completo, Correo_Electronico, Telefono, Area_Especializacion, Años_Experiencia, Tipo_Mentoria, Fecha_Registro, Numero_Sesiones_Mentoria) VALUES (5, 'Emiliana Arteaga Carpio', 'vayuso@saavedra-cifuentes.es', '+51 934567890', 'Agricultura ecológica', 18, 'Técnica', '2024-09-06', 4);
INSERT INTO mentor (Id_Usuario, Nombre_Completo, Correo_Electronico, Telefono, Area_Especializacion, Años_Experiencia, Tipo_Mentoria, Fecha_Registro, Numero_Sesiones_Mentoria) VALUES (1, 'Filomena Albero Rey', 'rleiva@castrillo-alberto.es', '+51 945678901', 'Energías renovables', 14, 'Técnica', '2022-12-11', 10);
INSERT INTO mentor (Id_Usuario, Nombre_Completo, Correo_Electronico, Telefono, Area_Especializacion, Años_Experiencia, Tipo_Mentoria, Fecha_Registro, Numero_Sesiones_Mentoria) VALUES (2, 'Ignacia Armas Lerma', 'sergio46@aguilera.es', '+51 956789012', 'Marketing digital', 4, 'Marketing', '2021-07-23', 1);
INSERT INTO mentor (Id_Usuario, Nombre_Completo, Correo_Electronico, Telefono, Area_Especializacion, Años_Experiencia, Tipo_Mentoria, Fecha_Registro, Numero_Sesiones_Mentoria) VALUES (6, 'Marcial Adán Carbonell', 'quintanavictoria@somoza.org', '+51 967890123', 'Turismo rural', 7, 'Marketing', '2022-05-28', 2);
INSERT INTO mentor (Id_Usuario, Nombre_Completo, Correo_Electronico, Telefono, Area_Especializacion, Años_Experiencia, Tipo_Mentoria, Fecha_Registro, Numero_Sesiones_Mentoria) VALUES (7, 'Pepita Jove Canals', 'eliana05@hotmail.com', '+51 978901234', 'Salud pública', 14, 'Marketing', '2022-10-10', 10);
INSERT INTO mentor (Id_Usuario, Nombre_Completo, Correo_Electronico, Telefono, Area_Especializacion, Años_Experiencia, Tipo_Mentoria, Fecha_Registro, Numero_Sesiones_Mentoria) VALUES (5, 'Anastasio Mate-Sánchez', 'wbravo@jerez-carrion.es', '+51 989012345', 'Logística', 19, 'Técnica', '2020-07-23', 1);
INSERT INTO mentor (Id_Usuario, Nombre_Completo, Correo_Electronico, Telefono, Area_Especializacion, Años_Experiencia, Tipo_Mentoria, Fecha_Registro, Numero_Sesiones_Mentoria) VALUES (6, 'Alejo Asenjo Juárez', 'bartolomegascon@heredia.es', '+51 990123456', 'Finanzas', 20, 'Marketing', '2023-11-11', 12);
INSERT INTO mentor (Id_Usuario, Nombre_Completo, Correo_Electronico, Telefono, Area_Especializacion, Años_Experiencia, Tipo_Mentoria, Fecha_Registro, Numero_Sesiones_Mentoria) VALUES (5, 'Itziar Garay Lluch', 'ncarrasco@ponce.com', '+51 991234567', 'Recursos humanos', 10, 'Marketing', '2021-03-01', 10);

-- SESION MENTORIA --
INSERT INTO sesion_mentoria (Id_Mentor, Id_Emprendedor, Fecha_Sesion, Duracion, Tipo_Sesion, Objetivo, Tema_Trata, Comentarios_FinSesion)
VALUES
(1,1,'2025-06-01','60 min','Virtual','Definir metas','Planificación','Excelente avance'),
(2,2,'2025-06-02','45 min','Presencial','Estrategia','Marketing','Buen enfoque'),
(3,3,'2025-06-03','30 min','Virtual','Finanzas','Presupuesto','Claridad obtenida'),
(4,4,'2025-06-04','60 min','Presencial','Ventas','Canales','Metas claras'),
(5,5,'2025-06-05','50 min','Virtual','Operaciones','Logística','Mejoras siguientes'),
(6,6,'2025-06-06','40 min','Virtual','Producto','MVP','Feedback útil'),
(7,7,'2025-06-07','45 min','Presencial','Clientes','Segmentación','Discusión activa'),
(8,8,'2025-06-08','60 min','Virtual','Tecnología','Integraciones','Rumbo definido'),
(9,9,'2025-06-09','30 min','Virtual','Legal','Contratos','Dudas aclaradas'),
(10,10,'2025-06-10','55 min','Presencial','Crecimiento','Escalabilidad','Próximos pasos');

-- DIRECCIÓN --
INSERT INTO direccion (Id_Usuario, Distrito, Direccion_Completa, Referencia, Latitud, Longitud, Tipo_Direccion, Fecha_Registro, Id_Distrito) VALUES (4, 'Pueblo Libre', 'Callejón de Máxima León 59 Piso 1 , Lleida, 30832', 'Paseo de Pastora Pedrosa', -11.85968751, -77.0238595, 'Residencial', '2020-12-26', 8);
INSERT INTO direccion (Id_Usuario, Distrito, Direccion_Completa, Referencia, Latitud, Longitud, Tipo_Direccion, Fecha_Registro, Id_Distrito) VALUES (4, 'Jesús María', 'Plaza de Mercedes Cardona 90, Ceuta, 90713', 'Pasadizo Adora Sáenz', -12.18712418, -76.9527555, 'Residencial', '2021-06-23', 6);
INSERT INTO direccion (Id_Usuario, Distrito, Direccion_Completa, Referencia, Latitud, Longitud, Tipo_Direccion, Fecha_Registro, Id_Distrito) VALUES (2, 'San Isidro', 'Vial Modesto Figuerola 2, Guipúzcoa, 52167', 'Cañada Griselda Busquets', -11.92291369, -77.00239662, 'Residencial', '2021-07-02', 5);
INSERT INTO direccion (Id_Usuario, Distrito, Direccion_Completa, Referencia, Latitud, Longitud, Tipo_Direccion, Fecha_Registro, Id_Distrito) VALUES (4, 'Jesús María', 'Calle Nilo Alfonso 520, Castellón, 38353', 'Camino de Basilio Pujadas', -11.83323013, -76.82129696, 'Comercial', '2022-04-24', 5);
INSERT INTO direccion (Id_Usuario, Distrito, Direccion_Completa, Referencia, Latitud, Longitud, Tipo_Direccion, Fecha_Registro, Id_Distrito) VALUES (1, 'San Isidro', 'Via de Carmelo Catalán 76, Jaén, 73315', 'Plaza Fanny Carrasco', -12.17409697, -76.89757594, 'Residencial', '2025-04-06', 4);
INSERT INTO direccion (Id_Usuario, Distrito, Direccion_Completa, Referencia, Latitud, Longitud, Tipo_Direccion, Fecha_Registro, Id_Distrito) VALUES (10, 'Jesús María', 'Callejón Alonso Solano 74, Valladolid, 17258', 'Acceso Lupe Oliva', -12.06038434, -76.84854252, 'Residencial', '2024-01-09', 2);
INSERT INTO direccion (Id_Usuario, Distrito, Direccion_Completa, Referencia, Latitud, Longitud, Tipo_Direccion, Fecha_Registro, Id_Distrito) VALUES (4, 'Surco', 'Plaza Pacífica Torrent 108 Piso 4 , Las Palmas, 40270', 'C. Francisca Arroyo', -12.12646102, -76.83936647, 'Comercial', '2022-12-30', 7);
INSERT INTO direccion (Id_Usuario, Distrito, Direccion_Completa, Referencia, Latitud, Longitud, Tipo_Direccion, Fecha_Registro, Id_Distrito) VALUES (4, 'Surco', 'Pasadizo de Amparo Martí 77 Piso 4 , Barcelona, 52583', 'Cuesta de Adelia Cortina', -11.99200905, -76.96609814, 'Comercial', '2021-08-01', 5);
INSERT INTO direccion (Id_Usuario, Distrito, Direccion_Completa, Referencia, Latitud, Longitud, Tipo_Direccion, Fecha_Registro, Id_Distrito) VALUES (5, 'Barranco', 'Alameda Daniela Velázquez 749 Apt. 38 , Ciudad, 27894', 'Camino de Jorge Gutiérrez', -11.83385689, -76.92339999, 'Residencial', '2025-04-27', 5);
INSERT INTO direccion (Id_Usuario, Distrito, Direccion_Completa, Referencia, Latitud, Longitud, Tipo_Direccion, Fecha_Registro, Id_Distrito) VALUES (5, 'Jesús María', 'Callejón Estela Bauzà 54 Apt. 04 , Zamora, 99782', 'Paseo de Brunilda Solera', -11.98648744, -76.86990015, 'Comercial', '2022-07-07', 4);

-- CURSO --
INSERT INTO curso (Nombre_Curso, Descripcion_Curso, Area_Especializacion, Duracion, Nivel, Fecha_Inicio, Fecha_Fin, Instructor, Id_Capacitacion) VALUES ('Estrategias para funcionalidades en línea', 'Aprende a planificar y estructurar funcionalidades para plataformas digitales.', 'Psicoterapeuta infantil', '2 semanas', 'Principiante', '2021-05-31', '2022-04-12', 2, 2);
INSERT INTO curso (Nombre_Curso, Descripcion_Curso, Area_Especializacion, Duracion, Nivel, Fecha_Inicio, Fecha_Fin, Instructor, Id_Capacitacion) VALUES ('Optimización de negocios electrónicos revolucionarios', 'Descubre cómo mejorar el rendimiento de negocios digitales innovadores.', 'Técnico de sonido en radiodifusión/cine/video', '7 semanas', 'Intermedio', '2022-09-04', '2023-12-08', 1, 4);
INSERT INTO curso (Nombre_Curso, Descripcion_Curso, Area_Especializacion, Duracion, Nivel, Fecha_Inicio, Fecha_Fin, Instructor, Id_Capacitacion) VALUES ('Recontextualización de tecnologías interactivas', 'Explora nuevas formas de aplicar tecnologías interactivas en diferentes contextos.', 'Gerente de producción', '12 semanas', 'Principiante', '2022-01-26', '2023-03-24', 6, 8);
INSERT INTO curso (Nombre_Curso, Descripcion_Curso, Area_Especializacion, Duracion, Nivel, Fecha_Inicio, Fecha_Fin, Instructor, Id_Capacitacion) VALUES ('Innovación en comunidades multimedia', 'Aprende a desarrollar comunidades digitales colaborativas a través de medios cruzados.', 'Editor de contenidos', '9 semanas', 'Principiante', '2024-05-14', '2025-02-02', 1, 4);
INSERT INTO curso (Nombre_Curso, Descripcion_Curso, Area_Especializacion, Duracion, Nivel, Fecha_Inicio, Fecha_Fin, Instructor, Id_Capacitacion) VALUES ('Revoluciona redes multimedia', 'Domina las herramientas para transformar redes de medios interconectados.', 'Ingeniero de perforación', '6 semanas', 'Avanzado', '2022-01-16', '2020-11-16', 2, 1);
INSERT INTO curso (Nombre_Curso, Descripcion_Curso, Area_Especializacion, Duracion, Nivel, Fecha_Inicio, Fecha_Fin, Instructor, Id_Capacitacion) VALUES ('Evolución de canales intuitivos', 'Diseña canales de comunicación digitales con un enfoque centrado en el usuario.', 'Consultor ambiental', '11 semanas', 'Intermedio', '2020-07-17', '2022-09-19', 10, 5);
INSERT INTO curso (Nombre_Curso, Descripcion_Curso, Area_Especializacion, Duracion, Nivel, Fecha_Inicio, Fecha_Fin, Instructor, Id_Capacitacion) VALUES ('Agrupación de ancho de banda escalable', 'Gestiona de forma eficiente el ancho de banda para entornos tecnológicos en expansión.', 'Oficial técnico médico', '10 semanas', 'Principiante', '2023-01-18', '2024-12-13', 1, 9);
INSERT INTO curso (Nombre_Curso, Descripcion_Curso, Area_Especializacion, Duracion, Nivel, Fecha_Inicio, Fecha_Fin, Instructor, Id_Capacitacion) VALUES ('Optimización de convergencia dinámica', 'Integra tecnologías y procesos para una convergencia eficiente de sistemas digitales.', 'Ingeniero en petróleo', '12 semanas', 'Avanzado', '2023-08-29', '2021-10-02', 9, 10);
INSERT INTO curso (Nombre_Curso, Descripcion_Curso, Area_Especializacion, Duracion, Nivel, Fecha_Inicio, Fecha_Fin, Instructor, Id_Capacitacion) VALUES ('Aprovechamiento de métricas innovadoras', 'Utiliza métricas de vanguardia para impulsar el análisis y la toma de decisiones.', 'Sismólogo de campo', '4 semanas', 'Intermedio', '2020-10-06', '2025-01-22', 9, 9);
INSERT INTO curso (Nombre_Curso, Descripcion_Curso, Area_Especializacion, Duracion, Nivel, Fecha_Inicio, Fecha_Fin, Instructor, Id_Capacitacion) VALUES ('Posicionamiento de sinergias innovadoras', 'Desarrolla estrategias para alinear equipos y tecnologías de forma sinérgica.', 'Médico general', '8 semanas', 'Principiante', '2020-05-23', '2021-10-08', 1, 10);

-- RECURSOS --
INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tamaño, Fecha_Publicacion, Tamaño_Descarga, Id_Usuario) VALUES ('Video', 'Emulación 24/7 Sincronizada', 'Video tutorial en tiempo real.', 'Audio', '205 MB', '2022-07-27', '210 MB', 1);
INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tamaño, Fecha_Publicacion, Tamaño_Descarga, Id_Usuario) VALUES ('Artículo', 'Sistema de clave pública instruccional', 'Conjunto de instrucciones digno de un sistema de clave pública.', 'Audio', '54 MB', '2020-02-03', '357 MB', 2);
INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tamaño, Fecha_Publicacion, Tamaño_Descarga, Id_Usuario) VALUES ('Video', 'Infraestructura integral empresarial', 'Infraestructura integral que abarca toda la empresa.', 'Video', '478 MB', '2025-03-03', '40 MB', 7);
INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tamaño, Fecha_Publicacion, Tamaño_Descarga, Id_Usuario) VALUES ('Guía', 'Almacén de datos regional polarizado', 'Guía de almacén de datos regional polarizado.', 'Audio', '379 MB', '2022-09-24', '466 MB', 7);
INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tamaño, Fecha_Publicacion, Tamaño_Descarga, Id_Usuario) VALUES ('Video', 'Funcionalidades estables optimizadas', 'Explicación detallada de funcionalidades estables optimizadas.', 'Video', '399 MB', '2021-09-09', '430 MB', 1);
INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tamaño, Fecha_Publicacion, Tamaño_Descarga, Id_Usuario) VALUES ('Video', 'Alianza dinámica multicanal', 'Descripción de alianza dinámica multicanal.', 'PDF', '365 MB', '2020-07-02', '211 MB', 6);
INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tamaño, Fecha_Publicacion, Tamaño_Descarga, Id_Usuario) VALUES ('Artículo', 'Grupo focal totalmente exudante', 'Enfoque intensivo de grupo focal.', 'Audio', '40 MB', '2023-06-24', '97 MB', 6);
INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tamaño, Fecha_Publicacion, Tamaño_Descarga, Id_Usuario) VALUES ('Guía', 'Conjunto de herramientas secundarias simplificado', 'Herramientas secundarias simplificadas.', 'PDF', '91 MB', '2023-05-29', '411 MB', 2);
INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tamaño, Fecha_Publicacion, Tamaño_Descarga, Id_Usuario) VALUES ('Artículo', 'Protocolo basado en contenido personalizable', 'Protocolo personalizable basado en contenido.', 'Audio', '470 MB', '2022-11-02', '9 MB', 4);
INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tamaño, Fecha_Publicacion, Tamaño_Descarga, Id_Usuario) VALUES ('Artículo', 'Método LAN totalmente configurable', 'Método metódico para redes de área local, completamente configurable.', 'Video', '271 MB', '2023-06-02', '300 MB', 1);

-- REDES SOCIALES --
INSERT INTO redes_sociales (Id_Usuario, Red_Social, Link_Red_Social) VALUES (1, 'LinkedIn', 'https://pe.linkedin.com');
INSERT INTO redes_sociales (Id_Usuario, Red_Social, Link_Red_Social) VALUES (7, 'LinkedIn', 'https://pe.linkedin.com');
INSERT INTO redes_sociales (Id_Usuario, Red_Social, Link_Red_Social) VALUES (6, 'Facebook', 'https://www.facebook.com');
INSERT INTO redes_sociales (Id_Usuario, Red_Social, Link_Red_Social) VALUES (1, 'Instagram', 'https://www.instagram.com');
INSERT INTO redes_sociales (Id_Usuario, Red_Social, Link_Red_Social) VALUES (3, 'LinkedIn', 'https://pe.linkedin.com');
INSERT INTO redes_sociales (Id_Usuario, Red_Social, Link_Red_Social) VALUES (7, 'Twitter', 'https://x.com');
INSERT INTO redes_sociales (Id_Usuario, Red_Social, Link_Red_Social) VALUES (9, 'Facebook', 'https://www.facebook.com');
INSERT INTO redes_sociales (Id_Usuario, Red_Social, Link_Red_Social) VALUES (5, 'Facebook', 'https://www.facebook.com');
INSERT INTO redes_sociales (Id_Usuario, Red_Social, Link_Red_Social) VALUES (6, 'Instagram', 'https://www.instagram.com');
INSERT INTO redes_sociales (Id_Usuario, Red_Social, Link_Red_Social) VALUES (6, 'Instagram', 'https://www.instagram.com');