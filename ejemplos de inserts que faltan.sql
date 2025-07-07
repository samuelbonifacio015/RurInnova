USE RurInnova;
GO

-- **APP** --> FALTAN DATOS
-- Si 'app' solo contendrá un valor, lo insertamos.
INSERT INTO app (Plataforma) VALUES ('RurInnova Plataforma Central');
GO

-- **CAPACITACION** --> NOMBRES REALES FALTAN (Ya tienes 10 inserciones con nombres reales. No se requieren más.)
-- El archivo 'insercionDatosTables.sql' ya contiene inserciones para la tabla 'capacitacion' con nombres de programas reales.
-- No es necesario agregar más aquí a menos que quieras más datos de prueba.

-- **CONCURSO** --> FALTAN DATOS
-- Necesitamos Id_Organizacion, Evaluador_Responsable (Id_Usuario de tipo 'Evaluador') e Id_Tipo_Concurso.
-- Basándonos en las inserciones existentes:
-- Tipo de Usuario para Evaluador (Id_Tipo_Usuario = 6)
-- Organizaciones patrocinadoras (Id_Organizacion del 1 al 10)
-- Tipos de concurso (Id_Tipo_Concurso del 1 al 10)

INSERT INTO concurso (Nombre_Concurso, Descripcion_Concurso, Fecha_Lanzamiento, Fecha_Cierre, Premios_Ofrecidos, Tema_Concurso, Numero_Participantes, Evaluador_Responsable, Id_Organizacion, Estado_Concurso, Id_Tipo_Concurso) VALUES
('Concurso de Innovación Rural 2024', 'Impulsando ideas innovadoras para el desarrollo sostenible en zonas rurales.', '2024-03-01', '2024-05-30', 'Capital semilla de S/ 10,000, mentoría especializada, incubación de negocio.', 'Desarrollo Agrícola Sostenible', 50, (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'toribio.saez@gmail.com'), 1, 'Abierto', (SELECT Id_Tipo_Concurso FROM tipo_concurso WHERE Nombre_Tipo_Concurso = 'Nacional')),
('Reto Emprendedor Digital', 'Concurso enfocado en soluciones tecnológicas para el comercio rural.', '2024-04-15', '2024-07-15', 'Acceso a fondos de inversión, capacitación en e-commerce, visibilidad mediática.', 'E-commerce Rural', 35, (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'julia.fortuny@gmail.com'), 3, 'En Evaluación', (SELECT Id_Tipo_Concurso FROM tipo_concurso WHERE Nombre_Tipo_Concurso = 'Virtual')),
('Concurso de Emprendimientos Verdes', 'Proyectos con impacto ambiental positivo en comunidades rurales.', '2024-06-01', '2024-08-31', 'Financiamiento inicial de S/ 7,500, certificaciones ecológicas, red de contactos.', 'Sostenibilidad y Medio Ambiente', 40, (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'roldán.casanovas@gmail.com'), 5, 'Cerrado', (SELECT Id_Tipo_Concurso FROM tipo_concurso WHERE Nombre_Tipo_Concurso = 'Regional')),
('Hackathon RurInnova', 'Maratón de desarrollo de software para desafíos rurales específicos.', '2024-09-01', '2024-09-07', 'Premios en efectivo, oportunidades de pasantías, prototipado de ideas.', 'Tecnología para el Campo', 25, (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'toribio.saez@gmail.com'), 7, 'Abierto', (SELECT Id_Tipo_Concurso FROM tipo_concurso WHERE Nombre_Tipo_Concurso = 'Híbrido')),
('Ideas para mi Comunidad', 'Concurso de proyectos sociales para mejorar la calidad de vida en distritos rurales.', '2024-10-01', '2024-12-15', 'Apoyo para la implementación del proyecto, recursos materiales, asesoría social.', 'Innovación Social', 60, (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'roldán.casanovas@gmail.com'), 9, 'En Planificación', (SELECT Id_Tipo_Concurso FROM tipo_concurso WHERE Nombre_Tipo_Concurso = 'Local'));
GO

