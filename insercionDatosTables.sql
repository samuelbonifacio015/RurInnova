use RURINNOVA
go

/* error pendiente a solucionar */
INSERT INTO app VALUES
('Android'),
('iOS'),
('Windows'),
('macOS'),
('Linux');

UPDATE usuario SET Nombre_Usuario = 'Roldán Casanovas' WHERE Nombre_Usuario = 'roldán';
UPDATE usuario SET Nombre_Usuario = 'Julia Fortuny'     WHERE Nombre_Usuario = 'julia';
UPDATE usuario SET Nombre_Usuario = 'Toribio Sáez'      WHERE Nombre_Usuario = 'toribio';
UPDATE usuario SET Nombre_Usuario = 'Carina Zurita'     WHERE Nombre_Usuario = 'carina';
UPDATE usuario SET Nombre_Usuario = 'María Fernanda Coca' WHERE Nombre_Usuario = 'maría fernanda';
UPDATE usuario SET Nombre_Usuario = 'Benita Montero'    WHERE Nombre_Usuario = 'benita';
UPDATE usuario SET Nombre_Usuario = 'Augusto Carretero' WHERE Nombre_Usuario = 'augusto';
UPDATE usuario SET Nombre_Usuario = 'Aránzazu Durán'    WHERE Nombre_Usuario = 'aránzazu';
UPDATE usuario SET Nombre_Usuario = 'Basilio Ayuso'     WHERE Nombre_Usuario = 'basilio';
UPDATE usuario SET Nombre_Usuario = 'Juan José Millán'  WHERE Nombre_Usuario = 'juan josé';

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

DBCC CHECKIDENT ('eventos', RESEED, 0);
SET IDENTITY_INSERT eventos ON;
INSERT INTO eventos (Id_Evento, Nombre_Evento, Fecha_Evento, Descripcion, Lugar)
VALUES
(1, 'Feria Agroalimentaria', '2025-07-01', 'Exhibición de productos agrícolas y alimenticios.', 'Miraflores'),
(2, 'Congreso de Innovación Rural', '2025-07-15', 'Ponencias sobre tecnología para el campo.', 'Barranco'),
(3, 'Muestra de Artesanías Andinas', '2025-08-01', 'Venta y exposición de tejidos y artesanías.', 'Jesús María'),
(4, 'Simposio de Energías Renovables', '2025-08-15', 'Charlas sobre energía solar y eólica.', 'La Molina'),
(5, 'Expo Ganadera', '2025-09-01', 'Demostración de técnicas de ganadería sostenible.', 'Surco'),
(6, 'Hackathon AgroTech', '2025-09-10', 'Maratón de desarrollo de soluciones para agricultura.', 'San Isidro'),
(7, 'Taller de Biotecnología', '2025-09-20', 'Prácticas de biofertilizantes orgánicos.', 'Pueblo Libre'),
(8, 'Foro de Telemedicina', '2025-10-01', 'Debate sobre salud remota en zonas rurales.', 'Lince'),
(9, 'Concurso de Drones Agrícolas', '2025-10-10', 'Competencia de sistemas de drones.', 'Callao'),
(10, 'Seminario de Riego Inteligente', '2025-10-20', 'Uso de IoT para riego automatizado.', 'Ate'),
(11, 'Feria de Turismo Rural', '2025-11-01', 'Promoción de destinos rurales sostenibles.', 'Los Olivos'),
(12, 'Jornada de Emprendimiento Verde', '2025-11-15', 'Ideas de negocios ecológicos.', 'San Borja'),
(13, 'Taller de Marketing Digital', '2025-12-01', 'Estrategias para emprendimientos rurales.', 'Chorrillos'),
(14, 'Muestra de Startups Rurales', '2025-12-10', 'Pitch de proyectos innovadores.', 'Magdalena'),
(15, 'Feria de Innovación Social', '2026-01-15', 'Proyectos de impacto social en comunidades.', 'La Victoria');
SET IDENTITY_INSERT eventos OFF;

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

UPDATE mentor SET Area_Especializacion='Representación turística',Telefono='+51 912345678' WHERE Id_Mentor=1;
UPDATE mentor SET Area_Especializacion='Podología',Telefono='+51 987654321' WHERE Id_Mentor=2;
UPDATE mentor SET Area_Especializacion='Agricultura ecológica',Telefono='+51 934567890' WHERE Id_Mentor=3;
UPDATE mentor SET Area_Especializacion='Energías renovables',Telefono='+51 945678901' WHERE Id_Mentor=4;
UPDATE mentor SET Area_Especializacion='Marketing digital',Telefono='+51 956789012' WHERE Id_Mentor=5;
UPDATE mentor SET Area_Especializacion='Turismo rural',Telefono='+51 967890123' WHERE Id_Mentor=6;
UPDATE mentor SET Area_Especializacion='Salud pública',Telefono='+51 978901234' WHERE Id_Mentor=7;
UPDATE mentor SET Area_Especializacion='Logística',Telefono='+51 989012345' WHERE Id_Mentor=8;
UPDATE mentor SET Area_Especializacion='Finanzas',Telefono='+51 990123456' WHERE Id_Mentor=9;
UPDATE mentor SET Area_Especializacion='Recursos humanos',Telefono='+51 991234567' WHERE Id_Mentor=10;

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

