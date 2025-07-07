USE RurInnova;
GO

-- **APP** --> FALTAN DATOS
-- Si 'app' solo contendr� un valor, lo insertamos.
INSERT INTO app (Plataforma) VALUES ('RurInnova Plataforma Central');
GO

-- **CAPACITACION** --> NOMBRES REALES FALTAN (Ya tienes 10 inserciones con nombres reales. No se requieren m�s.)
-- El archivo 'insercionDatosTables.sql' ya contiene inserciones para la tabla 'capacitacion' con nombres de programas reales.
-- No es necesario agregar m�s aqu� a menos que quieras m�s datos de prueba.

-- **CONCURSO** --> FALTAN DATOS
-- Necesitamos Id_Organizacion, Evaluador_Responsable (Id_Usuario de tipo 'Evaluador') e Id_Tipo_Concurso.
-- Bas�ndonos en las inserciones existentes:
-- Tipo de Usuario para Evaluador (Id_Tipo_Usuario = 6)
-- Organizaciones patrocinadoras (Id_Organizacion del 1 al 10)
-- Tipos de concurso (Id_Tipo_Concurso del 1 al 10)

INSERT INTO concurso (Nombre_Concurso, Descripcion_Concurso, Fecha_Lanzamiento, Fecha_Cierre, Premios_Ofrecidos, Tema_Concurso, Numero_Participantes, Evaluador_Responsable, Id_Organizacion, Estado_Concurso, Id_Tipo_Concurso) VALUES
('Concurso de Innovaci�n Rural 2024', 'Impulsando ideas innovadoras para el desarrollo sostenible en zonas rurales.', '2024-03-01', '2024-05-30', 'Capital semilla de S/ 10,000, mentor�a especializada, incubaci�n de negocio.', 'Desarrollo Agr�cola Sostenible', 50, (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'toribio.saez@gmail.com'), 1, 'Abierto', (SELECT Id_Tipo_Concurso FROM tipo_concurso WHERE Nombre_Tipo_Concurso = 'Nacional')),
('Reto Emprendedor Digital', 'Concurso enfocado en soluciones tecnol�gicas para el comercio rural.', '2024-04-15', '2024-07-15', 'Acceso a fondos de inversi�n, capacitaci�n en e-commerce, visibilidad medi�tica.', 'E-commerce Rural', 35, (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'julia.fortuny@gmail.com'), 3, 'En Evaluaci�n', (SELECT Id_Tipo_Concurso FROM tipo_concurso WHERE Nombre_Tipo_Concurso = 'Virtual')),
('Concurso de Emprendimientos Verdes', 'Proyectos con impacto ambiental positivo en comunidades rurales.', '2024-06-01', '2024-08-31', 'Financiamiento inicial de S/ 7,500, certificaciones ecol�gicas, red de contactos.', 'Sostenibilidad y Medio Ambiente', 40, (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'rold�n.casanovas@gmail.com'), 5, 'Cerrado', (SELECT Id_Tipo_Concurso FROM tipo_concurso WHERE Nombre_Tipo_Concurso = 'Regional')),
('Hackathon RurInnova', 'Marat�n de desarrollo de software para desaf�os rurales espec�ficos.', '2024-09-01', '2024-09-07', 'Premios en efectivo, oportunidades de pasant�as, prototipado de ideas.', 'Tecnolog�a para el Campo', 25, (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'toribio.saez@gmail.com'), 7, 'Abierto', (SELECT Id_Tipo_Concurso FROM tipo_concurso WHERE Nombre_Tipo_Concurso = 'H�brido')),
('Ideas para mi Comunidad', 'Concurso de proyectos sociales para mejorar la calidad de vida en distritos rurales.', '2024-10-01', '2024-12-15', 'Apoyo para la implementaci�n del proyecto, recursos materiales, asesor�a social.', 'Innovaci�n Social', 60, (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'rold�n.casanovas@gmail.com'), 9, 'En Planificaci�n', (SELECT Id_Tipo_Concurso FROM tipo_concurso WHERE Nombre_Tipo_Concurso = 'Local'));
GO