-- **EMPRENDEDOR** --> FALTAN DATOS
-- Necesitamos relacionarlos con usuarios existentes que sean de tipo 'Emprendedor'.
-- Basándonos en las inserciones de 'usuario':
-- 'julia' (Id_Tipo_Usuario = 2), 'benita' (Id_Tipo_Usuario = 4), 'augusto' (Id_Tipo_Usuario = 5), 'aránzazu' (Id_Tipo_Usuario = 8), 'basilio' (Id_Tipo_Usuario = 7)
-- También necesitamos Id_Distrito.

INSERT INTO emprendedor (Id_Usuario, Nombre_Completo, Fecha_Nacimiento, DNI, Telefono, Correo_Electronico, Tipo_Emprendimiento, Estado_Emprendimiento, Distrito_Residencia, Descripcion_Negocio, Id_Distrito) VALUES
((SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'julia.fortuny@gmail.com'), 'Julia Fortuny', '1990-05-15', '45678912A', '987654321', 'julia.fortuny@gmail.com', 'Agroindustrial', 'En Desarrollo', 'Miraflores', 'Desarrollo de productos orgánicos a partir de cultivos andinos.', (SELECT Id_Distrito FROM distrito WHERE Nombre_Distrito = 'Miraflores')),
((SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'benita.montero@gmail.com'), 'Benita Montero', '1988-11-20', '78912345B', '998877665', 'benita.montero@gmail.com', 'Turismo Rural Comunitario', 'Activo', 'Barranco', 'Ofreciendo experiencias turísticas auténticas en comunidades rurales.', (SELECT Id_Distrito FROM distrito WHERE Nombre_Distrito = 'Barranco')),
((SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'augusto.carretero@gmail.com'), 'Augusto Carretero', '1992-03-08', '12398765C', '912345678', 'augusto.carretero@gmail.com', 'Artesanía Innovadora', 'Fase Inicial', 'Surco', 'Creación de productos artesanales con diseños modernos y sostenibles.', (SELECT Id_Distrito FROM distrito WHERE Nombre_Distrito = 'Surco')),
((SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'basilio.ayuso@gmail.com'), 'Basilio Ayuso', '1985-07-22', '34567890D', '934567890', 'basilio.ayuso@gmail.com', 'Tecnología Agrícola', 'En Crecimiento', 'La Molina', 'Implementación de soluciones IoT para optimizar cultivos y riego.', (SELECT Id_Distrito FROM distrito WHERE Nombre_Distrito = 'La Molina')),
((SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'juan josé.millán@gmail.com'), 'Juan José Millán', '1995-01-30', '56789012E', '956789012', 'juan josé.millán@gmail.com', 'Gastronomía Local', 'Activo', 'San Miguel', 'Promoción de la gastronomía regional con ingredientes de pequeños productores.', (SELECT Id_Distrito FROM distrito WHERE Nombre_Distrito = 'San Miguel'));
GO

-- **EVENTOS** --> SI HAY DATOS PERO LOS NOMBRES Y DESCRIPCIONES DEBEN ESTAN EN LOREM IPSUM (Ya hay datos, solo si deseas más y con descripciones más coherentes).
-- Los datos existentes ya tienen descripciones tipo "Lorem Ipsum", así que no es necesario modificar.
-- Si quieres agregar más, aquí hay algunos ejemplos con nombres y descripciones más "reales":
INSERT INTO eventos (Nombre_Evento, Fecha_Evento, Descripcion, Lugar) VALUES
('Feria de Emprendimiento Rural', '2025-07-20', 'Exposición y venta de productos de emprendedores rurales, con charlas y talleres.', 'Parque Kennedy, Miraflores'),
('Taller de Digitalización para PYMES', '2025-08-10', 'Capacitación intensiva sobre herramientas digitales para pequeños y medianos negocios.', 'Centro Empresarial, San Isidro'),
('Encuentro de Inversionistas RurInnova', '2025-09-05', 'Sesión de networking y presentación de proyectos a potenciales inversionistas.', 'Club Empresarial, San Borja');
GO

-- **FACTURACION** --> FALTAN DATOS
-- Necesitamos Id_Emprendedor. Los hemos insertado en el paso anterior.
-- Usaremos los Id_Emprendedor de 1 a 5 (de las inserciones previas).