UPDATE organizacion_patrocinadora SET Descripcion = 'Desarrollo de proyectos rurales.'                    WHERE Nombre_Organizacion = 'Vilaplana LLC';
UPDATE organizacion_patrocinadora SET Descripcion = 'Impulso de iniciativas públicas.'                       WHERE Nombre_Organizacion = 'Pons Ltd';
UPDATE organizacion_patrocinadora SET Descripcion = 'Apoyo a emprendedores rurales.'                         WHERE Nombre_Organizacion = 'Antúnez-Rivas';
UPDATE organizacion_patrocinadora SET Descripcion = 'Soluciones empresariales innovadoras.'                 WHERE Nombre_Organizacion = 'Ferrández PLC';
UPDATE organizacion_patrocinadora SET Descripcion = 'Promoción de proyectos sociales.'                        WHERE Nombre_Organizacion = 'Sotelo-Alonso';
UPDATE organizacion_patrocinadora SET Descripcion = 'Asesoría para organizaciones no gubernamentales.'           WHERE Nombre_Organizacion = 'Benet, Vives and Almagro';
UPDATE organizacion_patrocinadora SET Descripcion = 'Cooperación institucional pública.'                       WHERE Nombre_Organizacion = 'Cervantes Ltd';
UPDATE organizacion_patrocinadora SET Descripcion = 'Fortalecimiento de entidades locales.'                     WHERE Nombre_Organizacion = 'Priego Inc';
UPDATE organizacion_patrocinadora SET Descripcion = 'Innovación y emprendimiento empresarial.'                  WHERE Nombre_Organizacion = 'Bermejo-Aroca';
UPDATE organizacion_patrocinadora SET Descripcion = 'Apoyo y mentoría a pequeñas empresas.'                   WHERE Nombre_Organizacion = 'Martin-Jove';

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