-- **EMPRENDEDOR** --> FALTAN DATOS
-- Necesitamos relacionarlos con usuarios existentes que sean de tipo 'Emprendedor'.
-- Bas�ndonos en las inserciones de 'usuario':
-- 'julia' (Id_Tipo_Usuario = 2), 'benita' (Id_Tipo_Usuario = 4), 'augusto' (Id_Tipo_Usuario = 5), 'ar�nzazu' (Id_Tipo_Usuario = 8), 'basilio' (Id_Tipo_Usuario = 7)
-- Tambi�n necesitamos Id_Distrito.

INSERT INTO emprendedor (Id_Usuario, Nombre_Completo, Fecha_Nacimiento, DNI, Telefono, Correo_Electronico, Tipo_Emprendimiento, Estado_Emprendimiento, Distrito_Residencia, Descripcion_Negocio, Id_Distrito) VALUES
((SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'julia.fortuny@gmail.com'), 'Julia Fortuny', '1990-05-15', '45678912A', '987654321', 'julia.fortuny@gmail.com', 'Agroindustrial', 'En Desarrollo', 'Miraflores', 'Desarrollo de productos org�nicos a partir de cultivos andinos.', (SELECT Id_Distrito FROM distrito WHERE Nombre_Distrito = 'Miraflores')),
((SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'benita.montero@gmail.com'), 'Benita Montero', '1988-11-20', '78912345B', '998877665', 'benita.montero@gmail.com', 'Turismo Rural Comunitario', 'Activo', 'Barranco', 'Ofreciendo experiencias tur�sticas aut�nticas en comunidades rurales.', (SELECT Id_Distrito FROM distrito WHERE Nombre_Distrito = 'Barranco')),
((SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'augusto.carretero@gmail.com'), 'Augusto Carretero', '1992-03-08', '12398765C', '912345678', 'augusto.carretero@gmail.com', 'Artesan�a Innovadora', 'Fase Inicial', 'Surco', 'Creaci�n de productos artesanales con dise�os modernos y sostenibles.', (SELECT Id_Distrito FROM distrito WHERE Nombre_Distrito = 'Surco')),
((SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'basilio.ayuso@gmail.com'), 'Basilio Ayuso', '1985-07-22', '34567890D', '934567890', 'basilio.ayuso@gmail.com', 'Tecnolog�a Agr�cola', 'En Crecimiento', 'La Molina', 'Implementaci�n de soluciones IoT para optimizar cultivos y riego.', (SELECT Id_Distrito FROM distrito WHERE Nombre_Distrito = 'La Molina')),
((SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'juan jos�.mill�n@gmail.com'), 'Juan Jos� Mill�n', '1995-01-30', '56789012E', '956789012', 'juan jos�.mill�n@gmail.com', 'Gastronom�a Local', 'Activo', 'San Miguel', 'Promoci�n de la gastronom�a regional con ingredientes de peque�os productores.', (SELECT Id_Distrito FROM distrito WHERE Nombre_Distrito = 'San Miguel'));
GO

-- **EVENTOS** --> SI HAY DATOS PERO LOS NOMBRES Y DESCRIPCIONES DEBEN ESTAN EN LOREM IPSUM (Ya hay datos, solo si deseas m�s y con descripciones m�s coherentes).
-- Los datos existentes ya tienen descripciones tipo "Lorem Ipsum", as� que no es necesario modificar.
-- Si quieres agregar m�s, aqu� hay algunos ejemplos con nombres y descripciones m�s "reales":
INSERT INTO eventos (Nombre_Evento, Fecha_Evento, Descripcion, Lugar) VALUES
('Feria de Emprendimiento Rural', '2025-07-20', 'Exposici�n y venta de productos de emprendedores rurales, con charlas y talleres.', 'Parque Kennedy, Miraflores'),
('Taller de Digitalizaci�n para PYMES', '2025-08-10', 'Capacitaci�n intensiva sobre herramientas digitales para peque�os y medianos negocios.', 'Centro Empresarial, San Isidro'),
('Encuentro de Inversionistas RurInnova', '2025-09-05', 'Sesi�n de networking y presentaci�n de proyectos a potenciales inversionistas.', 'Club Empresarial, San Borja');
GO

-- **FACTURACION** --> FALTAN DATOS
-- Necesitamos Id_Emprendedor. Los hemos insertado en el paso anterior.
-- Usaremos los Id_Emprendedor de 1 a 5 (de las inserciones previas).

