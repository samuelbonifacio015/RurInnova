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

```javascript
db.emprendedor.find({ estado: "Activo" })
```

#### ✅ Resuelto

### Pregunta 2
**Encuentra todos los negocios de tipo "Local".**

```javascript
db.negocio.find({ tipo: "Local" })
```

#### ✅ Resuelto

### Pregunta 3
**Busca todas las facturas que tengan estado "Pagado".**

```javascript
db.facturacion.find({ estado: "Pagado" })
```

#### ✅ Resuelto

### Pregunta 4
**Encuentra todos los cursos de nivel "Principiante".**

```javascript
db.curso.find({ nivel: "Principiante" })
```

#### ✅ Resuelto

### Pregunta 5
**Busca todos los mentores con más de 10 años de experiencia.**

```javascript
db.mentor.find({ anos_experiencia: { $gt: 10 } })
```

#### ✅ Resuelto

---

## Sección 2: Consultas con Operadores de Comparación

### Pregunta 6
**Busca emprendedores que se hayan registrado después del 2024-12-31.**

```javascript
db.emprendedor.find({ fecha_registro: { $gt: new Date("2024-12-31") } })
```

#### ✅ Resuelto

### Pregunta 7
**Encuentra negocios que tengan un capital recibido mayor a 5000.**

```javascript
db.negocio.find({ capital_recibido: { $gt: 5000 } })
```

#### ✅ Resuelto

### Pregunta 8
**Busca facturas con un monto mayor a 1000.**

```javascript
db.facturacion.find({ monto: { $gt: 1000 } })
```

#### ✅ Resuelto

### Pregunta 9
**Encuentra cursos que tengan una duración menor a 10 semanas.**

```javascript
db.curso.find({ duracion: { $lt: 10 } })
```

#### ✅ Resuelto

### Pregunta 10
**Busca mentores con años de experiencia entre 5 y 15 años.**

```javascript
db.mentor.find({ anos_experiencia: { $gte: 5, $lte: 15 } })
```

#### ✅ Resuelto

---

## Sección 3: Consultas con Operador $in

### Pregunta 11
**Busca emprendedores que sean de tipo "Comercio" o "Servicios".**

```javascript
db.emprendedor.find({ tipo_emprendimiento: { $in: ["Comercio", "Servicios"] } })
```

#### ✅ Resuelto

### Pregunta 12
**Encuentra negocios que sean de tipo "Local" o "Regional".**

```javascript
db.negocio.find({ tipo: { $in: ["Local", "Regional"] } })
```

#### ✅ Resuelto

### Pregunta 13
**Busca cursos que sean de nivel "Principiante" o "Intermedio".**

```javascript
db.curso.find({ nivel: { $in: ["Principiante", "Intermedio"] } })
```

#### ✅ Resuelto

### Pregunta 14
**Encuentra facturas que tengan métodos de pago "Tarjeta" o "Transferencia".**

```javascript
db.facturacion.find({ metodo_pago: { $in: ["Tarjeta", "Transferencia"] } })
```

#### ✅ Resuelto

### Pregunta 15
**Busca emprendedores que vivan en "Miraflores" o "Surco".**

```javascript
db.emprendedor.find({ distrito: { $in: ["Miraflores", "Surco"] } })
```

#### ✅ Resuelto

---

## Sección 4: Consultas con $and

### Pregunta 16
**Busca emprendedores que sean de tipo "Tecnología" Y que estén en estado "Activo".**

```javascript
db.emprendedor.find({ 
    tipo_emprendimiento: "Tecnología", 
    estado: "Activo" 
})
```

#### ✅ Resuelto

### Pregunta 17
**Encuentra negocios que sean de tipo "Local" Y que tengan capital recibido mayor a 3000.**

```javascript
db.negocio.find({ 
    tipo: "Local", 
    capital_recibido: { $gt: 3000 } 
})
```

#### ✅ Resuelto

### Pregunta 18
**Busca cursos que sean de nivel "Principiante" Y que tengan duración menor a 8 semanas.**

```javascript
db.curso.find({ 
    nivel: "Principiante", 
    duracion: { $lt: 8 } 
})
```

#### ✅ Resuelto

### Pregunta 19
**Encuentra facturas que tengan monto mayor a 500 Y método de pago "Tarjeta".**

```javascript
db.facturacion.find({ 
    monto: { $gt: 500 }, 
    metodo_pago: "Tarjeta" 
})
```

#### ✅ Resuelto