UPDATE recursos SET Titulo='Emulación 24/7 Sincronizada', Descripcion='Video tutorial en tiempo real.' WHERE Titulo='Synchronized 24/7 emulation';
UPDATE recursos SET Titulo='Sistema de clave pública instruccional', Descripcion='Conjunto de instrucciones digno de un sistema de clave pública.' WHERE Titulo='Public-key system-worthy instruction set';
UPDATE recursos SET Titulo='Infraestructura integral empresarial', Descripcion='Infraestructura integral que abarca toda la empresa.' WHERE Titulo='Enterprise-wide encompassing infrastructure';
UPDATE recursos SET Titulo='Almacén de datos regional polarizado', Descripcion='Guía de almacén de datos regional polarizado.' WHERE Titulo='Polarized regional data-warehouse';
UPDATE recursos SET Titulo='Funcionalidades estables optimizadas', Descripcion='Explicación detallada de funcionalidades estables optimizadas.' WHERE Titulo='Optimized stable functionalities';
UPDATE recursos SET Titulo='Alianza dinámica multicanal', Descripcion='Descripción de alianza dinámica multicanal.' WHERE Titulo='Multi-channeled dynamic alliance';
UPDATE recursos SET Titulo='Grupo focal totalmente exudante', Descripcion='Enfoque intensivo de grupo focal.' WHERE Titulo='Total exuding focus group';
UPDATE recursos SET Titulo='Conjunto de herramientas secundarias simplificado', Descripcion='Herramientas secundarias simplificadas.' WHERE Titulo='Streamlined secondary toolset';
UPDATE recursos SET Titulo='Protocolo basado en contenido personalizable', Descripcion='Protocolo personalizable basado en contenido.' WHERE Titulo='Customizable content-based protocol';
UPDATE recursos SET Titulo='Método LAN totalmente configurable', Descripcion='Método metódico para redes de área local, completamente configurable.' WHERE Titulo='Fully-configurable methodical Local Area Network';

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
INSERT INTO usuario (Nombre_Usuario, Correo_Electronico, Id_Tipo_Usuario) VALUES ('roldán', 'roldán.casanovas@gmail.com', 8);
INSERT INTO usuario (Nombre_Usuario, Correo_Electronico, Id_Tipo_Usuario) VALUES ('julia', 'julia.fortuny@gmail.com', 2);
INSERT INTO usuario (Nombre_Usuario, Correo_Electronico, Id_Tipo_Usuario) VALUES ('toribio', 'toribio.saez@gmail.com', 6);
INSERT INTO usuario (Nombre_Usuario, Correo_Electronico, Id_Tipo_Usuario) VALUES ('carina', 'carina.zurita@gmail.com', 10);
INSERT INTO usuario (Nombre_Usuario, Correo_Electronico, Id_Tipo_Usuario) VALUES ('maría fernanda', 'maría fernanda.coca@gmail.com', 9);
INSERT INTO usuario (Nombre_Usuario, Correo_Electronico, Id_Tipo_Usuario) VALUES ('benita', 'benita.montero@gmail.com', 4);
INSERT INTO usuario (Nombre_Usuario, Correo_Electronico, Id_Tipo_Usuario) VALUES ('augusto', 'augusto.carretero@gmail.com', 5);
INSERT INTO usuario (Nombre_Usuario, Correo_Electronico, Id_Tipo_Usuario) VALUES ('aránzazu', 'aránzazu.durán@gmail.com', 8);
INSERT INTO usuario (Nombre_Usuario, Correo_Electronico, Id_Tipo_Usuario) VALUES ('basilio', 'basilio.ayuso@gmail.com', 7);
INSERT INTO usuario (Nombre_Usuario, Correo_Electronico, Id_Tipo_Usuario) VALUES ('juan josé', 'juan josé.millán@gmail.com', 8);
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
INSERT INTO organizacion_patrocinadora (Nombre_Organizacion, Tipo_Organizacion, Responsable, Correo_Electronico, Telefono, Direccion, Fecha_Ingreso, Descripcion) VALUES ('Vilaplana LLC', 'Institución Pública', 'Álvaro de Zamorano', 'jmatas@aliaga.com', '+34710 69 19 05', 'Paseo de Marisa Barrio 6 Puerta 5 , Asturias, 05320', '2021-03-18', 'Id in ullam similique nobis molestias.');
INSERT INTO organizacion_patrocinadora (Nombre_Organizacion, Tipo_Organizacion, Responsable, Correo_Electronico, Telefono, Direccion, Fecha_Ingreso, Descripcion) VALUES ('Pons Ltd', 'Institución Pública', 'Carolina Casal-Perales', 'calisto94@paez.org', '+34737 01 44 27', 'Plaza Azeneth Barberá 64 Piso 2 , Vizcaya, 92699', '2020-08-07', 'Libero a odio ex ipsum est. Beatae recusandae esse ad.');
INSERT INTO organizacion_patrocinadora (Nombre_Organizacion, Tipo_Organizacion, Responsable, Correo_Electronico, Telefono, Direccion, Fecha_Ingreso, Descripcion) VALUES ('Antúnez-Rivas', 'Empresa', 'Carmina Juliana Duque Pozo', 'hugoalberdi@gmail.com', '+34 737 333 237', 'Avenida Mariana Ayala 69, Cádiz, 03300', '2021-02-10', 'Atque rerum accusantium molestias.');
INSERT INTO organizacion_patrocinadora (Nombre_Organizacion, Tipo_Organizacion, Responsable, Correo_Electronico, Telefono, Direccion, Fecha_Ingreso, Descripcion) VALUES ('Ferrández PLC', 'Empresa', 'Adoración Úrsula Valencia Robledo', 'leocadiacanovas@hotmail.com', '+34743 64 52 02', 'Ronda de Trinidad Acero 38, Huelva, 90442', '2020-03-07', 'Iste harum repellendus velit deserunt.');
INSERT INTO organizacion_patrocinadora (Nombre_Organizacion, Tipo_Organizacion, Responsable, Correo_Electronico, Telefono, Direccion, Fecha_Ingreso, Descripcion) VALUES ('Sotelo-Alonso', 'ONG', 'Artemio Rodríguez Heras', 'escrivaaura@gmail.com', '+34 625 16 73 85', 'Urbanización Desiderio Cerdán 11 Piso 9 , Zaragoza, 43891', '2025-01-09', 'Facilis incidunt culpa.');
INSERT INTO organizacion_patrocinadora (Nombre_Organizacion, Tipo_Organizacion, Responsable, Correo_Electronico, Telefono, Direccion, Fecha_Ingreso, Descripcion) VALUES ('Benet, Vives and Almagro', 'ONG', 'Domingo Roldán Benavides', 'valentin66@yahoo.com', '+34706 646 114', 'Cuesta de Priscila Diéguez 55, Santa Cruz de Tenerife, 65440', '2021-02-17', 'Ea aspernatur voluptatum hic.');
INSERT INTO organizacion_patrocinadora (Nombre_Organizacion, Tipo_Organizacion, Responsable, Correo_Electronico, Telefono, Direccion, Fecha_Ingreso, Descripcion) VALUES ('Cervantes Ltd', 'Institución Pública', 'Viviana Franco Abellán', 'ema56@ortiz.com', '+34 704212077', 'Rambla de Victor Guzmán 20, Lugo, 34999', '2024-11-17', 'Qui doloremque eum architecto eum eligendi eos.');
INSERT INTO organizacion_patrocinadora (Nombre_Organizacion, Tipo_Organizacion, Responsable, Correo_Electronico, Telefono, Direccion, Fecha_Ingreso, Descripcion) VALUES ('Priego Inc', 'Institución Pública', 'Lupe Bru Vallejo', 'pinedanydia@hotmail.com', '+34724 36 15 98', 'Callejón Adrián Aguado 15, Pontevedra, 46749', '2024-12-24', 'Excepturi alias fuga.');
INSERT INTO organizacion_patrocinadora (Nombre_Organizacion, Tipo_Organizacion, Responsable, Correo_Electronico, Telefono, Direccion, Fecha_Ingreso, Descripcion) VALUES ('Bermejo-Aroca', 'Empresa', 'Maximiano Abellán Feijoo', 'anacleto71@borras.com', '+34 707973140', 'Ronda Javier Duque 4 Apt. 28 , Almería, 74609', '2021-10-02', 'Tenetur quae ut earum maiores necessitatibus dolorem.');
INSERT INTO organizacion_patrocinadora (Nombre_Organizacion, Tipo_Organizacion, Responsable, Correo_Electronico, Telefono, Direccion, Fecha_Ingreso, Descripcion) VALUES ('Martin-Jove', 'Empresa', 'Moreno Herrero Calderon', 'caminoamalia@hotmail.com', '+34704 222 381', 'Cañada de Itziar Lloret 28 Puerta 7 , Palencia, 25515', '2020-08-19', 'Enim sapiente omnis minus fugit asperiores.');
INSERT INTO mentor (Id_Usuario, Nombre_Completo, Correo_Electronico, Telefono, Area_Especializacion, Años_Experiencia, Tipo_Mentoria, Fecha_Registro, Numero_Sesiones_Mentoria) VALUES (3, 'Guiomar Segura Montaña', 'armando98@salgado-arevalo.com', '+34716 198 633', 'Holiday representative', 6, 'Técnica', '2023-06-18', 15);
INSERT INTO mentor (Id_Usuario, Nombre_Completo, Correo_Electronico, Telefono, Area_Especializacion, Años_Experiencia, Tipo_Mentoria, Fecha_Registro, Numero_Sesiones_Mentoria) VALUES (10, 'Úrsula Benito Diez', 'gduran@checa-giner.net', '+34 737215168', 'Podiatrist', 8, 'Marketing', '2021-06-24', 8);
INSERT INTO mentor (Id_Usuario, Nombre_Completo, Correo_Electronico, Telefono, Area_Especializacion, Años_Experiencia, Tipo_Mentoria, Fecha_Registro, Numero_Sesiones_Mentoria) VALUES (5, 'Emiliana Arteaga Carpio', 'vayuso@saavedra-cifuentes.es', '+34714 04 84 59', 'Network engineer', 18, 'Técnica', '2024-09-06', 4);
INSERT INTO mentor (Id_Usuario, Nombre_Completo, Correo_Electronico, Telefono, Area_Especializacion, Años_Experiencia, Tipo_Mentoria, Fecha_Registro, Numero_Sesiones_Mentoria) VALUES (1, 'Filomena Albero Rey', 'rleiva@castrillo-alberto.es', '+34700 317 146', 'Medical illustrator', 14, 'Técnica', '2022-12-11', 10);
INSERT INTO mentor (Id_Usuario, Nombre_Completo, Correo_Electronico, Telefono, Area_Especializacion, Años_Experiencia, Tipo_Mentoria, Fecha_Registro, Numero_Sesiones_Mentoria) VALUES (2, 'Ignacia Armas Lerma', 'sergio46@aguilera.es', '+34734 951 117', 'Product manager', 4, 'Marketing', '2021-07-23', 1);
INSERT INTO mentor (Id_Usuario, Nombre_Completo, Correo_Electronico, Telefono, Area_Especializacion, Años_Experiencia, Tipo_Mentoria, Fecha_Registro, Numero_Sesiones_Mentoria) VALUES (6, 'Marcial Adán Carbonell', 'quintanavictoria@somoza.org', '+34 702971279', 'Estate manager/land agent', 7, 'Marketing', '2022-05-28', 2);
INSERT INTO mentor (Id_Usuario, Nombre_Completo, Correo_Electronico, Telefono, Area_Especializacion, Años_Experiencia, Tipo_Mentoria, Fecha_Registro, Numero_Sesiones_Mentoria) VALUES (7, 'Pepita Jove Canals', 'eliana05@hotmail.com', '+34 728 935 752', 'Insurance claims handler', 14, 'Marketing', '2022-10-10', 10);
INSERT INTO mentor (Id_Usuario, Nombre_Completo, Correo_Electronico, Telefono, Area_Especializacion, Años_Experiencia, Tipo_Mentoria, Fecha_Registro, Numero_Sesiones_Mentoria) VALUES (5, 'Anastasio Mate-Sánchez', 'wbravo@jerez-carrion.es', '+34922999728', 'Passenger transport manager', 19, 'Técnica', '2020-07-23', 1);
INSERT INTO mentor (Id_Usuario, Nombre_Completo, Correo_Electronico, Telefono, Area_Especializacion, Años_Experiencia, Tipo_Mentoria, Fecha_Registro, Numero_Sesiones_Mentoria) VALUES (6, 'Alejo Asenjo Juárez', 'bartolomegascon@heredia.es', '+34 932 05 95 61', 'Designer, multimedia', 20, 'Marketing', '2023-11-11', 12);
INSERT INTO mentor (Id_Usuario, Nombre_Completo, Correo_Electronico, Telefono, Area_Especializacion, Años_Experiencia, Tipo_Mentoria, Fecha_Registro, Numero_Sesiones_Mentoria) VALUES (5, 'Itziar Garay Lluch', 'ncarrasco@ponce.com', '+34 740 575 989', 'Government social research officer', 10, 'Marketing', '2021-03-01', 10);
INSERT INTO curso (Nombre_Curso, Descripcion_Curso, Area_Especializacion, Duracion, Nivel, Fecha_Inicio, Fecha_Fin, Instructor, Id_Capacitacion) VALUES ('Strategize dot-com functionalities', 'Dolores illum tempore voluptate consectetur.', 'Psychotherapist, child', '2 semanas', 'Principiante', '2021-05-31', '2022-04-12', 2, 2);
INSERT INTO curso (Nombre_Curso, Descripcion_Curso, Area_Especializacion, Duracion, Nivel, Fecha_Inicio, Fecha_Fin, Instructor, Id_Capacitacion) VALUES ('Optimize revolutionary e-business', 'Fuga ad reiciendis inventore numquam maxime.', 'Sound technician, broadcasting/film/video', '7 semanas', 'Intermedio', '2022-09-04', '2023-12-08', 1, 4);
INSERT INTO curso (Nombre_Curso, Descripcion_Curso, Area_Especializacion, Duracion, Nivel, Fecha_Inicio, Fecha_Fin, Instructor, Id_Capacitacion) VALUES ('Re-contextualize interactive technologies', 'Ullam dignissimos animi repellendus mollitia.', 'Production manager', '12 semanas', 'Principiante', '2022-01-26', '2023-03-24', 6, 8);
INSERT INTO curso (Nombre_Curso, Descripcion_Curso, Area_Especializacion, Duracion, Nivel, Fecha_Inicio, Fecha_Fin, Instructor, Id_Capacitacion) VALUES ('Innovate cross-media communities', 'Animi quas placeat voluptatem.', 'Editor, commissioning', '9 semanas', 'Principiante', '2024-05-14', '2025-02-02', 1, 4);
INSERT INTO curso (Nombre_Curso, Descripcion_Curso, Area_Especializacion, Duracion, Nivel, Fecha_Inicio, Fecha_Fin, Instructor, Id_Capacitacion) VALUES ('Revolutionize cross-media networks', 'Nisi magni consequuntur eum praesentium quasi.', 'Engineer, drilling', '6 semanas', 'Avanzado', '2022-01-16', '2020-11-16', 2, 1);
INSERT INTO curso (Nombre_Curso, Descripcion_Curso, Area_Especializacion, Duracion, Nivel, Fecha_Inicio, Fecha_Fin, Instructor, Id_Capacitacion) VALUES ('Evolve intuitive channels', 'Magnam numquam temporibus rem enim.', 'Environmental consultant', '11 semanas', 'Intermedio', '2020-07-17', '2022-09-19', 10, 5);
INSERT INTO curso (Nombre_Curso, Descripcion_Curso, Area_Especializacion, Duracion, Nivel, Fecha_Inicio, Fecha_Fin, Instructor, Id_Capacitacion) VALUES ('Aggregate scalable bandwidth', 'Rerum nihil doloremque.', 'Medical technical officer', '10 semanas', 'Principiante', '2023-01-18', '2024-12-13', 1, 9);
INSERT INTO curso (Nombre_Curso, Descripcion_Curso, Area_Especializacion, Duracion, Nivel, Fecha_Inicio, Fecha_Fin, Instructor, Id_Capacitacion) VALUES ('Streamline dynamic convergence', 'Laborum architecto autem officia.', 'Engineer, petroleum', '12 semanas', 'Avanzado', '2023-08-29', '2021-10-02', 9, 10);
INSERT INTO curso (Nombre_Curso, Descripcion_Curso, Area_Especializacion, Duracion, Nivel, Fecha_Inicio, Fecha_Fin, Instructor, Id_Capacitacion) VALUES ('Seize bleeding-edge metrics', 'Animi deleniti aliquid pariatur veniam aut.', 'Field seismologist', '4 semanas', 'Intermedio', '2020-10-06', '2025-01-22', 9, 9);
INSERT INTO curso (Nombre_Curso, Descripcion_Curso, Area_Especializacion, Duracion, Nivel, Fecha_Inicio, Fecha_Fin, Instructor, Id_Capacitacion) VALUES ('Brand cutting-edge synergies', 'Qui vel nulla sint deleniti fugit ipsam.', 'Doctor, general practice', '8 semanas', 'Principiante', '2020-05-23', '2021-10-08', 1, 10);
INSERT INTO estado_cuenta (Estado) VALUES ('Activo');
INSERT INTO estado_cuenta (Estado) VALUES ('Inactivo');
INSERT INTO estado_cuenta (Estado) VALUES ('Suspendido');
INSERT INTO estado_cuenta (Estado) VALUES ('Pendiente');
INSERT INTO estado_cuenta (Estado) VALUES ('Cancelado');
INSERT INTO estado_cuenta (Estado) VALUES ('En revisión');
INSERT INTO estado_cuenta (Estado) VALUES ('Bloqueado');
INSERT INTO estado_cuenta (Estado) VALUES ('Verificado');
INSERT INTO estado_cuenta (Estado) VALUES ('Rechazado');
INSERT INTO estado_cuenta (Estado) VALUES ('Aprobado');
INSERT INTO facturacion (Id_Emprendedor, Monto, Fecha_Factura, Metodo_Pago, Estado_Pago) VALUES (3, 1991.22, '2021-08-11', 'Transferencia', 'Pendiente');
INSERT INTO facturacion (Id_Emprendedor, Monto, Fecha_Factura, Metodo_Pago, Estado_Pago) VALUES (6, 655.87, '2024-09-08', 'Tarjeta', 'Pagado');
INSERT INTO facturacion (Id_Emprendedor, Monto, Fecha_Factura, Metodo_Pago, Estado_Pago) VALUES (3, 1643.16, '2024-08-06', 'Efectivo', 'Pendiente');
INSERT INTO facturacion (Id_Emprendedor, Monto, Fecha_Factura, Metodo_Pago, Estado_Pago) VALUES (4, 4035.55, '2024-11-03', 'Efectivo', 'Retrasado');
INSERT INTO facturacion (Id_Emprendedor, Monto, Fecha_Factura, Metodo_Pago, Estado_Pago) VALUES (2, 4354.29, '2023-03-23', 'Efectivo', 'Pagado');
INSERT INTO facturacion (Id_Emprendedor, Monto, Fecha_Factura, Metodo_Pago, Estado_Pago) VALUES (10, 4843.31, '2021-02-04', 'Transferencia', 'Pagado');
INSERT INTO facturacion (Id_Emprendedor, Monto, Fecha_Factura, Metodo_Pago, Estado_Pago) VALUES (7, 2875.93, '2022-12-16', 'Tarjeta', 'Pagado');
INSERT INTO facturacion (Id_Emprendedor, Monto, Fecha_Factura, Metodo_Pago, Estado_Pago) VALUES (3, 3780.6, '2023-12-14', 'Efectivo', 'Retrasado');
INSERT INTO facturacion (Id_Emprendedor, Monto, Fecha_Factura, Metodo_Pago, Estado_Pago) VALUES (6, 1164.79, '2023-05-07', 'Transferencia', 'Pagado');
INSERT INTO facturacion (Id_Emprendedor, Monto, Fecha_Factura, Metodo_Pago, Estado_Pago) VALUES (10, 4333.1, '2021-02-03', 'Efectivo', 'Retrasado');
INSERT INTO feedback (Id_Usuario, Id_Emprendedor, Comentario, Valoracion, Fecha_Feedback) VALUES (4, 10, 'Consequatur aliquid adipisci aliquam temporibus.', 1, '2024-09-09');
INSERT INTO feedback (Id_Usuario, Id_Emprendedor, Comentario, Valoracion, Fecha_Feedback) VALUES (7, 8, 'Quae modi culpa.', 2, '2025-01-01');
INSERT INTO feedback (Id_Usuario, Id_Emprendedor, Comentario, Valoracion, Fecha_Feedback) VALUES (10, 7, 'Odit ullam assumenda distinctio repellendus.', 1, '2021-04-26');
INSERT INTO feedback (Id_Usuario, Id_Emprendedor, Comentario, Valoracion, Fecha_Feedback) VALUES (3, 2, 'A cupiditate in saepe reiciendis.', 4, '2022-07-16');
INSERT INTO feedback (Id_Usuario, Id_Emprendedor, Comentario, Valoracion, Fecha_Feedback) VALUES (8, 7, 'Nobis nihil non aperiam facilis alias.', 4, '2022-12-22');
INSERT INTO feedback (Id_Usuario, Id_Emprendedor, Comentario, Valoracion, Fecha_Feedback) VALUES (9, 5, 'Fugit consequuntur quas delectus.', 1, '2023-03-04');
INSERT INTO feedback (Id_Usuario, Id_Emprendedor, Comentario, Valoracion, Fecha_Feedback) VALUES (5, 8, 'Debitis repudiandae perspiciatis tenetur.', 3, '2021-05-17');
INSERT INTO feedback (Id_Usuario, Id_Emprendedor, Comentario, Valoracion, Fecha_Feedback) VALUES (1, 4, 'Ea molestias veniam eligendi voluptatum omnis.', 4, '2020-04-28');
INSERT INTO feedback (Id_Usuario, Id_Emprendedor, Comentario, Valoracion, Fecha_Feedback) VALUES (8, 10, 'Molestias iste non ullam explicabo nulla itaque.', 3, '2023-11-23');
INSERT INTO feedback (Id_Usuario, Id_Emprendedor, Comentario, Valoracion, Fecha_Feedback) VALUES (4, 9, 'Doloribus sit magnam accusamus cum.', 1, '2021-06-23');
INSERT INTO negocio (Id_Emprendedor, Nombre_Negocio, Descripcion_Negocio, Tipo_Negocio, Estado_Negocio, Capital_Recibido, Fecha_Registro, Monto_Objetivo, Fecha_Ultima_Actualizacion, Id_Categoria) VALUES (1, 'Prats-Hernandez', 'Officia quas optio molestias tenetur.', 'Nacional', 'Activo', 46965.49, '2020-02-10', 16684.07, '2024-11-22', 6);
INSERT INTO negocio (Id_Emprendedor, Nombre_Negocio, Descripcion_Negocio, Tipo_Negocio, Estado_Negocio, Capital_Recibido, Fecha_Registro, Monto_Objetivo, Fecha_Ultima_Actualizacion, Id_Categoria) VALUES (9, 'Barranco LLC', 'Maxime harum cupiditate sunt.', 'Nacional', 'Activo', 21623.88, '2025-04-19', 98675.33, '2023-07-22', 5);
INSERT INTO negocio (Id_Emprendedor, Nombre_Negocio, Descripcion_Negocio, Tipo_Negocio, Estado_Negocio, Capital_Recibido, Fecha_Registro, Monto_Objetivo, Fecha_Ultima_Actualizacion, Id_Categoria) VALUES (4, 'Diéguez-Caballero', 'Aut unde nobis veniam natus animi totam.', 'Local', 'Inactivo', 33535.11, '2023-03-23', 27861.67, '2024-03-13', 3);
INSERT INTO negocio (Id_Emprendedor, Nombre_Negocio, Descripcion_Negocio, Tipo_Negocio, Estado_Negocio, Capital_Recibido, Fecha_Registro, Monto_Objetivo, Fecha_Ultima_Actualizacion, Id_Categoria) VALUES (8, 'Garrido LLC', 'Magni eveniet veniam maiores porro ullam.', 'Local', 'Activo', 43790.27, '2025-05-08', 5737.73, '2024-05-29', 8);
INSERT INTO negocio (Id_Emprendedor, Nombre_Negocio, Descripcion_Negocio, Tipo_Negocio, Estado_Negocio, Capital_Recibido, Fecha_Registro, Monto_Objetivo, Fecha_Ultima_Actualizacion, Id_Categoria) VALUES (6, 'Iñiguez PLC', 'Repellendus provident rem modi.', 'Nacional', 'Activo', 2536.09, '2022-07-29', 8495.88, '2025-06-07', 10);
INSERT INTO negocio (Id_Emprendedor, Nombre_Negocio, Descripcion_Negocio, Tipo_Negocio, Estado_Negocio, Capital_Recibido, Fecha_Registro, Monto_Objetivo, Fecha_Ultima_Actualizacion, Id_Categoria) VALUES (9, 'Prado, Tejero and Busquets', 'Temporibus sequi eos harum accusamus.', 'Regional', 'Activo', 4763.36, '2023-12-30', 70366.91, '2021-02-06', 1);
INSERT INTO negocio (Id_Emprendedor, Nombre_Negocio, Descripcion_Negocio, Tipo_Negocio, Estado_Negocio, Capital_Recibido, Fecha_Registro, Monto_Objetivo, Fecha_Ultima_Actualizacion, Id_Categoria) VALUES (5, 'Sosa, Antón and Vázquez', 'Exercitationem ab consequuntur.', 'Local', 'Inactivo', 1981.39, '2024-04-25', 46273.0, '2020-03-15', 6);
INSERT INTO negocio (Id_Emprendedor, Nombre_Negocio, Descripcion_Negocio, Tipo_Negocio, Estado_Negocio, Capital_Recibido, Fecha_Registro, Monto_Objetivo, Fecha_Ultima_Actualizacion, Id_Categoria) VALUES (7, 'Mateos Inc', 'Ad velit saepe voluptates illo.', 'Local', 'Activo', 34946.9, '2023-08-08', 64591.86, '2020-01-07', 2);
INSERT INTO negocio (Id_Emprendedor, Nombre_Negocio, Descripcion_Negocio, Tipo_Negocio, Estado_Negocio, Capital_Recibido, Fecha_Registro, Monto_Objetivo, Fecha_Ultima_Actualizacion, Id_Categoria) VALUES (2, 'Benavente, Quintero and Castro', 'Veniam repellat fugit delectus.', 'Nacional', 'Inactivo', 2239.51, '2021-06-17', 74642.13, '2024-04-18', 9);
INSERT INTO negocio (Id_Emprendedor, Nombre_Negocio, Descripcion_Negocio, Tipo_Negocio, Estado_Negocio, Capital_Recibido, Fecha_Registro, Monto_Objetivo, Fecha_Ultima_Actualizacion, Id_Categoria) VALUES (2, 'Hoz Ltd', 'Hic debitis aut explicabo.', 'Nacional', 'Inactivo', 26198.59, '2025-01-28', 66803.58, '2023-08-09', 9);
INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tamaño, Fecha_Publicacion, Tamaño_Descarga, Id_Usuario) VALUES ('Video', 'Synchronized 24/7 emulation', 'Quis sed tempora delectus eum incidunt porro.', 'Audio', '205 MB', '2022-07-27', '210 MB', 1);
INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tamaño, Fecha_Publicacion, Tamaño_Descarga, Id_Usuario) VALUES ('Artículo', 'Public-key system-worthy instruction set', 'Magni dolor recusandae nam qui sequi magni.', 'Audio', '54 MB', '2020-02-03', '357 MB', 2);
INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tamaño, Fecha_Publicacion, Tamaño_Descarga, Id_Usuario) VALUES ('Video', 'Enterprise-wide encompassing infrastructure', 'Enim asperiores praesentium iure.', 'Video', '478 MB', '2025-03-03', '40 MB', 7);
INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tamaño, Fecha_Publicacion, Tamaño_Descarga, Id_Usuario) VALUES ('Guía', 'Polarized regional data-warehouse', 'Corporis beatae veritatis enim.', 'Audio', '379 MB', '2022-09-24', '466 MB', 7);
INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tamaño, Fecha_Publicacion, Tamaño_Descarga, Id_Usuario) VALUES ('Video', 'Optimized stable functionalities', 'Consequatur incidunt explicabo inventore est.', 'Video', '399 MB', '2021-09-09', '430 MB', 1);
INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tamaño, Fecha_Publicacion, Tamaño_Descarga, Id_Usuario) VALUES ('Video', 'Multi-channeled dynamic alliance', 'Molestiae quam quas hic eaque.', 'PDF', '365 MB', '2020-07-02', '211 MB', 6);
INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tamaño, Fecha_Publicacion, Tamaño_Descarga, Id_Usuario) VALUES ('Artículo', 'Total exuding focus group', 'Sit dolores delectus modi placeat.', 'Audio', '40 MB', '2023-06-24', '97 MB', 6);
INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tamaño, Fecha_Publicacion, Tamaño_Descarga, Id_Usuario) VALUES ('Guía', 'Streamlined secondary toolset', 'Itaque inventore pariatur modi.', 'PDF', '91 MB', '2023-05-29', '411 MB', 2);
INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tamaño, Fecha_Publicacion, Tamaño_Descarga, Id_Usuario) VALUES ('Artículo', 'Customizable content-based protocol', 'Voluptas at cupiditate laborum expedita enim.', 'Audio', '470 MB', '2022-11-02', '9 MB', 4);
INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tamaño, Fecha_Publicacion, Tamaño_Descarga, Id_Usuario) VALUES ('Artículo', 'Fully-configurable methodical Local Area Network', 'Provident autem eveniet dolorem.', 'Video', '271 MB', '2023-06-02', '300 MB', 1);
INSERT INTO redes_sociales (Id_Usuario, Red_Social, Link_Red_Social) VALUES (1, 'LinkedIn', 'https://aguado.com/');
INSERT INTO redes_sociales (Id_Usuario, Red_Social, Link_Red_Social) VALUES (7, 'LinkedIn', 'http://www.manzanares-sureda.com/');
INSERT INTO redes_sociales (Id_Usuario, Red_Social, Link_Red_Social) VALUES (6, 'Facebook', 'http://www.ramon.es/');
INSERT INTO redes_sociales (Id_Usuario, Red_Social, Link_Red_Social) VALUES (1, 'Instagram', 'https://www.garrido.es/');
INSERT INTO redes_sociales (Id_Usuario, Red_Social, Link_Red_Social) VALUES (3, 'LinkedIn', 'https://www.rios-izquierdo.com/');
INSERT INTO redes_sociales (Id_Usuario, Red_Social, Link_Red_Social) VALUES (7, 'Twitter', 'https://vives.com/');
INSERT INTO redes_sociales (Id_Usuario, Red_Social, Link_Red_Social) VALUES (9, 'Facebook', 'http://www.grau.es/');
INSERT INTO redes_sociales (Id_Usuario, Red_Social, Link_Red_Social) VALUES (5, 'Facebook', 'https://tormo.com/');
INSERT INTO redes_sociales (Id_Usuario, Red_Social, Link_Red_Social) VALUES (6, 'Instagram', 'http://ponce.com/');
INSERT INTO redes_sociales (Id_Usuario, Red_Social, Link_Red_Social) VALUES (6, 'Instagram', 'http://royo.net/');
INSERT INTO sesion_mentoria (Id_Mentor, Id_Emprendedor, Fecha_Sesion, Duracion, Tipo_Sesion, Objetivo, Tema_Trata, Comentarios_FinSesion) VALUES (8, 5, '2025-05-29', '48 minutos', 'Virtual', 'Reactive methodical Internet solution', 'whiteboard seamless niches', 'Repudiandae ad debitis illo.');
INSERT INTO sesion_mentoria (Id_Mentor, Id_Emprendedor, Fecha_Sesion, Duracion, Tipo_Sesion, Objetivo, Tema_Trata, Comentarios_FinSesion) VALUES (10, 3, '2022-10-17', '77 minutos', 'Presencial', 'Open-architected multimedia workforce', 'orchestrate distributed info-mediaries', 'Ipsa magni saepe occaecati porro.');
INSERT INTO sesion_mentoria (Id_Mentor, Id_Emprendedor, Fecha_Sesion, Duracion, Tipo_Sesion, Objetivo, Tema_Trata, Comentarios_FinSesion) VALUES (3, 3, '2024-08-28', '100 minutos', 'Virtual', 'Pre-emptive multi-state archive', 'drive integrated e-business', 'Atque iste sed officiis.');
INSERT INTO sesion_mentoria (Id_Mentor, Id_Emprendedor, Fecha_Sesion, Duracion, Tipo_Sesion, Objetivo, Tema_Trata, Comentarios_FinSesion) VALUES (7, 7, '2024-06-30', '82 minutos', 'Presencial', 'Monitored disintermediate database', 'architect holistic schemas', 'Alias doloremque blanditiis omnis suscipit.');
INSERT INTO sesion_mentoria (Id_Mentor, Id_Emprendedor, Fecha_Sesion, Duracion, Tipo_Sesion, Objetivo, Tema_Trata, Comentarios_FinSesion) VALUES (4, 2, '2020-05-13', '111 minutos', 'Virtual', 'Self-enabling systematic open system', 'extend value-added architectures', 'Quo dolorum repellendus officia.');
INSERT INTO sesion_mentoria (Id_Mentor, Id_Emprendedor, Fecha_Sesion, Duracion, Tipo_Sesion, Objetivo, Tema_Trata, Comentarios_FinSesion) VALUES (4, 1, '2025-04-18', '36 minutos', 'Presencial', 'Streamlined global algorithm', 'implement seamless supply-chains', 'Rem deleniti ipsum cumque.');
INSERT INTO sesion_mentoria (Id_Mentor, Id_Emprendedor, Fecha_Sesion, Duracion, Tipo_Sesion, Objetivo, Tema_Trata, Comentarios_FinSesion) VALUES (10, 1, '2022-01-10', '51 minutos', 'Presencial', 'Innovative dynamic core', 'monetize proactive e-markets', 'Eveniet nemo aut quo.');
INSERT INTO sesion_mentoria (Id_Mentor, Id_Emprendedor, Fecha_Sesion, Duracion, Tipo_Sesion, Objetivo, Tema_Trata, Comentarios_FinSesion) VALUES (5, 1, '2021-08-25', '115 minutos', 'Virtual', 'Optional human-resource solution', 'target compelling networks', 'Atque hic iusto repellendus.');
INSERT INTO sesion_mentoria (Id_Mentor, Id_Emprendedor, Fecha_Sesion, Duracion, Tipo_Sesion, Objetivo, Tema_Trata, Comentarios_FinSesion) VALUES (7, 5, '2023-12-26', '63 minutos', 'Presencial', 'Customizable well-modulated instruction set', 'strategize bricks-and-clicks networks', 'Quas quis vitae modi.');
INSERT INTO sesion_mentoria (Id_Mentor, Id_Emprendedor, Fecha_Sesion, Duracion, Tipo_Sesion, Objetivo, Tema_Trata, Comentarios_FinSesion) VALUES (5, 3, '2020-06-11', '116 minutos', 'Virtual', 'Secured radical capacity', 'harness revolutionary action-items', 'Minima ipsam impedit at quaerat placeat.');

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