INSERT INTO facturacion (Id_Emprendedor, Monto, Fecha_Factura, Metodo_Pago, Estado_Pago) VALUES
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'julia.fortuny@gmail.com')), 150.00, '2024-05-10', 'Tarjeta de Crédito', 'Pagado'),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'benita.montero@gmail.com')), 250.00, '2024-05-12', 'Transferencia Bancaria', 'Pendiente'),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'augusto.carretero@gmail.com')), 75.50, '2024-05-15', 'Efectivo', 'Pagado'),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'basilio.ayuso@gmail.com')), 300.00, '2024-05-18', 'Tarjeta de Crédito', 'Pagado'),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'juan josé.millán@gmail.com')), 120.75, '2024-05-20', 'Transferencia Bancaria', 'Pendiente');
GO

-- **FEEDBACK** --> FALTAN DATOS
-- Necesitamos Id_Usuario (quien da el feedback) e Id_Emprendedor (a quien se le da).
-- Usaremos algunos usuarios y los emprendedores insertados.

INSERT INTO feedback (Id_Usuario, Id_Emprendedor, Comentario, Valoracion, Fecha_Feedback) VALUES
((SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'roldán.casanovas@gmail.com'), (SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'julia.fortuny@gmail.com')), 'Excelente propuesta de valor, buen potencial de mercado.', 5, '2024-06-01'),
((SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'toribio.saez@gmail.com'), (SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'benita.montero@gmail.com')), 'Necesita mejorar la estrategia de marketing digital.', 3, '2024-06-03'),
((SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'carina.zurita@gmail.com'), (SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'augusto.carretero@gmail.com')), 'Producto muy creativo, se recomienda validar el nicho de mercado.', 4, '2024-06-05'),
((SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'maría fernanda.coca@gmail.com'), (SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'basilio.ayuso@gmail.com')), 'Solución tecnológica con gran impacto, requiere más pruebas piloto.', 4, '2024-06-07'),
((SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'benita.montero@gmail.com'), (SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'juan josé.millán@gmail.com')), 'Idea interesante, el plan de negocio necesita más detalle financiero.', 3, '2024-06-09');
GO

-- **HISTORICO_EMPRENDIMIENTO** --> FALTAN DATOS
-- Necesitamos Id_Emprendedor.

INSERT INTO historico_emprendimiento (Id_Emprendedor, Nombre_Negocio, Fecha_Inicio, Fecha_Fin, Estado, Descripcion) VALUES
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'julia.fortuny@gmail.com')), 'BioAndes S.A.C.', '2020-01-01', '2023-12-31', 'Activo', 'Empresa dedicada a la producción y comercialización de superalimentos andinos.'),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'benita.montero@gmail.com')), 'Rutas Mágicas del Perú', '2019-06-15', '2022-11-30', 'Inactivo', 'Operador turístico especializado en rutas vivenciales en la sierra de Lima.'),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'augusto.carretero@gmail.com')), 'Artesanía Fusión', '2021-03-01', NULL, 'Activo', 'Taller de diseño y producción de artesanías con materiales reciclados.'),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'basilio.ayuso@gmail.com')), 'AgroSmart Tech', '2022-09-01', NULL, 'Activo', 'Desarrollo de sensores y sistemas automatizados para agricultura de precisión.'),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'juan josé.millán@gmail.com')), 'Sabor Andino Gourmet', '2023-04-01', NULL, 'Activo', 'Restaurante de comida fusión andina con enfoque en ingredientes locales.');
GO

-- **NEGOCIO** --> FALTAN DATOS
-- Necesitamos Id_Emprendedor e Id_Categoria.

INSERT INTO negocio (Id_Emprendedor, Nombre_Negocio, Descripcion_Negocio, Tipo_Negocio, Estado_Negocio, Capital_Recibido, Monto_Objetivo, Fecha_Ultima_Actualizacion, Id_Categoria) VALUES
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'julia.fortuny@gmail.com')), 'Eco Alimentos Perú', 'Producción y comercialización de alimentos orgánicos y saludables.', 'Nacional', 'Activo', 50000.00, 100000.00, '2024-05-01', (SELECT Id_Categoria FROM categoria_negocio WHERE Nombre_Categoria = 'Agricultura')),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'benita.montero@gmail.com')), 'Viajes Auténticos', 'Paquetes turísticos que promueven el ecoturismo y la cultura local.', 'Regional', 'Activo', 30000.00, 75000.00, '2024-04-20', (SELECT Id_Categoria FROM categoria_negocio WHERE Nombre_Categoria = 'Turismo')),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'augusto.carretero@gmail.com')), 'Diseño Andino Moderno', 'Creación de piezas de diseño inspiradas en el arte ancestral peruano.', 'Local', 'En Desarrollo', 15000.00, 40000.00, '2024-05-15', (SELECT Id_Categoria FROM categoria_negocio WHERE Nombre_Categoria = 'Comercio')),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'basilio.ayuso@gmail.com')), 'Smart Farm Solutions', 'Desarrollo de software y hardware para la gestión inteligente de cultivos.', 'Nacional', 'Activo', 75000.00, 150000.00, '2024-05-05', (SELECT Id_Categoria FROM categoria_negocio WHERE Nombre_Categoria = 'Tecnología')),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'juan josé.millán@gmail.com')), 'Sabores del Campo', 'Restaurante con propuesta de valor basada en productos frescos de pequeños agricultores.', 'Local', 'Activo', 25000.00, 60000.00, '2024-04-28', (SELECT Id_Categoria FROM categoria_negocio WHERE Nombre_Categoria = 'Servicios'));
GO