INSERT INTO facturacion (Id_Emprendedor, Monto, Fecha_Factura, Metodo_Pago, Estado_Pago) VALUES
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'julia.fortuny@gmail.com')), 150.00, '2024-05-10', 'Tarjeta de Cr�dito', 'Pagado'),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'benita.montero@gmail.com')), 250.00, '2024-05-12', 'Transferencia Bancaria', 'Pendiente'),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'augusto.carretero@gmail.com')), 75.50, '2024-05-15', 'Efectivo', 'Pagado'),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'basilio.ayuso@gmail.com')), 300.00, '2024-05-18', 'Tarjeta de Cr�dito', 'Pagado'),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'juan jos�.mill�n@gmail.com')), 120.75, '2024-05-20', 'Transferencia Bancaria', 'Pendiente');
GO

-- **FEEDBACK** --> FALTAN DATOS
-- Necesitamos Id_Usuario (quien da el feedback) e Id_Emprendedor (a quien se le da).
-- Usaremos algunos usuarios y los emprendedores insertados.

INSERT INTO feedback (Id_Usuario, Id_Emprendedor, Comentario, Valoracion, Fecha_Feedback) VALUES
((SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'rold�n.casanovas@gmail.com'), (SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'julia.fortuny@gmail.com')), 'Excelente propuesta de valor, buen potencial de mercado.', 5, '2024-06-01'),
((SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'toribio.saez@gmail.com'), (SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'benita.montero@gmail.com')), 'Necesita mejorar la estrategia de marketing digital.', 3, '2024-06-03'),
((SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'carina.zurita@gmail.com'), (SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'augusto.carretero@gmail.com')), 'Producto muy creativo, se recomienda validar el nicho de mercado.', 4, '2024-06-05'),
((SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'mar�a fernanda.coca@gmail.com'), (SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'basilio.ayuso@gmail.com')), 'Soluci�n tecnol�gica con gran impacto, requiere m�s pruebas piloto.', 4, '2024-06-07'),
((SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'benita.montero@gmail.com'), (SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'juan jos�.mill�n@gmail.com')), 'Idea interesante, el plan de negocio necesita m�s detalle financiero.', 3, '2024-06-09');
GO

-- **HISTORICO_EMPRENDIMIENTO** --> FALTAN DATOS
-- Necesitamos Id_Emprendedor.

INSERT INTO historico_emprendimiento (Id_Emprendedor, Nombre_Negocio, Fecha_Inicio, Fecha_Fin, Estado, Descripcion) VALUES
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'julia.fortuny@gmail.com')), 'BioAndes S.A.C.', '2020-01-01', '2023-12-31', 'Activo', 'Empresa dedicada a la producci�n y comercializaci�n de superalimentos andinos.'),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'benita.montero@gmail.com')), 'Rutas M�gicas del Per�', '2019-06-15', '2022-11-30', 'Inactivo', 'Operador tur�stico especializado en rutas vivenciales en la sierra de Lima.'),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'augusto.carretero@gmail.com')), 'Artesan�a Fusi�n', '2021-03-01', NULL, 'Activo', 'Taller de dise�o y producci�n de artesan�as con materiales reciclados.'),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'basilio.ayuso@gmail.com')), 'AgroSmart Tech', '2022-09-01', NULL, 'Activo', 'Desarrollo de sensores y sistemas automatizados para agricultura de precisi�n.'),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'juan jos�.mill�n@gmail.com')), 'Sabor Andino Gourmet', '2023-04-01', NULL, 'Activo', 'Restaurante de comida fusi�n andina con enfoque en ingredientes locales.');
GO

-- **NEGOCIO** --> FALTAN DATOS
-- Necesitamos Id_Emprendedor e Id_Categoria.

