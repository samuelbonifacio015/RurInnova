# RurInnova - Sistema de Gestión de Emprendimientos Rurales

## Índice

- [¿Qué es RurInnova?](#qué-es-rurinnova)
- [Estructura](#estructura)
  - [Base de Datos](#base-de-datos)
  - [Archivos Principales](#archivos-principales)
- [Arquitectura de la Base de Datos](#arquitectura-de-la-base-de-datos)
  - [Tablas Principales](#tablas-principales)
  - [Relaciones Principales](#relaciones-principales)
- [Datos de Entrada (CSV)](#datos-de-entrada-csv)
  - [Estructura de Datos](#estructura-de-datos)
  - [Archivos CSV Disponibles](#archivos-csv-disponibles)
- [Funcionalidades del Sistema](#funcionalidades-del-sistema)
  - [Gestión de Emprendedores](#gestión-de-emprendedores)
  - [Sistema de Mentoría](#sistema-de-mentoría)
  - [Concursos y Eventos](#concursos-y-eventos)
  - [Recursos y Capacitación](#recursos-y-capacitación)
  - [Análisis y Reportes](#análisis-y-reportes)
- [Implementación MongoDB](#implementación-mongodb)
  - [Características](#características)
  - [Consultas Disponibles](#consultas-disponibles)
- [Instalación y Configuración](#instalación-y-configuración)
  - [Requisitos Previos](#requisitos-previos)
  - [Pasos de Instalación](#pasos-de-instalación)
- [Mantenimiento](#mantenimiento)
  - [Consideraciones de Actualización](#consideraciones-de-actualización)
  - [Monitoreo](#monitoreo)
- [Documentación Adicional](#documentación-adicional)

---

## ¿Qué es RurInnova?

RurInnova es una plataforma integral diseñada para gestionar y potenciar emprendimientos rurales. El sistema facilita la conexión entre emprendedores, mentores, organizaciones patrocinadoras y recursos de capacitación, proporcionando un ecosistema completo para el desarrollo de negocios en zonas rurales.

## Estructura

### Base de Datos
- **Relacional**: Microsoft SQL Server
- **No Relacional**: MongoDB
- **Nombre**: RurInnova
- **Características**: Base de datos relacional con 20 tablas principales

### Archivos Principales

#### Scripts de Base de Datos
- `RurInnovaDatabaseYTablas.sql` - Creación de la base de datos y todas las tablas
- `InsercionDatosSQLRurInnova.sql` - Datos de ejemplo para todas las tablas
- `insercionDatosTables.sql` - Scripts adicionales de inserción de datos
- `ejemplos de inserts que faltan.sql` - Ejemplos complementarios de inserción

#### Consultas y Análisis
- `SELECTS DE RURINNOVA.sql` - Consultas básicas para verificar datos
- `Consultas MongoDB/README.md` - Consultas anidadas para MongoDB

#### Datos de Entrada
- `csv/` - Directorio con 20 archivos CSV conteniendo datos de ejemplo
- `csv/README_CSV.md` - Documentación de los archivos CSV

## Arquitectura de la Base de Datos

### Tablas Principales

#### Gestión de Usuarios
1. **tipo_usuario** - Tipos de usuario en la plataforma
2. **usuario** - Información básica de usuarios del sistema
3. **direccion** - Direcciones de usuarios con coordenadas geográficas
4. **distrito** - Distritos disponibles en el sistema

#### Emprendimientos
5. **emprendedor** - Perfiles completos de emprendedores
6. **negocio** - Información detallada de los negocios
7. **categoria_negocio** - Categorías de clasificación de negocios
8. **historico_emprendimiento** - Historial de emprendimientos anteriores

#### Mentoría y Capacitación
9. **mentor** - Perfiles de mentores y especialistas
10. **sesion_mentoria** - Registro de sesiones de mentoría
11. **capacitacion** - Programas de capacitación disponibles
12. **curso** - Cursos específicos dentro de programas

#### Concursos y Eventos
13. **concurso** - Concursos y desafíos para emprendedores
14. **tipo_concurso** - Tipos de concursos disponibles
15. **organizacion_patrocinadora** - Organizaciones que patrocinan eventos
16. **premios_concurso** - Premios ofrecidos en concursos

#### Recursos y Comunicación
17. **recursos** - Recursos educativos y materiales
18. **redes_sociales** - Enlaces a redes sociales de usuarios
19. **feedback** - Comentarios y valoraciones del sistema
20. **facturacion** - Información de facturación y pagos

### Relaciones Principales

- **Usuario → Emprendedor**: Un usuario puede ser un emprendedor
- **Usuario → Mentor**: Un usuario puede ser un mentor
- **Emprendedor → Negocio**: Un emprendedor puede tener múltiples negocios
- **Mentor → Sesión_Mentoría**: Un mentor puede realizar múltiples sesiones
- **Concurso → Organización**: Los concursos están asociados a organizaciones
- **Negocio → Categoría**: Los negocios pertenecen a categorías específicas

## Datos de Entrada (CSV)

### Estructura de Datos
- **Total de archivos CSV**: 20
- **Registros por archivo**: 10 registros de ejemplo
- **Total de registros**: 200 registros distribuidos

### Archivos CSV Disponibles

1. **usuario.csv** - Datos de usuarios del sistema
2. **tipo_usuario.csv** - Tipos de usuario disponibles
3. **emprendedor.csv** - Perfiles de emprendedores
4. **negocio.csv** - Información de negocios
5. **categoria_negocio.csv** - Categorías de negocio
6. **mentor.csv** - Perfiles de mentores
7. **sesion_mentoria.csv** - Sesiones de mentoría realizadas
8. **concurso.csv** - Concursos y eventos
9. **tipo_concurso.csv** - Tipos de concurso
10. **organizacion_patrocinadora.csv** - Organizaciones patrocinadoras
11. **premios_concurso.csv** - Premios de concursos
12. **capacitacion.csv** - Programas de capacitación
13. **curso.csv** - Cursos específicos
14. **direccion.csv** - Direcciones de usuarios
15. **distrito.csv** - Distritos disponibles
16. **facturacion.csv** - Datos de facturación
17. **feedback.csv** - Comentarios y valoraciones
18. **historico_emprendimiento.csv** - Historial de emprendimientos
19. **recursos.csv** - Recursos educativos
20. **redes_sociales.csv** - Enlaces a redes sociales

## Funcionalidades del Sistema

### Gestión de Emprendedores
- Registro y perfilamiento de emprendedores
- Seguimiento del estado de emprendimientos
- Historial de emprendimientos anteriores
- Clasificación por tipo de emprendimiento

### Sistema de Mentoría
- Asignación de mentores especializados
- Registro de sesiones de mentoría
- Seguimiento de objetivos y temas tratados
- Evaluación de efectividad de mentorías

### Concursos y Eventos
- Gestión de concursos de innovación
- Registro de organizaciones patrocinadoras
- Seguimiento de premios y participantes
- Estados de concursos (Planificado, Abierto, Cerrado)

### Recursos y Capacitación
- Programas de capacitación estructurados
- Cursos específicos por área
- Recursos educativos en múltiples formatos
- Sistema de feedback y valoraciones

### Análisis y Reportes
- Dashboard de métricas generales
- Análisis de capital por categoría
- Efectividad de mentorías por especialización
- Predicción de éxito de emprendimientos

## Implementación MongoDB

### Características
- Consultas anidadas complejas utilizando `$lookup`
- Agregaciones avanzadas con `$aggregate`
- Análisis multidimensional de datos
- Dashboard completo con métricas clave

### Consultas Disponibles
1. Emprendedores con información completa de usuario y negocio
2. Mentores con sus sesiones de mentoría
3. Concursos con participantes y organizaciones
4. Análisis de capital por categoría de negocio
5. Historial completo de mentorías por emprendedor
6. Análisis de efectividad de mentorías por especialización
7. Dashboard completo de RurInnova
8. Predicción de éxito de emprendimientos

## Instalación y Configuración

### Requisitos Previos
- Microsoft SQL Server (2016 o superior)
- MongoDB (4.4 o superior)
- Herramientas de importación de datos

### Pasos de Instalación

1. **Crear Base de Datos SQL Server**
   ```sql
   -- Ejecutar RurInnovaDatabaseYTablas.sql
   -- Ejecutar InsercionDatosSQLRurInnova.sql
   ```

2. **Importar Datos a MongoDB**
   ```bash
   # Ejecutar comandos de mongoimport desde Consultas MongoDB/README.md
   ```

3. **Verificar Datos**
   ```sql
   -- Ejecutar SELECTS DE RURINNOVA.sql
   ```

## Mantenimiento

### Consideraciones de Actualización
- Mantener consistencia en nombres de campos
- Verificar integridad referencial antes de modificaciones
- Documentar cambios en la estructura de datos
- Realizar respaldos antes de cambios estructurales

### Monitoreo
- Revisar regularmente el rendimiento de consultas
- Verificar la integridad de datos
- Monitorear el crecimiento de las tablas
- Optimizar índices según patrones de uso

## Documentación Adicional

- **Consultas MongoDB**: Ver `Consultas MongoDB/README.md`
- **Estructura CSV**: Ver `csv/README_CSV.md`
- **Scripts SQL**: Archivos .sql en el directorio raíz
- **Ejemplos de Datos**: Archivos CSV en directorio `csv/`

---

**Autor**: [Samuel Bonifacio](https://github.com/samuelbonifacio015)
**Fecha**: 2025  