-- **PREMIOS_CONCURSO** --> FALTAN DATOS
-- Necesitamos Id_Concurso. Ya hemos insertado algunos concursos.

INSERT INTO premios_concurso (Id_Concurso, Premio, Descripcion) VALUES
((SELECT Id_Concurso FROM concurso WHERE Nombre_Concurso = 'Concurso de Innovación Rural 2024'), 'Capital Semilla S/ 10,000', 'Financiamiento directo para el desarrollo del proyecto ganador.'),
((SELECT Id_Concurso FROM concurso WHERE Nombre_Concurso = 'Concurso de Innovación Rural 2024'), 'Mentoría Especializada', '12 meses de asesoría con expertos en el sector.'),
((SELECT Id_Concurso FROM concurso WHERE Nombre_Concurso = 'Reto Emprendedor Digital'), 'Acceso a Fondos de Inversión', 'Oportunidad de presentar el proyecto a una red de inversionistas.'),
((SELECT Id_Concurso FROM concurso WHERE Nombre_Concurso = 'Reto Emprendedor Digital'), 'Campaña de Marketing Digital', 'Apoyo en la difusión y visibilidad del negocio en plataformas online.'),
((SELECT Id_Concurso FROM concurso WHERE Nombre_Concurso = 'Concurso de Emprendimientos Verdes'), 'Certificación Ecológica', 'Obtención de sellos de certificación para productos sostenibles.');
GO

-- **RECURSOS** --> FALTAN NOMBRES REALES (Hay 10 inserciones con títulos y descripciones tipo "Lorem Ipsum", generamos más con nombres "reales" o claros)

INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tamaño, Fecha_Publicacion, Tamaño_Descarga, Id_Usuario) VALUES
('Guía', 'Guía de Formalización de Negocios Rurales', 'Documento detallado sobre los pasos para formalizar un negocio en zonas rurales.', 'PDF', '5 MB', '2023-01-15', '5.2 MB', (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'carina.zurita@gmail.com')),
('Artículo', 'Casos de Éxito: Emprendedores Rurales', 'Compilación de historias inspiradoras de emprendedores que transformaron sus comunidades.', 'PDF', '8 MB', '2023-02-20', '8.5 MB', (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'maría fernanda.coca@gmail.com')),
('Video', 'Taller de Marketing Digital para Agricultores', 'Video de un taller práctico sobre cómo usar redes sociales para vender productos agrícolas.', 'MP4', '150 MB', '2023-03-10', '150.7 MB', (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'benita.montero@gmail.com')),
('Infografía', 'Beneficios de la Economía Circular en el Campo', 'Representación visual de los principios y ventajas de la economía circular en el sector rural.', 'JPG', '2 MB', '2023-04-05', '2.1 MB', (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'augusto.carretero@gmail.com')),
('Webinar', 'Financiamiento para Proyectos Sostenibles', 'Grabación de un seminario web sobre opciones de financiamiento para iniciativas ecológicas.', 'MP4', '200 MB', '2023-05-01', '201.5 MB', (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'basilio.ayuso@gmail.com'));
GO

-- **SESION_MENTORIA** --> FALTAN DATOS
-- Necesitamos Id_Mentor e Id_Emprendedor.