INSERT INTO negocio (Id_Emprendedor, Nombre_Negocio, Descripcion_Negocio, Tipo_Negocio, Estado_Negocio, Capital_Recibido, Monto_Objetivo, Fecha_Ultima_Actualizacion, Id_Categoria) VALUES
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'julia.fortuny@gmail.com')), 'Eco Alimentos Per�', 'Producci�n y comercializaci�n de alimentos org�nicos y saludables.', 'Nacional', 'Activo', 50000.00, 100000.00, '2024-05-01', (SELECT Id_Categoria FROM categoria_negocio WHERE Nombre_Categoria = 'Agricultura')),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'benita.montero@gmail.com')), 'Viajes Aut�nticos', 'Paquetes tur�sticos que promueven el ecoturismo y la cultura local.', 'Regional', 'Activo', 30000.00, 75000.00, '2024-04-20', (SELECT Id_Categoria FROM categoria_negocio WHERE Nombre_Categoria = 'Turismo')),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'augusto.carretero@gmail.com')), 'Dise�o Andino Moderno', 'Creaci�n de piezas de dise�o inspiradas en el arte ancestral peruano.', 'Local', 'En Desarrollo', 15000.00, 40000.00, '2024-05-15', (SELECT Id_Categoria FROM categoria_negocio WHERE Nombre_Categoria = 'Comercio')),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'basilio.ayuso@gmail.com')), 'Smart Farm Solutions', 'Desarrollo de software y hardware para la gesti�n inteligente de cultivos.', 'Nacional', 'Activo', 75000.00, 150000.00, '2024-05-05', (SELECT Id_Categoria FROM categoria_negocio WHERE Nombre_Categoria = 'Tecnolog�a')),
((SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'juan jos�.mill�n@gmail.com')), 'Sabores del Campo', 'Restaurante con propuesta de valor basada en productos frescos de peque�os agricultores.', 'Local', 'Activo', 25000.00, 60000.00, '2024-04-28', (SELECT Id_Categoria FROM categoria_negocio WHERE Nombre_Categoria = 'Servicios'));
GO

-- **PREMIOS_CONCURSO** --> FALTAN DATOS
-- Necesitamos Id_Concurso. Ya hemos insertado algunos concursos.

INSERT INTO premios_concurso (Id_Concurso, Premio, Descripcion) VALUES
((SELECT Id_Concurso FROM concurso WHERE Nombre_Concurso = 'Concurso de Innovaci�n Rural 2024'), 'Capital Semilla S/ 10,000', 'Financiamiento directo para el desarrollo del proyecto ganador.'),
((SELECT Id_Concurso FROM concurso WHERE Nombre_Concurso = 'Concurso de Innovaci�n Rural 2024'), 'Mentor�a Especializada', '12 meses de asesor�a con expertos en el sector.'),
((SELECT Id_Concurso FROM concurso WHERE Nombre_Concurso = 'Reto Emprendedor Digital'), 'Acceso a Fondos de Inversi�n', 'Oportunidad de presentar el proyecto a una red de inversionistas.'),
((SELECT Id_Concurso FROM concurso WHERE Nombre_Concurso = 'Reto Emprendedor Digital'), 'Campa�a de Marketing Digital', 'Apoyo en la difusi�n y visibilidad del negocio en plataformas online.'),
((SELECT Id_Concurso FROM concurso WHERE Nombre_Concurso = 'Concurso de Emprendimientos Verdes'), 'Certificaci�n Ecol�gica', 'Obtenci�n de sellos de certificaci�n para productos sostenibles.');
GO

-- **RECURSOS** --> FALTAN NOMBRES REALES (Hay 10 inserciones con t�tulos y descripciones tipo "Lorem Ipsum", generamos m�s con nombres "reales" o claros)

INSERT INTO recursos (Tipo_Recurso, Titulo, Descripcion, Formato, Tama�o, Fecha_Publicacion, Tama�o_Descarga, Id_Usuario) VALUES
('Gu�a', 'Gu�a de Formalizaci�n de Negocios Rurales', 'Documento detallado sobre los pasos para formalizar un negocio en zonas rurales.', 'PDF', '5 MB', '2023-01-15', '5.2 MB', (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'carina.zurita@gmail.com')),
('Art�culo', 'Casos de �xito: Emprendedores Rurales', 'Compilaci�n de historias inspiradoras de emprendedores que transformaron sus comunidades.', 'PDF', '8 MB', '2023-02-20', '8.5 MB', (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'mar�a fernanda.coca@gmail.com')),
('Video', 'Taller de Marketing Digital para Agricultores', 'Video de un taller pr�ctico sobre c�mo usar redes sociales para vender productos agr�colas.', 'MP4', '150 MB', '2023-03-10', '150.7 MB', (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'benita.montero@gmail.com')),
('Infograf�a', 'Beneficios de la Econom�a Circular en el Campo', 'Representaci�n visual de los principios y ventajas de la econom�a circular en el sector rural.', 'JPG', '2 MB', '2023-04-05', '2.1 MB', (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'augusto.carretero@gmail.com')),
('Webinar', 'Financiamiento para Proyectos Sostenibles', 'Grabaci�n de un seminario web sobre opciones de financiamiento para iniciativas ecol�gicas.', 'MP4', '200 MB', '2023-05-01', '201.5 MB', (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'basilio.ayuso@gmail.com'));
GO

