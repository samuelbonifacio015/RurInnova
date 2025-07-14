# Examen MongoDB - RurInnova (Nivel Básico)

## Instrucciones
Este examen evalúa tu conocimiento básico de consultas MongoDB para la base de datos RurInnova. Debes escribir las consultas MongoDB que resuelvan cada pregunta. Todas las consultas deben ser funcionales y correctas.

**Colecciones disponibles:**
- `emprendedor`
- `negocio`
- `facturacion`
- `curso`
- `mentor`
- `capacitacion`
- `concurso`
- `sesion_mentoria`
- `feedback`
- `usuario`
- `categoria_negocio`
- `distrito`
- `direccion`
- `historico_emprendimiento`
- `redes_sociales`
- `recursos`
- `premios_concurso`
- `organizacion_patrocinadora`
- `tipo_concurso`
- `tipo_usuario`

---

## Sección 1: Consultas Básicas de Búsqueda

### Pregunta 1
**Busca todos los emprendedores que estén en estado "Activo".**

#### ✅ Resuelto

### Pregunta 2
**Encuentra todos los negocios de tipo "Local".**

#### ✅ Resuelto

### Pregunta 3
**Busca todas las facturas que tengan estado "Pagado".**

#### ✅ Resuelto

### Pregunta 4
**Encuentra todos los cursos de nivel "Principiante".**

#### ✅ Resuelto

### Pregunta 5
**Busca todos los mentores con más de 10 años de experiencia.**

#### ✅ Resuelto

---

## Sección 2: Consultas con Operadores de Comparación

### Pregunta 6
**Busca emprendedores que se hayan registrado después del 2024-12-31.**

### Pregunta 7
**Encuentra negocios que tengan un capital recibido mayor a 5000.**

### Pregunta 8
**Busca facturas con un monto mayor a 1000.**

### Pregunta 9
**Encuentra cursos que tengan una duración menor a 10 semanas.**

### Pregunta 10
**Busca mentores con años de experiencia entre 5 y 15 años.**

---

## Sección 3: Consultas con Operador $in

### Pregunta 11
**Busca emprendedores que sean de tipo "Comercio" o "Servicios".**

### Pregunta 12
**Encuentra negocios que sean de tipo "Local" o "Regional".**

### Pregunta 13
**Busca cursos que sean de nivel "Principiante" o "Intermedio".**

### Pregunta 14
**Encuentra facturas que tengan métodos de pago "Tarjeta" o "Transferencia".**

### Pregunta 15
**Busca emprendedores que vivan en "Miraflores" o "Surco".**

---

## Sección 4: Consultas con $and

### Pregunta 16
**Busca emprendedores que sean de tipo "Tecnología" Y que estén en estado "Activo".**

### Pregunta 17
**Encuentra negocios que sean de tipo "Local" Y que tengan capital recibido mayor a 3000.**

### Pregunta 18
**Busca cursos que sean de nivel "Principiante" Y que tengan duración menor a 8 semanas.**

### Pregunta 19
**Encuentra facturas que tengan monto mayor a 500 Y método de pago "Tarjeta".**

### Pregunta 20
**Busca mentores con más de 5 años de experiencia Y que sean de tipo "Técnica".**

---

## Sección 5: Consultas Básicas con $group

### Pregunta 21
**Agrupa los emprendedores por tipo de emprendimiento y cuenta cuántos hay de cada tipo.**

### Pregunta 22
**Agrupa los negocios por tipo y cuenta cuántos negocios hay de cada tipo.**

### Pregunta 23
**Agrupa las facturas por método de pago y cuenta cuántas facturas hay de cada método.**

### Pregunta 24
**Agrupa los cursos por nivel y cuenta cuántos cursos hay de cada nivel.**

### Pregunta 25
**Agrupa los mentores por área de especialización y cuenta cuántos mentores hay en cada área.**

---

## Sección 6: Consultas con $sum

### Pregunta 26
**Calcula la suma total del capital recibido de todos los negocios.**

### Pregunta 27
**Calcula la suma total de todos los montos de facturación.**

### Pregunta 28
**Calcula la suma total de la duración de todos los cursos.**

### Pregunta 29
**Calcula la suma total de años de experiencia de todos los mentores.**

### Pregunta 30
**Calcula la suma total de valoraciones de todos los feedbacks.**

---

## Sección 7: Consultas con $lookup Simple

### Pregunta 31
**Une la colección `emprendedor` con `negocio` y muestra el nombre del emprendedor junto con el nombre de su negocio.**

### Pregunta 32
**Une `facturacion` con `emprendedor` y muestra el monto de la factura junto con el nombre del emprendedor.**

### Pregunta 33
**Une `curso` con `mentor` y muestra el nombre del curso junto con el nombre del instructor.**

### Pregunta 34
**Une `sesion_mentoria` con `mentor` y muestra la fecha de sesión junto con el nombre del mentor.**

### Pregunta 35
**Une `feedback` con `emprendedor` y muestra la valoración junto con el nombre del emprendedor.**

---

## Sección 8: Consultas con $project

### Pregunta 36
**En la colección `emprendedor`, muestra solo el nombre completo y el tipo de emprendimiento.**

### Pregunta 37
**En `negocio`, muestra solo el nombre del negocio, tipo y capital recibido.**

### Pregunta 38
**En `facturacion`, muestra solo el monto, método de pago y estado.**

### Pregunta 39
**En `curso`, muestra solo el nombre del curso, nivel y duración.**

### Pregunta 40
**En `mentor`, muestra solo el nombre completo, especialidad y años de experiencia.**

---

## Sección 9: Consultas con Ordenamiento

### Pregunta 41
**Ordena los emprendedores por nombre completo de forma ascendente.**

### Pregunta 42
**Ordena los negocios por capital recibido de forma descendente.**

### Pregunta 43
**Ordena las facturas por monto de forma descendente.**

### Pregunta 44
**Ordena los cursos por duración de forma ascendente.**

### Pregunta 45
**Ordena los mentores por años de experiencia de forma descendente.**

---

## Sección 10: Consultas con Limit

### Pregunta 46
**Muestra solo los primeros 3 emprendedores ordenados por nombre.**

### Pregunta 47
**Muestra solo los 2 negocios con mayor capital recibido.**

### Pregunta 48
**Muestra solo las 3 facturas con mayor monto.**

### Pregunta 49
**Muestra solo los 2 cursos con mayor duración.**

### Pregunta 50
**Muestra solo los 3 mentores con más años de experiencia.**

---

## Criterios de Evaluación

- **Sintaxis correcta**: 30%
- **Lógica de la consulta**: 30%
- **Uso apropiado de operadores**: 25%
- **Eficiencia de la consulta**: 15%

**Tiempo límite: 2.5 horas**

**Total de preguntas: 50**

**Puntuación máxima: 100 puntos**

---

*Nota: Todas las consultas deben ser ejecutables en MongoDB y deben devolver resultados coherentes con la estructura de datos de RurInnova.* 