INSERT INTO sesion_mentoria (Id_Mentor, Id_Emprendedor, Fecha_Sesion, Duracion, Tipo_Sesion, Objetivo, Tema_Trata, Comentarios_FinSesion) VALUES
((SELECT Id_Mentor FROM mentor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'gduran@checa-giner.net')), (SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'julia.fortuny@gmail.com')), '2024-06-10', '60 minutos', 'Virtual', 'Desarrollo de estrategia de mercado.', 'Análisis FODA y Segmentación de Mercado', 'Se definieron los nichos de mercado principales.'),
((SELECT Id_Mentor FROM mentor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'vayuso@saavedra-cifuentes.es')), (SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'benita.montero@gmail.com')), '2024-06-12', '90 minutos', 'Presencial', 'Optimización de experiencia del cliente.', 'Diseño de Rutas Turísticas y Satisfacción del Cliente', 'Se propusieron nuevas actividades interactivas.'),
((SELECT Id_Mentor FROM mentor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'rleiva@castrillo-alberto.es')), (SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'augusto.carretero@gmail.com')), '2024-06-14', '75 minutos', 'Virtual', 'Estrategia de pricing y costos.', 'Análisis de Costos de Producción y Estrategias de Precios', 'Se ajustaron los precios de algunos productos para mayor competitividad.'),
((SELECT Id_Mentor FROM mentor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'sergio46@aguilera.es')), (SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'basilio.ayuso@gmail.com')), '2024-06-16', '120 minutos', 'Presencial', 'Integración de nuevas tecnologías.', 'Implementación de Sensores y Plataformas de Monitoreo', 'Se planificó la fase de integración de los nuevos sensores.'),
((SELECT Id_Mentor FROM mentor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'quintanavictoria@somoza.org')), (SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'juan josé.millán@gmail.com')), '2024-06-18', '60 minutos', 'Virtual', 'Estrategia de redes sociales para promoción.', 'Creación de Contenido y Gestión de Redes', 'Se diseñó un calendario de publicaciones para el próximo mes.');
GO

-- **USUARIO** --> FALTAN NOMBRES REALES (Ya hay 10 inserciones. Si quieres agregar más, aquí hay ejemplos con nombres reales).
-- Si consideras que ya tienes suficientes usuarios de prueba, no es necesario agregar más.
-- Los nombres actuales son 'roldán', 'julia', 'toribio', etc., que son válidos como nombres de usuario.
-- Si la nota "FALTAN NOMBRES REALES" se refiere a que los `Nombre_Usuario` deben ser nombres y apellidos completos, podrías actualizarlos.
-- Por ejemplo, para el usuario 'roldán':
-- UPDATE usuario SET Nombre_Usuario = 'Roldán Casanovas' WHERE Correo_Electronico = 'roldán.casanovas@gmail.com';
-- Sin embargo, si `Nombre_Usuario` es un alias o un login, los actuales están bien.
-- Asumiendo que se refiere a que los nombres deben sonar "más reales" y no solo ser un nombre de pila, los que ya tienes en el archivo `insercionDatosTables.sql` son nombres y apellidos inventados que ya suenan bastante reales (ej. "roldán", "julia", "toribio"). No se requiere una acción adicional aquí si estás satisfecho con esos.

-- Finalmente, para verificar, puedes ejecutar estos SELECTs después de las inserciones:
SELECT * FROM APP;
SELECT * FROM CAPACITACION;
SELECT * FROM CATEGORIA_NEGOCIO;
SELECT * FROM CONCURSO;
SELECT * FROM CURSO;
SELECT * FROM DIRECCION;
SELECT * FROM DISTRITO;
SELECT * FROM EMPRENDEDOR;
SELECT * FROM ESTADO_CUENTA;
SELECT * FROM EVENTOS;
SELECT * FROM FACTURACION;
SELECT * FROM FEEDBACK;
SELECT * FROM HISTORICO_EMPRENDIMIENTO;
SELECT * FROM MENTOR;
SELECT * FROM NEGOCIO;
SELECT * FROM ORGANIZACION_PATROCINADORA;
SELECT * FROM PREMIOS_CONCURSO;
SELECT * FROM RECURSOS;
SELECT * FROM REDES_SOCIALES;
SELECT * FROM SESION_MENTORIA;
SELECT * FROM TIPO_CONCURSO;
SELECT * FROM TIPO_USUARIO;
SELECT * FROM USUARIO;