-- **SESION_MENTORIA** --> FALTAN DATOS
-- Necesitamos Id_Mentor e Id_Emprendedor.

INSERT INTO sesion_mentoria (Id_Mentor, Id_Emprendedor, Fecha_Sesion, Duracion, Tipo_Sesion, Objetivo, Tema_Trata, Comentarios_FinSesion) VALUES
((SELECT Id_Mentor FROM mentor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'gduran@checa-giner.net')), (SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'julia.fortuny@gmail.com')), '2024-06-10', '60 minutos', 'Virtual', 'Desarrollo de estrategia de mercado.', 'An�lisis FODA y Segmentaci�n de Mercado', 'Se definieron los nichos de mercado principales.'),
((SELECT Id_Mentor FROM mentor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'vayuso@saavedra-cifuentes.es')), (SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'benita.montero@gmail.com')), '2024-06-12', '90 minutos', 'Presencial', 'Optimizaci�n de experiencia del cliente.', 'Dise�o de Rutas Tur�sticas y Satisfacci�n del Cliente', 'Se propusieron nuevas actividades interactivas.'),
((SELECT Id_Mentor FROM mentor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'rleiva@castrillo-alberto.es')), (SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'augusto.carretero@gmail.com')), '2024-06-14', '75 minutos', 'Virtual', 'Estrategia de pricing y costos.', 'An�lisis de Costos de Producci�n y Estrategias de Precios', 'Se ajustaron los precios de algunos productos para mayor competitividad.'),
((SELECT Id_Mentor FROM mentor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'sergio46@aguilera.es')), (SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'basilio.ayuso@gmail.com')), '2024-06-16', '120 minutos', 'Presencial', 'Integraci�n de nuevas tecnolog�as.', 'Implementaci�n de Sensores y Plataformas de Monitoreo', 'Se planific� la fase de integraci�n de los nuevos sensores.'),
((SELECT Id_Mentor FROM mentor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'quintanavictoria@somoza.org')), (SELECT Id_Emprendedor FROM emprendedor WHERE Id_Usuario = (SELECT Id_Usuario FROM usuario WHERE Correo_Electronico = 'juan jos�.mill�n@gmail.com')), '2024-06-18', '60 minutos', 'Virtual', 'Estrategia de redes sociales para promoci�n.', 'Creaci�n de Contenido y Gesti�n de Redes', 'Se dise�� un calendario de publicaciones para el pr�ximo mes.');
GO

-- **USUARIO** --> FALTAN NOMBRES REALES (Ya hay 10 inserciones. Si quieres agregar m�s, aqu� hay ejemplos con nombres reales).
-- Si consideras que ya tienes suficientes usuarios de prueba, no es necesario agregar m�s.
-- Los nombres actuales son 'rold�n', 'julia', 'toribio', etc., que son v�lidos como nombres de usuario.
-- Si la nota "FALTAN NOMBRES REALES" se refiere a que los `Nombre_Usuario` deben ser nombres y apellidos completos, podr�as actualizarlos.
-- Por ejemplo, para el usuario 'rold�n':
-- UPDATE usuario SET Nombre_Usuario = 'Rold�n Casanovas' WHERE Correo_Electronico = 'rold�n.casanovas@gmail.com';
-- Sin embargo, si `Nombre_Usuario` es un alias o un login, los actuales est�n bien.
-- Asumiendo que se refiere a que los nombres deben sonar "m�s reales" y no solo ser un nombre de pila, los que ya tienes en el archivo `insercionDatosTables.sql` son nombres y apellidos inventados que ya suenan bastante reales (ej. "rold�n", "julia", "toribio"). No se requiere una acci�n adicional aqu� si est�s satisfecho con esos.

-- Finalmente, para verificar, puedes ejecutar estos SELECTs despu�s de las inserciones:
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