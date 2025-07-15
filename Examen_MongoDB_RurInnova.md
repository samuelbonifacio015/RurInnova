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

## Sección 5: Consultas Básicas con $group

### Pregunta 21
**Agrupa los emprendedores por tipo de emprendimiento y cuenta cuántos hay de cada tipo.**

#### ✅ Resuelto

### Pregunta 22
**Agrupa los negocios por tipo y cuenta cuántos negocios hay de cada tipo.**

#### ✅ Resuelto

### Pregunta 23
**Agrupa las facturas por método de pago y cuenta cuántas facturas hay de cada método.**

#### ✅ Resuelto

### Pregunta 24
**Agrupa los cursos por nivel y cuenta cuántos cursos hay de cada nivel.**

#### ✅ Resuelto

### Pregunta 25
**Agrupa los mentores por área de especialización y cuenta cuántos mentores hay en cada área.**

#### ✅ Resuelto

---

## Sección 6: Consultas con $sum

### Pregunta 26
**Calcula la suma total del capital recibido de todos los negocios.**

#### ✅ Resuelto

### Pregunta 27
**Calcula la suma total de todos los montos de facturación.**

#### ✅ Resuelto

### Pregunta 28
**Calcula la suma total de la duración de todos los cursos.**

#### ✅ Resuelto

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

*Nota: Todas las consultas deben ser ejecutables en MongoDB y deben devolver resultados coherentes con la estructura de datos de RurInnova.* 

## 📋 **Resoluciones Preguntas 6-10**

---

### **Pregunta 6: Busca emprendedores que se hayan registrado después del 2024-12-31.**

```javascript
db.emprendedor.find(
  { Fecha_Registro: { $gt: "2024-12-31" } }
);
```

**Explicación:**
- Usa el operador `$gt` (greater than) para buscar fechas posteriores a 2024-12-31
- Compara directamente con el campo `Fecha_Registro`

**Resultado esperado:**
```json
[
  {
    "Id_Emprendedor": 2,
    "Nombre_Completo": "Carlos Díaz Ramírez",
    "Fecha_Registro": "2025-02-05"
  },
  {
    "Id_Emprendedor": 3,
    "Nombre_Completo": "Lucía Morales Vega", 
    "Fecha_Registro": "2025-03-12"
  },
  // ... otros emprendedores registrados en 2025
]
```

---

### **Pregunta 7: Encuentra negocios que tengan un capital recibido mayor a 5000.**

```javascript
db.negocio.find(
  { Capital_Recibido: { $gt: 5000 } }
);
```

**Explicación:**
- Usa el operador `$gt` para buscar capital recibido mayor a 5000
- Compara con el campo numérico `Capital_Recibido`

**Resultado esperado:**
```json
[
  {
    "Id_Negocio": 1,
    "Nombre_Negocio": "López Artesanías",
    "Capital_Recibido": 5000
  },
  {
    "Id_Negocio": 4,
    "Nombre_Negocio": "IoT Rural",
    "Capital_Recibido": 6000
  },
  {
    "Id_Negocio": 6,
    "Nombre_Negocio": "Salud en Ruta",
    "Capital_Recibido": 7000
  },
  {
    "Id_Negocio": 8,
    "Nombre_Negocio": "Orgánico Market",
    "Capital_Recibido": 5500
  }
]
```

---

### **Pregunta 8: Busca facturas con un monto mayor a 1000.**

```javascript
db.facturacion.find(
  { Monto: { $gt: 1000 } }
);
```

**Explicación:**
- Usa el operador `$gt` para buscar montos mayores a 1000
- Compara con el campo numérico `Monto`

**Resultado esperado:**
```json
[
  {
    "Id_Factura": 1,
    "Id_Emprendedor": 1,
    "Monto": 1500
  },
  {
    "Id_Factura": 2,
    "Id_Emprendedor": 2,
    "Monto": 2000.5
  },
  {
    "Id_Factura": 7,
    "Id_Emprendedor": 7,
    "Monto": 1200
  },
  {
    "Id_Factura": 9,
    "Id_Emprendedor": 9,
    "Monto": 1100
  },
  {
    "Id_Factura": 10,
    "Id_Emprendedor": 10,
    "Monto": 1300
  }
]
```

---

### **Pregunta 9: Encuentra cursos que tengan una duración menor a 10 semanas.**

```javascript
db.curso.find(
  { Duracion: { $lt: 10 } }
);
```

**Explicación:**
- Usa el operador `$lt` (less than) para buscar duraciones menores a 10
- Compara con el campo numérico `Duracion`

**Resultado esperado:**
```json
[
  {
    "Id_Curso": 1,
    "Nombre_Curso": "Estrategias para funcionalidades en línea",
    "Duracion": 2
  },
  {
    "Id_Curso": 2,
    "Nombre_Curso": "Optimización de negocios electrónicos revolucionarios",
    "Duracion": 7
  },
  {
    "Id_Curso": 4,
    "Nombre_Curso": "Innovación en comunidades multimedia",
    "Duracion": 9
  },
  {
    "Id_Curso": 5,
    "Nombre_Curso": "Revoluciona redes multimedia",
    "Duracion": 6
  },
  {
    "Id_Curso": 9,
    "Nombre_Curso": "Aprovechamiento de métricas innovadoras",
    "Duracion": 4
  },
  {
    "Id_Curso": 10,
    "Nombre_Curso": "Posicionamiento de sinergias innovadoras",
    "Duracion": 8
  }
]
```

---

### **Pregunta 10: Busca mentores con años de experiencia entre 5 y 15 años.**

```javascript
db.mentor.find(
  { Años_Experiencia: { $gte: 5, $lte: 15 } }
);
```

**Explicación:**
- Usa `$gte` (greater than or equal) para 5 años o más
- Usa `$lte` (less than or equal) para 15 años o menos
- Combina ambos operadores para crear un rango

**Resultado esperado:**
```json
[
  {
    "Id_Mentor": 1,
    "Nombre_Completo": "Guiomar Segura Montaña",
    "Años_Experiencia": 6
  },
  {
    "Id_Mentor": 2,
    "Nombre_Completo": "Úrsula Benito Diez",
    "Años_Experiencia": 8
  },
  {
    "Id_Mentor": 4,
    "Nombre_Completo": "Filomena Albero Rey",
    "Años_Experiencia": 14
  },
  {
    "Id_Mentor": 6,
    "Nombre_Completo": "Marcial Adán Carbonell",
    "Años_Experiencia": 7
  },
  {
    "Id_Mentor": 7,
    "Nombre_Completo": "Pepita Jove Canals",
    "Años_Experiencia": 14
  },
  {
    "Id_Mentor": 10,
    "Nombre_Completo": "Itziar Garay Lluch",
    "Años_Experiencia": 10
  }
]
```

---

## 📝 **Resumen de Operadores Utilizados:**

- **`$gt`**: Mayor que (>)
- **`$lt`**: Menor que (<)
- **`$gte`**: Mayor o igual que (≥)
- **`$lte`**: Menor o igual que (≤)

Estas consultas demuestran el uso básico de operadores de comparación en MongoDB para filtrar documentos según diferentes criterios numéricos y de fecha. 