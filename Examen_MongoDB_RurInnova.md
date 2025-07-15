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

#### ➖ Imposible

### Pregunta 7
**Encuentra negocios que tengan un capital recibido mayor a 5000.**

#### ✅ Resuelto

### Pregunta 8
**Busca facturas con un monto mayor a 1000.**

#### ✅ Resuelto

### Pregunta 9
**Encuentra cursos que tengan una duración menor a 10 semanas.**

#### ✅ Resuelto

### Pregunta 10
**Busca mentores con años de experiencia entre 5 y 15 años.**

#### ✅ Resuelto

---

## Sección 3: Consultas con Operador $in

### Pregunta 11
**Busca emprendedores que sean de tipo "Comercio" o "Servicios".**

#### ✅ Resuelto

### Pregunta 12
**Encuentra negocios que sean de tipo "Local" o "Regional".**

#### ✅ Resuelto

### Pregunta 13
**Busca cursos que sean de nivel "Principiante" o "Intermedio".**

#### ✅ Resuelto

### Pregunta 14
**Encuentra facturas que tengan métodos de pago "Tarjeta" o "Transferencia".**

#### ✅ Resuelto

### Pregunta 15
**Busca emprendedores que vivan en "Miraflores" o "Surco".**

#### ✅ Resuelto

---

## Sección 4: Consultas con $and

### Pregunta 16
**Busca emprendedores que sean de tipo "Tecnología" Y que estén en estado "Activo".**

#### ✅ Resuelto

### Pregunta 17
**Encuentra negocios que sean de tipo "Local" Y que tengan capital recibido mayor a 3000.**

#### ✅ Resuelto

### Pregunta 18
**Busca cursos que sean de nivel "Principiante" Y que tengan duración menor a 8 semanas.**

#### ✅ Resuelto

### Pregunta 19
**Encuentra facturas que tengan monto mayor a 500 Y método de pago "Tarjeta".**

#### ✅ Resuelto

### Pregunta 20
**Busca mentores con más de 5 años de experiencia Y que sean de tipo "Técnica".**

#### ✅ Resuelto

---

## Sección 5: Consultas con $or

### Pregunta 21
**Busca emprendedores que sean de tipo "Tecnología" O que vivan en "Miraflores".**

### Pregunta 22
**Encuentra negocios que sean de tipo "Nacional" O que tengan capital recibido mayor a 6000.**

### Pregunta 23
**Busca facturas que tengan monto mayor a 1000 O método de pago "Efectivo".**

### Pregunta 24
**Encuentra cursos que sean de nivel "Avanzado" O que tengan duración mayor a 10 semanas.**

### Pregunta 25
**Busca mentores con más de 15 años de experiencia O que sean de tipo "Marketing".**

---

## Sección 6: Consultas Básicas con $group

### Pregunta 26
**Agrupa los emprendedores por tipo de emprendimiento y cuenta cuántos hay de cada tipo.**

#### ✅ Resuelto

### Pregunta 27
**Agrupa los negocios por tipo y cuenta cuántos negocios hay de cada tipo.**

#### ✅ Resuelto

### Pregunta 28
**Agrupa las facturas por método de pago y cuenta cuántas facturas hay de cada método.**

#### ✅ Resuelto

### Pregunta 29
**Agrupa los cursos por nivel y cuenta cuántos cursos hay de cada nivel.**

#### ✅ Resuelto

### Pregunta 30
**Agrupa los mentores por área de especialización y cuenta cuántos mentores hay en cada área.**

#### ✅ Resuelto

---

## Sección 7: Consultas con $sum

### Pregunta 31
**Calcula la suma total del capital recibido de todos los negocios.**

#### ✅ Resuelto

### Pregunta 32
**Calcula la suma total de todos los montos de facturación.**

#### ✅ Resuelto

### Pregunta 33
**Calcula la suma total de la duración de todos los cursos.**

#### ✅ Resuelto

### Pregunta 34
**Calcula la suma total de años de experiencia de todos los mentores.**

#### ✅ Resuelto

### Pregunta 35
**Calcula la suma total de valoraciones de todos los feedbacks.**

#### ✅ Resuelto

---

## Sección 8: Consultas con $lookup Simple

### Pregunta 36
**Une la colección `emprendedor` con `negocio` y muestra el nombre del emprendedor junto con el nombre de su negocio.**

#### ✅ Resuelto

### Pregunta 37
**Une `facturacion` con `emprendedor` y muestra el monto de la factura junto con el nombre del emprendedor.**

#### ✅ Resuelto

### Pregunta 38
**Une `curso` con `mentor` y muestra el nombre del curso junto con el nombre del instructor.**

#### ✅ Resuelto

### Pregunta 39
**Une `sesion_mentoria` con `mentor` y muestra la fecha de sesión junto con el nombre del mentor.**

#### ✅ Resuelto

### Pregunta 40
**Une `feedback` con `emprendedor` y muestra la valoración junto con el nombre del emprendedor.**

#### ✅ Resuelto

---

## Sección 9: Consultas con $project

### Pregunta 41
**En la colección `emprendedor`, muestra solo el nombre completo y el tipo de emprendimiento.**

#### ✅ Resuelto

### Pregunta 42
**En `negocio`, muestra solo el nombre del negocio, tipo y capital recibido.**

#### ✅ Resuelto

### Pregunta 43
**En `facturacion`, muestra solo el monto, método de pago y estado.**

#### ✅ Resuelto

### Pregunta 44
**En `curso`, muestra solo el nombre del curso, nivel y duración.**

#### ✅ Resuelto

### Pregunta 45
**En `mentor`, muestra solo el nombre completo, especialidad y años de experiencia.**

#### ✅ Resuelto

---