### Pregunta 20
**Busca mentores con más de 5 años de experiencia Y que sean de tipo "Técnica".**

```javascript
db.mentor.find({ 
    anos_experiencia: { $gt: 5 }, 
    tipo: "Técnica" 
})
```

#### ✅ Resuelto

---

## Sección 5: Consultas con $or

### Pregunta 21
**Busca emprendedores que sean de tipo "Tecnología" O que vivan en "Miraflores".**

```javascript
db.emprendedor.find({
    $or: [
        { tipo_emprendimiento: "Tecnología" },
        { distrito: "Miraflores" }
    ]
})
```

### Pregunta 22
**Encuentra negocios que sean de tipo "Nacional" O que tengan capital recibido mayor a 6000.**

```javascript
db.negocio.find({
    $or: [
        { tipo: "Nacional" },
        { capital_recibido: { $gt: 6000 } }
    ]
})
```

### Pregunta 23
**Busca facturas que tengan monto mayor a 1000 O método de pago "Efectivo".**

```javascript
db.facturacion.find({
    $or: [
        { monto: { $gt: 1000 } },
        { metodo_pago: "Efectivo" }
    ]
})
```

### Pregunta 24
**Encuentra cursos que sean de nivel "Avanzado" O que tengan duración mayor a 10 semanas.**

```javascript
db.curso.find({
    $or: [
        { nivel: "Avanzado" },
        { duracion: { $gt: 10 } }
    ]
})
```

### Pregunta 25
**Busca mentores con más de 15 años de experiencia O que sean de tipo "Marketing".**

```javascript
db.mentor.find({
    $or: [
        { anos_experiencia: { $gt: 15 } },
        { tipo: "Marketing" }
    ]
})
```

---

## Sección 6: Consultas Básicas con $group

### Pregunta 26
**Agrupa los emprendedores por tipo de emprendimiento y cuenta cuántos hay de cada tipo.**

```javascript
db.emprendedor.aggregate([
    {
        $group: {
            _id: "$tipo_emprendimiento",
            total: { $sum: 1 }
        }
    }
])
```

#### ✅ Resuelto

### Pregunta 27
**Agrupa los negocios por tipo y cuenta cuántos negocios hay de cada tipo.**

```javascript
db.negocio.aggregate([
    {
        $group: {
            _id: "$tipo",
            total: { $sum: 1 }
        }
    }
])
```

#### ✅ Resuelto

### Pregunta 28
**Agrupa las facturas por método de pago y cuenta cuántas facturas hay de cada método.**

```javascript
db.facturacion.aggregate([
    {
        $group: {
            _id: "$metodo_pago",
            total: { $sum: 1 }
        }
    }
])
```

#### ✅ Resuelto

### Pregunta 29
**Agrupa los cursos por nivel y cuenta cuántos cursos hay de cada nivel.**

```javascript
db.curso.aggregate([
    {
        $group: {
            _id: "$nivel",
            total: { $sum: 1 }
        }
    }
])
```

#### ✅ Resuelto

### Pregunta 30
**Agrupa los mentores por área de especialización y cuenta cuántos mentores hay en cada área.**

```javascript
db.mentor.aggregate([
    {
        $group: {
            _id: "$especialidad",
            total: { $sum: 1 }
        }
    }
])
```

#### ✅ Resuelto

---

## Sección 7: Consultas con $sum

### Pregunta 31
**Calcula la suma total del capital recibido de todos los negocios.**

```javascript
db.negocio.aggregate([
    {
        $group: {
            _id: null,
            total_capital: { $sum: "$capital_recibido" }
        }
    }
])
```

#### ✅ Resuelto

### Pregunta 32
**Calcula la suma total de todos los montos de facturación.**

```javascript
db.facturacion.aggregate([
    {
        $group: {
            _id: null,
            total_monto: { $sum: "$monto" }
        }
    }
])
```

#### ✅ Resuelto

### Pregunta 33
**Calcula la suma total de la duración de todos los cursos.**

```javascript
db.curso.aggregate([
    {
        $group: {
            _id: null,
            total_duracion: { $sum: "$duracion" }
        }
    }
])
```

#### ✅ Resuelto

### Pregunta 34
**Calcula la suma total de años de experiencia de todos los mentores.**

```javascript
db.mentor.aggregate([
    {
        $group: {
            _id: null,
            total_experiencia: { $sum: "$anos_experiencia" }
        }
    }
])
```

#### ✅ Resuelto

