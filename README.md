# Consideraciones para la Base de Datos `RurInnovaDB`

Este documento describe consideraciones y detalles importantes sobre la estructura y uso de la base de datos definida en `rurInnovaBD.sql`.

## Consideraciones Generales
- La base de datos está diseñada para gestionar información relacionada con usuarios, capacitaciones, concursos, emprendimientos, mentores, negocios, facturación, recursos, entre otros.
- Todas las tablas utilizan claves primarias autoincrementales (`IDENTITY`).
- Se emplean claves foráneas para mantener la integridad referencial entre las tablas.

## Consideraciones Específicas por Tabla

### Tabla `app`
- **Propósito:** Almacena información sobre la plataforma de la aplicación.
- **Consideración:**
  - Solo contendrá el campo `plataforma` (en el script está como `Nombre_App`).
  - Ejemplo de uso: registrar el nombre de la plataforma (web, móvil, etc.).

### Tabla `tipo_usuario`
- **Propósito:** Define los tipos de usuario que pueden existir en la plataforma.
- **Consideración:**
  - Solo contendrá el campo `nombre_tipo` (en el script está como `Nombre_Tipo`).
  - Ejemplo de uso: registrar tipos como "Administrador", "Emprendedor", "Mentor", etc.

## Notas adicionales
- Asegúrese de poblar las tablas con los valores mínimos requeridos para el funcionamiento de la plataforma.
- Revise las restricciones de claves foráneas antes de insertar datos relacionados.
- Para modificaciones futuras, mantenga la consistencia en los nombres y tipos de datos.

---

Para más detalles, consulte el archivo `rurInnovaBD.sql`. 