--REGISTRO DE INSERT (DATOS)

SELECT * FROM APP  --> FALTAN DATOS
SELECT * FROM CAPACITACION  --> COMPLETO
SELECT * FROM CATEGORIA_NEGOCIO --> COMPLETO
SELECT * FROM CONCURSO  --> FALTAN DATOS
SELECT * FROM CURSO  --> COMPLETO
SELECT * FROM DIRECCION  --> COMPLETO
SELECT * FROM DISTRITO --> COMPLETO
SELECT * FROM EMPRENDEDOR  --> FALTAN DATOS
SELECT * FROM ESTADO_CUENTA  --> COMPLETO
SELECT * FROM EVENTOS  --> SI HAY DATOS PERO LOS NOMBRES Y DESCRIPCIONES DEBEN ESTAN EN LOREM IMPSUM
SELECT * FROM FACTURACION  --> FALTAN DATOS
SELECT * FROM FEEDBACK  --> FALTAN DATOS
SELECT * FROM HISTORICO_EMPRENDIMIENTO --> FALTAN DATOS
SELECT * FROM MENTOR --> COMPLETO
SELECT * FROM NEGOCIO  --> FALTAN DATOS
SELECT * FROM ORGANIZACION_PATROCINADORA  --> DESCRIPCION ESTA EN LOREM IMPSUM (90%)
SELECT * FROM PREMIOS_CONCURSO --> FALTAN DATOS
SELECT * FROM RECURSOS --> FALTAN NOMBRES REALES
SELECT * FROM REDES_SOCIALES --> COMPLETO
SELECT * FROM SESION_MENTORIA --> FALTAN DATOS
SELECT * FROM TIPO_CONCURSO --> COMPLETO
SELECT * FROM TIPO_USUARIO --> COMPLETO
SELECT * FROM USUARIO --> FALTAN NOMBRES REALES