### Pregunta 35
**Calcula la suma total de valoraciones de todos los feedbacks.**

```javascript
db.feedback.aggregate([
    {
        $group: {
            _id: null,
            total_valoracion: { $sum: "$valoracion" }
        }
    }
])
```

#### ✅ Resuelto

---

## Sección 8: Consultas con $lookup Simple

### Pregunta 36
**Une la colección `emprendedor` con `negocio` y muestra el nombre del emprendedor junto con el nombre de su negocio.**

```javascript
db.emprendedor.aggregate([
    {
        $lookup: {
            from: "negocio",
            localField: "_id",
            foreignField: "emprendedor_id",
            as: "negocio"
        }
    },
    {
        $project: {
            nombre_emprendedor: "$nombre_completo",
            nombre_negocio: { $arrayElemAt: ["$negocio.nombre", 0] }
        }
    }
])
```

#### ✅ Resuelto

### Pregunta 37
**Une `facturacion` con `emprendedor` y muestra el monto de la factura junto con el nombre del emprendedor.**

```javascript
db.facturacion.aggregate([
    {
        $lookup: {
            from: "emprendedor",
            localField: "emprendedor_id",
            foreignField: "_id",
            as: "emprendedor"
        }
    },
    {
        $project: {
            monto: 1,
            nombre_emprendedor: { $arrayElemAt: ["$emprendedor.nombre_completo", 0] }
        }
    }
])
```

#### ✅ Resuelto

### Pregunta 38
**Une `curso` con `mentor` y muestra el nombre del curso junto con el nombre del instructor.**

```javascript
db.curso.aggregate([
    {
        $lookup: {
            from: "mentor",
            localField: "mentor_id",
            foreignField: "_id",
            as: "mentor"
        }
    },
    {
        $project: {
            nombre_curso: "$nombre",
            nombre_instructor: { $arrayElemAt: ["$mentor.nombre_completo", 0] }
        }
    }
])
```

#### ✅ Resuelto

### Pregunta 39
**Une `sesion_mentoria` con `mentor` y muestra la fecha de sesión junto con el nombre del mentor.**

```javascript
db.sesion_mentoria.aggregate([
    {
        $lookup: {
            from: "mentor",
            localField: "mentor_id",
            foreignField: "_id",
            as: "mentor"
        }
    },
    {
        $project: {
            fecha_sesion: 1,
            nombre_mentor: { $arrayElemAt: ["$mentor.nombre_completo", 0] }
        }
    }
])
```

#### ✅ Resuelto

### Pregunta 40
**Une `feedback` con `emprendedor` y muestra la valoración junto con el nombre del emprendedor.**

```javascript
db.feedback.aggregate([
    {
        $lookup: {
            from: "emprendedor",
            localField: "emprendedor_id",
            foreignField: "_id",
            as: "emprendedor"
        }
    },
    {
        $project: {
            valoracion: 1,
            nombre_emprendedor: { $arrayElemAt: ["$emprendedor.nombre_completo", 0] }
        }
    }
])
```

#### ✅ Resuelto

---

## Sección 9: Consultas con $project

### Pregunta 41
**En la colección `emprendedor`, muestra solo el nombre completo y el tipo de emprendimiento.**

```javascript
db.emprendedor.find({}, {
    nombre_completo: 1,
    tipo_emprendimiento: 1,
    _id: 0
})
```

#### ✅ Resuelto

### Pregunta 42
**En `negocio`, muestra solo el nombre del negocio, tipo y capital recibido.**

```javascript
db.negocio.find({}, {
    nombre: 1,
    tipo: 1,
    capital_recibido: 1,
    _id: 0
})
```

#### ✅ Resuelto

### Pregunta 43
**En `facturacion`, muestra solo el monto, método de pago y estado.**

```javascript
db.facturacion.find({}, {
    monto: 1,
    metodo_pago: 1,
    estado: 1,
    _id: 0
})
```

#### ✅ Resuelto

### Pregunta 44
**En `curso`, muestra solo el nombre del curso, nivel y duración.**

```javascript
db.curso.find({}, {
    nombre: 1,
    nivel: 1,
    duracion: 1,
    _id: 0
})
```

#### ✅ Resuelto

### Pregunta 45
**En `mentor`, muestra solo el nombre completo, especialidad y años de experiencia.**

```javascript
db.mentor.find({}, {
    nombre_completo: 1,
    especialidad: 1,
    anos_experiencia: 1,
    _id: 0
})
```

#### ✅ Resuelto

---