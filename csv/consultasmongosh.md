# Consultas MongoDB para RurInnova

## Consultas para la colección `negocio`

### 1. Agrupar NombreNegocio con TipoNegocio y mostrar su TipoNegocio

```javascript
db.negocio.aggregate([
  {
    $group: {
      _id: "$Tipo_Negocio",
      negocios: {
        $push: {
          nombre: "$Nombre_Negocio",
          tipo: "$Tipo_Negocio",
        },
      },
    },
  },
  {
    $project: {
      tipoNegocio: "$_id",
      negocios: 1,
      _id: 0,
    },
  },
]);
```

**Resultado esperado:**

```json
[
  {
    "tipoNegocio": "Local",
    "negocios": [
      { "nombre": "López Artesanías", "tipo": "Local" },
      { "nombre": "Huertos Verdes", "tipo": "Local" },
      { "nombre": "Salud en Ruta", "tipo": "Local" },
      { "nombre": "Tours Rurales", "tipo": "Local" },
      { "nombre": "Moda Andina", "tipo": "Local" }
    ]
  },
  {
    "tipoNegocio": "Regional",
    "negocios": [
      { "nombre": "Marketing Díaz", "tipo": "Regional" },
      { "nombre": "Educa Plus", "tipo": "Regional" },
      { "nombre": "LogiRural", "tipo": "Regional" }
    ]
  },
  {
    "tipoNegocio": "Nacional",
    "negocios": [
      { "nombre": "IoT Rural", "tipo": "Nacional" },
      { "nombre": "Orgánico Market", "tipo": "Nacional" }
    ]
  }
]
```

---

## Consultas con $group y $sum

### 3. Sumar el capital recibido por tipo de negocio

```javascript
db.negocio.aggregate([
  {
    $group: {
      _id: "$Tipo_Negocio",
      totalCapital: { $sum: "$Capital_Recibido" },
      cantidadNegocios: { $sum: 1 },
    },
  },
  {
    $project: {
      tipoNegocio: "$_id",
      totalCapital: 1,
      cantidadNegocios: 1,
      _id: 0,
    },
  },
]);
```

**Resultado esperado:**

```json
[
  {
    "tipoNegocio": "Local",
    "totalCapital": 20000,
    "cantidadNegocios": 5
  },
  {
    "tipoNegocio": "Regional",
    "totalCapital": 11500,
    "cantidadNegocios": 3
  },
  {
    "tipoNegocio": "Nacional",
    "totalCapital": 11500,
    "cantidadNegocios": 2
  }
]
```

### 4. Sumar montos de facturación por método de pago

```javascript
db.facturacion.aggregate([
  {
    $group: {
      _id: "$Metodo_Pago",
      totalMonto: { $sum: "$Monto" },
      cantidadFacturas: { $sum: 1 },
    },
  },
  {
    $project: {
      metodoPago: "$_id",
      totalMonto: 1,
      cantidadFacturas: 1,
      _id: 0,
    },
  },
]);
```

**Resultado esperado:**

```json
[
  {
    "metodoPago": "Tarjeta",
    "totalMonto": 2250,
    "cantidadFacturas": 2
  },
  {
    "metodoPago": "Transferencia",
    "totalMonto": 3200.5,
    "cantidadFacturas": 2
  },
  {
    "metodoPago": "Efectivo",
    "totalMonto": 1230.75,
    "cantidadFacturas": 2
  },
  {
    "metodoPago": "Yape",
    "totalMonto": 1400,
    "cantidadFacturas": 2
  },
  {
    "metodoPago": "Plin",
    "totalMonto": 1800.2,
    "cantidadFacturas": 2
  }
]
```

### 5. Sumar duración total de cursos por nivel

```javascript
db.curso.aggregate([
  {
    $group: {
      _id: "$Nivel",
      duracionTotal: { $sum: "$Duracion" },
      cantidadCursos: { $sum: 1 },
      promedioDuracion: { $avg: "$Duracion" },
    },
  },
  {
    $project: {
      nivel: "$_id",
      duracionTotal: 1,
      cantidadCursos: 1,
      promedioDuracion: { $round: ["$promedioDuracion", 2] },
      _id: 0,
    },
  },
]);
```

**Resultado esperado:**

```json
[
  {
    "nivel": "Principiante",
    "duracionTotal": 45,
    "cantidadCursos": 5,
    "promedioDuracion": 9.0
  },
  {
    "nivel": "Intermedio",
    "duracionTotal": 22,
    "cantidadCursos": 3,
    "promedioDuracion": 7.33
  },
  {
    "nivel": "Avanzado",
    "duracionTotal": 18,
    "cantidadCursos": 2,
    "promedioDuracion": 9.0
  }
]
```

### 6. Sumar montos de facturación por estado de pago

```javascript
db.facturacion.aggregate([
  {
    $group: {
      _id: "$Estado_Pago",
      totalMonto: { $sum: "$Monto" },
      cantidadFacturas: { $sum: 1 },
    },
  },
  {
    $project: {
      estadoPago: "$_id",
      totalMonto: 1,
      cantidadFacturas: 1,
      _id: 0,
    },
  },
]);
```

**Resultado esperado:**

```json
[
  {
    "estadoPago": "Pagado",
    "totalMonto": 4250.75,
    "cantidadFacturas": 5
  },
  {
    "estadoPago": "Pendiente",
    "totalMonto": 4530.6,
    "cantidadFacturas": 5
  }
]
```

### 7. Sumar capital recibido y monto objetivo por categoría de negocio

```javascript
db.negocio.aggregate([
  {
    $group: {
      _id: "$Id_Categoria",
      totalCapitalRecibido: { $sum: "$Capital_Recibido" },
      totalMontoObjetivo: { $sum: "$Monto_Objetivo" },
      cantidadNegocios: { $sum: 1 },
    },
  },
  {
    $project: {
      categoria: "$_id",
      totalCapitalRecibido: 1,
      totalMontoObjetivo: 1,
      cantidadNegocios: 1,
      porcentajeCompletado: {
        $multiply: [
          { $divide: ["$totalCapitalRecibido", "$totalMontoObjetivo"] },
          100,
        ],
      },
      _id: 0,
    },
  },
]);
```

**Resultado esperado:**

```json
[
  {
    "categoria": 1,
    "totalCapitalRecibido": 5000,
    "totalMontoObjetivo": 10000,
    "cantidadNegocios": 1,
    "porcentajeCompletado": 50.0
  },
  {
    "categoria": 2,
    "totalCapitalRecibido": 3000,
    "totalMontoObjetivo": 8000,
    "cantidadNegocios": 1,
    "porcentajeCompletado": 37.5
  },
  {
    "categoria": 3,
    "totalCapitalRecibido": 2000,
    "totalMontoObjetivo": 5000,
    "cantidadNegocios": 1,
    "porcentajeCompletado": 40.0
  },
  {
    "categoria": 4,
    "totalCapitalRecibido": 6000,
    "totalMontoObjetivo": 12000,
    "cantidadNegocios": 1,
    "porcentajeCompletado": 50.0
  },
  {
    "categoria": 5,
    "totalCapitalRecibido": 4000,
    "totalMontoObjetivo": 9000,
    "cantidadNegocios": 1,
    "porcentajeCompletado": 44.44
  },
  {
    "categoria": 6,
    "totalCapitalRecibido": 7000,
    "totalMontoObjetivo": 15000,
    "cantidadNegocios": 1,
    "porcentajeCompletado": 46.67
  },
  {
    "categoria": 7,
    "totalCapitalRecibido": 2500,
    "totalMontoObjetivo": 6000,
    "cantidadNegocios": 1,
    "porcentajeCompletado": 41.67
  },
  {
    "categoria": 8,
    "totalCapitalRecibido": 5500,
    "totalMontoObjetivo": 11000,
    "cantidadNegocios": 1,
    "porcentajeCompletado": 50.0
  },
  {
    "categoria": 9,
    "totalCapitalRecibido": 3500,
    "totalMontoObjetivo": 7000,
    "cantidadNegocios": 1,
    "porcentajeCompletado": 50.0
  },
  {
    "categoria": 10,
    "totalCapitalRecibido": 4500,
    "totalMontoObjetivo": 8500,
    "cantidadNegocios": 1,
    "porcentajeCompletado": 52.94
  }
]
```

---

## Consultas con operador $and

### 8. Buscar emprendedores de tipo "Comercio" Y estado "Activo"

```javascript
db.emprendedor.find(
  {
    $and: [
      { Tipo_Emprendimiento: "Comercio" },
      { Estado_Emprendimiento: "Activo" },
    ],
  },
  {
    Nombre_Completo: 1,
    Tipo_Emprendimiento: 1,
    Estado_Emprendimiento: 1,
    Distrito_Residencia: 1,
    _id: 0,
  }
);
```

**Resultado esperado:**

```json
[
  {
    "Nombre_Completo": "Ana López Pérez",
    "Tipo_Emprendimiento": "Comercio",
    "Estado_Emprendimiento": "Activo",
    "Distrito_Residencia": "Miraflores"
  }
]
```

### 9. Buscar negocios de tipo "Local" Y capital recibido mayor a 3000

```javascript
db.negocio.find(
  {
    $and: [{ Tipo_Negocio: "Local" }, { Capital_Recibido: { $gt: 3000 } }],
  },
  {
    Nombre_Negocio: 1,
    Tipo_Negocio: 1,
    Capital_Recibido: 1,
    Estado_Negocio: 1,
    _id: 0,
  }
);
```

**Resultado esperado:**

```json
[
  {
    "Nombre_Negocio": "López Artesanías",
    "Tipo_Negocio": "Local",
    "Capital_Recibido": 5000,
    "Estado_Negocio": "Activo"
  },
  {
    "Nombre_Negocio": "Salud en Ruta",
    "Tipo_Negocio": "Local",
    "Capital_Recibido": 7000,
    "Estado_Negocio": "Activo"
  },
  {
    "Nombre_Negocio": "Moda Andina",
    "Tipo_Negocio": "Local",
    "Capital_Recibido": 3500,
    "Estado_Negocio": "Activo"
  }
]
```

### 10. Buscar cursos de nivel "Principiante" Y duración menor a 10 semanas

```javascript
db.curso.find(
  {
    $and: [{ Nivel: "Principiante" }, { Duracion: { $lt: 10 } }],
  },
  {
    Nombre_Curso: 1,
    Nivel: 1,
    Duracion: 1,
    Area_Especializacion: 1,
    _id: 0,
  }
);
```

**Resultado esperado:**

```json
[
  {
    "Nombre_Curso": "Estrategias para funcionalidades en línea",
    "Nivel": "Principiante",
    "Duracion": 2,
    "Area_Especializacion": "Psicoterapeuta infantil"
  },
  {
    "Nombre_Curso": "Innovación en comunidades multimedia",
    "Nivel": "Principiante",
    "Duracion": 9,
    "Area_Especializacion": "Editor de contenidos"
  },
  {
    "Nombre_Curso": "Posicionamiento de sinergias innovadoras",
    "Nivel": "Principiante",
    "Duracion": 8,
    "Area_Especializacion": "Médico general"
  }
]
```

### 11. Buscar facturas con método de pago "Tarjeta" Y estado "Pagado"

```javascript
db.facturacion.find(
  {
    $and: [{ Metodo_Pago: "Tarjeta" }, { Estado_Pago: "Pagado" }],
  },
  {
    Id_Emprendedor: 1,
    Monto: 1,
    Metodo_Pago: 1,
    Estado_Pago: 1,
    Fecha_Factura: 1,
    _id: 0,
  }
);
```

**Resultado esperado:**

```json
[
  {
    "Id_Emprendedor": 1,
    "Monto": 1500,
    "Metodo_Pago": "Tarjeta",
    "Estado_Pago": "Pagado",
    "Fecha_Factura": "2025-06-01"
  },
  {
    "Id_Emprendedor": 6,
    "Monto": 750,
    "Metodo_Pago": "Tarjeta",
    "Estado_Pago": "Pagado",
    "Fecha_Factura": "2025-06-06"
  }
]
```

### 12. Buscar emprendedores registrados en 2025 Y de distrito "Lima"

```javascript
db.emprendedor.find(
  {
    $and: [
      { Fecha_Registro: { $regex: "^2025" } },
      { Distrito_Residencia: "Lima" },
    ],
  },
  {
    Nombre_Completo: 1,
    Fecha_Registro: 1,
    Distrito_Residencia: 1,
    Tipo_Emprendimiento: 1,
    _id: 0,
  }
);
```

**Resultado esperado:**

```json
[
  {
    "Nombre_Completo": "Ricardo Paredes León",
    "Fecha_Registro": "2025-06-12",
    "Distrito_Residencia": "Lima",
    "Tipo_Emprendimiento": "Gastronomía"
  }
]
```

### 13. Buscar negocios con capital recibido entre 3000 y 6000 Y tipo "Regional"

```javascript
db.negocio.find(
  {
    $and: [
      { Capital_Recibido: { $gte: 3000, $lte: 6000 } },
      { Tipo_Negocio: "Regional" },
    ],
  },
  {
    Nombre_Negocio: 1,
    Capital_Recibido: 1,
    Tipo_Negocio: 1,
    Monto_Objetivo: 1,
    _id: 0,
  }
);
```

**Resultado esperado:**

```json
[
  {
    "Nombre_Negocio": "Marketing Díaz",
    "Capital_Recibido": 3000,
    "Tipo_Negocio": "Regional",
    "Monto_Objetivo": 8000
  },
  {
    "Nombre_Negocio": "Educa Plus",
    "Capital_Recibido": 4000,
    "Tipo_Negocio": "Regional",
    "Monto_Objetivo": 9000
  },
  {
    "Nombre_Negocio": "LogiRural",
    "Capital_Recibido": 4500,
    "Tipo_Negocio": "Regional",
    "Monto_Objetivo": 8500
  }
]
```

### 14. Buscar cursos de nivel "Avanzado" Y duración mayor a 10 semanas

```javascript
db.curso.find(
  {
    $and: [{ Nivel: "Avanzado" }, { Duracion: { $gt: 10 } }],
  },
  {
    Nombre_Curso: 1,
    Nivel: 1,
    Duracion: 1,
    Area_Especializacion: 1,
    _id: 0,
  }
);
```

**Resultado esperado:**

```json
[
  {
    "Nombre_Curso": "Recontextualización de tecnologías interactivas",
    "Nivel": "Avanzado",
    "Duracion": 12,
    "Area_Especializacion": "Gerente de producción"
  },
  {
    "Nombre_Curso": "Optimización de convergencia dinámica",
    "Nivel": "Avanzado",
    "Duracion": 12,
    "Area_Especializacion": "Ingeniero en petróleo"
  }
]
```

### 15. Buscar facturas con monto mayor a 1000 Y método de pago "Transferencia"

```javascript
db.facturacion.find(
  {
    $and: [{ Monto: { $gt: 1000 } }, { Metodo_Pago: "Transferencia" }],
  },
  {
    Id_Emprendedor: 1,
    Monto: 1,
    Metodo_Pago: 1,
    Estado_Pago: 1,
    _id: 0,
  }
);
```

**Resultado esperado:**

```json
[
  {
    "Id_Emprendedor": 2,
    "Monto": 2000.5,
    "Metodo_Pago": "Transferencia",
    "Estado_Pago": "Pendiente"
  },
  {
    "Id_Emprendedor": 7,
    "Monto": 1200,
    "Metodo_Pago": "Transferencia",
    "Estado_Pago": "Pagado"
  }
]
```

---

## Consultas con operador $in

### 16. Buscar emprendedores de tipos específicos: "Comercio", "Servicios" o "Tecnología"

```javascript
db.emprendedor.find(
  {
    Tipo_Emprendimiento: { $in: ["Comercio", "Servicios", "Tecnología"] },
  },
  {
    Nombre_Completo: 1,
    Tipo_Emprendimiento: 1,
    Distrito_Residencia: 1,
    Estado_Emprendimiento: 1,
    _id: 0,
  }
);
```

**Resultado esperado:**

```json
[
  {
    "Nombre_Completo": "Ana López Pérez",
    "Tipo_Emprendimiento": "Comercio",
    "Distrito_Residencia": "Miraflores",
    "Estado_Emprendimiento": "Activo"
  },
  {
    "Nombre_Completo": "Carlos Díaz Ramírez",
    "Tipo_Emprendimiento": "Servicios",
    "Distrito_Residencia": "Surco",
    "Estado_Emprendimiento": "Activo"
  },
  {
    "Nombre_Completo": "Miguel Torres Huerta",
    "Tipo_Emprendimiento": "Tecnología",
    "Distrito_Residencia": "San Isidro",
    "Estado_Emprendimiento": "Activo"
  }
]
```

### 17. Buscar negocios de tipos "Local" o "Regional"

```javascript
db.negocio.find(
  {
    Tipo_Negocio: { $in: ["Local", "Regional"] },
  },
  {
    Nombre_Negocio: 1,
    Tipo_Negocio: 1,
    Capital_Recibido: 1,
    Estado_Negocio: 1,
    _id: 0,
  }
);
```

**Resultado esperado:**

```json
[
  {
    "Nombre_Negocio": "López Artesanías",
    "Tipo_Negocio": "Local",
    "Capital_Recibido": 5000,
    "Estado_Negocio": "Activo"
  },
  {
    "Nombre_Negocio": "Marketing Díaz",
    "Tipo_Negocio": "Regional",
    "Capital_Recibido": 3000,
    "Estado_Negocio": "Activo"
  },
  {
    "Nombre_Negocio": "Huertos Verdes",
    "Tipo_Negocio": "Local",
    "Capital_Recibido": 2000,
    "Estado_Negocio": "Activo"
  },
  {
    "Nombre_Negocio": "Educa Plus",
    "Tipo_Negocio": "Regional",
    "Capital_Recibido": 4000,
    "Estado_Negocio": "Activo"
  },
  {
    "Nombre_Negocio": "Salud en Ruta",
    "Tipo_Negocio": "Local",
    "Capital_Recibido": 7000,
    "Estado_Negocio": "Activo"
  },
  {
    "Nombre_Negocio": "Tours Rurales",
    "Tipo_Negocio": "Local",
    "Capital_Recibido": 2500,
    "Estado_Negocio": "Activo"
  },
  {
    "Nombre_Negocio": "Moda Andina",
    "Tipo_Negocio": "Local",
    "Capital_Recibido": 3500,
    "Estado_Negocio": "Activo"
  },
  {
    "Nombre_Negocio": "LogiRural",
    "Tipo_Negocio": "Regional",
    "Capital_Recibido": 4500,
    "Estado_Negocio": "Activo"
  }
]
```

### 18. Buscar cursos de niveles "Principiante" o "Intermedio"

```javascript
db.curso.find(
  {
    Nivel: { $in: ["Principiante", "Intermedio"] },
  },
  {
    Nombre_Curso: 1,
    Nivel: 1,
    Duracion: 1,
    Area_Especializacion: 1,
    _id: 0,
  }
);
```

**Resultado esperado:**

```json
[
  {
    "Nombre_Curso": "Estrategias para funcionalidades en línea",
    "Nivel": "Principiante",
    "Duracion": 2,
    "Area_Especializacion": "Psicoterapeuta infantil"
  },
  {
    "Nombre_Curso": "Optimización de negocios electrónicos revolucionarios",
    "Nivel": "Intermedio",
    "Duracion": 7,
    "Area_Especializacion": "Técnico de sonido en radiodifusión/cine/video"
  },
  {
    "Nombre_Curso": "Recontextualización de tecnologías interactivas",
    "Nivel": "Principiante",
    "Duracion": 12,
    "Area_Especializacion": "Gerente de producción"
  },
  {
    "Nombre_Curso": "Innovación en comunidades multimedia",
    "Nivel": "Principiante",
    "Duracion": 9,
    "Area_Especializacion": "Editor de contenidos"
  },
  {
    "Nombre_Curso": "Evolución de canales intuitivos",
    "Nivel": "Intermedio",
    "Duracion": 11,
    "Area_Especializacion": "Consultor ambiental"
  },
  {
    "Nombre_Curso": "Agrupación de ancho de banda escalable",
    "Nivel": "Principiante",
    "Duracion": 10,
    "Area_Especializacion": "Oficial técnico médico"
  },
  {
    "Nombre_Curso": "Aprovechamiento de métricas innovadoras",
    "Nivel": "Intermedio",
    "Duracion": 4,
    "Area_Especializacion": "Sismólogo de campo"
  },
  {
    "Nombre_Curso": "Posicionamiento de sinergias innovadoras",
    "Nivel": "Principiante",
    "Duracion": 8,
    "Area_Especializacion": "Médico general"
  }
]
```

### 19. Buscar facturas con métodos de pago "Tarjeta", "Transferencia" o "Yape"

```javascript
db.facturacion.find(
  {
    Metodo_Pago: { $in: ["Tarjeta", "Transferencia", "Yape"] },
  },
  {
    Id_Emprendedor: 1,
    Monto: 1,
    Metodo_Pago: 1,
    Estado_Pago: 1,
    Fecha_Factura: 1,
    _id: 0,
  }
);
```

**Resultado esperado:**

```json
[
  {
    "Id_Emprendedor": 1,
    "Monto": 1500,
    "Metodo_Pago": "Tarjeta",
    "Estado_Pago": "Pagado",
    "Fecha_Factura": "2025-06-01"
  },
  {
    "Id_Emprendedor": 2,
    "Monto": 2000.5,
    "Metodo_Pago": "Transferencia",
    "Estado_Pago": "Pendiente",
    "Fecha_Factura": "2025-06-02"
  },
  {
    "Id_Emprendedor": 4,
    "Monto": 300,
    "Metodo_Pago": "Yape",
    "Estado_Pago": "Pagado",
    "Fecha_Factura": "2025-06-04"
  },
  {
    "Id_Emprendedor": 6,
    "Monto": 750,
    "Metodo_Pago": "Tarjeta",
    "Estado_Pago": "Pagado",
    "Fecha_Factura": "2025-06-06"
  },
  {
    "Id_Emprendedor": 7,
    "Monto": 1200,
    "Metodo_Pago": "Transferencia",
    "Estado_Pago": "Pagado",
    "Fecha_Factura": "2025-06-07"
  },
  {
    "Id_Emprendedor": 9,
    "Monto": 1100,
    "Metodo_Pago": "Yape",
    "Estado_Pago": "Pagado",
    "Fecha_Factura": "2025-06-09"
  }
]
```

### 20. Buscar emprendedores de distritos específicos: "Miraflores", "Surco", "Barranco"

```javascript
db.emprendedor.find(
  {
    Distrito_Residencia: { $in: ["Miraflores", "Surco", "Barranco"] },
  },
  {
    Nombre_Completo: 1,
    Distrito_Residencia: 1,
    Tipo_Emprendimiento: 1,
    Estado_Emprendimiento: 1,
    _id: 0,
  }
);
```

**Resultado esperado:**

```json
[
  {
    "Nombre_Completo": "Ana López Pérez",
    "Distrito_Residencia": "Miraflores",
    "Tipo_Emprendimiento": "Comercio",
    "Estado_Emprendimiento": "Activo"
  },
  {
    "Nombre_Completo": "Carlos Díaz Ramírez",
    "Distrito_Residencia": "Surco",
    "Tipo_Emprendimiento": "Servicios",
    "Estado_Emprendimiento": "Activo"
  },
  {
    "Nombre_Completo": "Lucía Morales Vega",
    "Distrito_Residencia": "Barranco",
    "Tipo_Emprendimiento": "Agricultura",
    "Estado_Emprendimiento": "Activo"
  }
]
```

### 21. Buscar negocios con capital recibido en rangos específicos: 2000, 3000, 4000, 5000

```javascript
db.negocio.find(
  {
    Capital_Recibido: { $in: [2000, 3000, 4000, 5000] },
  },
  {
    Nombre_Negocio: 1,
    Capital_Recibido: 1,
    Tipo_Negocio: 1,
    Estado_Negocio: 1,
    _id: 0,
  }
);
```

**Resultado esperado:**

```json
[
  {
    "Nombre_Negocio": "López Artesanías",
    "Capital_Recibido": 5000,
    "Tipo_Negocio": "Local",
    "Estado_Negocio": "Activo"
  },
  {
    "Nombre_Negocio": "Marketing Díaz",
    "Capital_Recibido": 3000,
    "Tipo_Negocio": "Regional",
    "Estado_Negocio": "Activo"
  },
  {
    "Nombre_Negocio": "Huertos Verdes",
    "Capital_Recibido": 2000,
    "Tipo_Negocio": "Local",
    "Estado_Negocio": "Activo"
  },
  {
    "Nombre_Negocio": "Educa Plus",
    "Capital_Recibido": 4000,
    "Tipo_Negocio": "Regional",
    "Estado_Negocio": "Activo"
  }
]
```

### 22. Buscar cursos con duraciones específicas: 2, 4, 6, 8 semanas

```javascript
db.curso.find(
  {
    Duracion: { $in: [2, 4, 6, 8] },
  },
  {
    Nombre_Curso: 1,
    Duracion: 1,
    Nivel: 1,
    Area_Especializacion: 1,
    _id: 0,
  }
);
```

**Resultado esperado:**

```json
[
  {
    "Nombre_Curso": "Estrategias para funcionalidades en línea",
    "Duracion": 2,
    "Nivel": "Principiante",
    "Area_Especializacion": "Psicoterapeuta infantil"
  },
  {
    "Nombre_Curso": "Revoluciona redes multimedia",
    "Duracion": 6,
    "Nivel": "Avanzado",
    "Area_Especializacion": "Ingeniero de perforación"
  },
  {
    "Nombre_Curso": "Aprovechamiento de métricas innovadoras",
    "Duracion": 4,
    "Nivel": "Intermedio",
    "Area_Especializacion": "Sismólogo de campo"
  },
  {
    "Nombre_Curso": "Posicionamiento de sinergias innovadoras",
    "Duracion": 8,
    "Nivel": "Principiante",
    "Area_Especializacion": "Médico general"
  }
]
```

### 23. Buscar facturas con montos específicos: 300, 750, 1100, 1300

```javascript
db.facturacion.find(
  {
    Monto: { $in: [300, 750, 1100, 1300] },
  },
  {
    Id_Emprendedor: 1,
    Monto: 1,
    Metodo_Pago: 1,
    Estado_Pago: 1,
    Fecha_Factura: 1,
    _id: 0,
  }
);
```

**Resultado esperado:**

```json
[
  {
    "Id_Emprendedor": 4,
    "Monto": 300,
    "Metodo_Pago": "Yape",
    "Estado_Pago": "Pagado",
    "Fecha_Factura": "2025-06-04"
  },
  {
    "Id_Emprendedor": 6,
    "Monto": 750,
    "Metodo_Pago": "Tarjeta",
    "Estado_Pago": "Pagado",
    "Fecha_Factura": "2025-06-06"
  },
  {
    "Id_Emprendedor": 9,
    "Monto": 1100,
    "Metodo_Pago": "Yape",
    "Estado_Pago": "Pagado",
    "Fecha_Factura": "2025-06-09"
  },
  {
    "Id_Emprendedor": 10,
    "Monto": 1300,
    "Metodo_Pago": "Plin",
    "Estado_Pago": "Pendiente",
    "Fecha_Factura": "2025-06-10"
  }
]
```

---

## Consultas con operadores de agregación avanzados ($lookup, $unwind, $project, $addFields)

### 24. Unir emprendedores con sus negocios usando $lookup

```javascript
db.emprendedor.aggregate([
  {
    $lookup: {
      from: "negocio",
      localField: "Id_Emprendedor",
      foreignField: "Id_Emprendedor",
      as: "negocios",
    },
  },
  {
    $project: {
      Nombre_Completo: 1,
      Tipo_Emprendimiento: 1,
      Distrito_Residencia: 1,
      negocios: {
        Nombre_Negocio: 1,
        Tipo_Negocio: 1,
        Capital_Recibido: 1,
        Estado_Negocio: 1,
      },
      _id: 0,
    },
  },
]);
```

**Resultado esperado:**

```json
[
  {
    "Nombre_Completo": "Ana López Pérez",
    "Tipo_Emprendimiento": "Comercio",
    "Distrito_Residencia": "Miraflores",
    "negocios": [
      {
        "Nombre_Negocio": "López Artesanías",
        "Tipo_Negocio": "Local",
        "Capital_Recibido": 5000,
        "Estado_Negocio": "Activo"
      }
    ]
  },
  {
    "Nombre_Completo": "Carlos Díaz Ramírez",
    "Tipo_Emprendimiento": "Servicios",
    "Distrito_Residencia": "Surco",
    "negocios": [
      {
        "Nombre_Negocio": "Marketing Díaz",
        "Tipo_Negocio": "Regional",
        "Capital_Recibido": 3000,
        "Estado_Negocio": "Activo"
      }
    ]
  }
]
```

### 25. Unir negocios con emprendedores y descomponer con $unwind

```javascript
db.negocio.aggregate([
  {
    $lookup: {
      from: "emprendedor",
      localField: "Id_Emprendedor",
      foreignField: "Id_Emprendedor",
      as: "emprendedor_info",
    },
  },
  {
    $unwind: "$emprendedor_info",
  },
  {
    $project: {
      Nombre_Negocio: 1,
      Tipo_Negocio: 1,
      Capital_Recibido: 1,
      Emprendedor: "$emprendedor_info.Nombre_Completo",
      Distrito: "$emprendedor_info.Distrito_Residencia",
      Tipo_Emprendimiento: "$emprendedor_info.Tipo_Emprendimiento",
      _id: 0,
    },
  },
]);
```

**Resultado esperado:**

```json
[
  {
    "Nombre_Negocio": "López Artesanías",
    "Tipo_Negocio": "Local",
    "Capital_Recibido": 5000,
    "Emprendedor": "Ana López Pérez",
    "Distrito": "Miraflores",
    "Tipo_Emprendimiento": "Comercio"
  },
  {
    "Nombre_Negocio": "Marketing Díaz",
    "Tipo_Negocio": "Regional",
    "Capital_Recibido": 3000,
    "Emprendedor": "Carlos Díaz Ramírez",
    "Distrito": "Surco",
    "Tipo_Emprendimiento": "Servicios"
  },
  {
    "Nombre_Negocio": "Huertos Verdes",
    "Tipo_Negocio": "Local",
    "Capital_Recibido": 2000,
    "Emprendedor": "Lucía Morales Vega",
    "Distrito": "Barranco",
    "Tipo_Emprendimiento": "Agricultura"
  }
]
```

### 26. Unir facturas con emprendedores y agregar campos calculados con $addFields

```javascript
db.facturacion.aggregate([
  {
    $lookup: {
      from: "emprendedor",
      localField: "Id_Emprendedor",
      foreignField: "Id_Emprendedor",
      as: "emprendedor_info",
    },
  },
  {
    $unwind: "$emprendedor_info",
  },
  {
    $addFields: {
      Emprendedor: "$emprendedor_info.Nombre_Completo",
      Distrito: "$emprendedor_info.Distrito_Residencia",
      MontoFormateado: {
        $concat: ["$", { $toString: "$Monto" }],
      },
      EsPagoAlto: {
        $gte: ["$Monto", 1000],
      },
    },
  },
  {
    $project: {
      Id_Emprendedor: 1,
      Emprendedor: 1,
      Distrito: 1,
      Monto: 1,
      MontoFormateado: 1,
      EsPagoAlto: 1,
      Metodo_Pago: 1,
      Estado_Pago: 1,
      _id: 0,
    },
  },
]);
```

**Resultado esperado:**

```json
[
  {
    "Id_Emprendedor": 1,
    "Emprendedor": "Ana López Pérez",
    "Distrito": "Miraflores",
    "Monto": 1500,
    "MontoFormateado": "$1500",
    "EsPagoAlto": true,
    "Metodo_Pago": "Tarjeta",
    "Estado_Pago": "Pagado"
  },
  {
    "Id_Emprendedor": 2,
    "Emprendedor": "Carlos Díaz Ramírez",
    "Distrito": "Surco",
    "Monto": 2000.5,
    "MontoFormateado": "$2000.5",
    "EsPagoAlto": true,
    "Metodo_Pago": "Transferencia",
    "Estado_Pago": "Pendiente"
  },
  {
    "Id_Emprendedor": 3,
    "Emprendedor": "Lucía Morales Vega",
    "Distrito": "Barranco",
    "Monto": 250.75,
    "MontoFormateado": "$250.75",
    "EsPagoAlto": false,
    "Metodo_Pago": "Efectivo",
    "Estado_Pago": "Pagado"
  }
]
```

### 27. Unir cursos con capacitaciones y agregar información calculada

```javascript
db.curso.aggregate([
  {
    $lookup: {
      from: "capacitacion",
      localField: "Id_Capacitacion",
      foreignField: "Id_Capacitacion",
      as: "capacitacion_info",
    },
  },
  {
    $unwind: "$capacitacion_info",
  },
  {
    $addFields: {
      Nombre_Capacitacion: "$capacitacion_info.Nombre_Capacitacion",
      DuracionSemanas: {
        $concat: [{ $toString: "$Duracion" }, " semanas"],
      },
      EsCursoLargo: {
        $gte: ["$Duracion", 10],
      },
      NivelCompleto: {
        $concat: ["Nivel ", "$Nivel"],
      },
    },
  },
  {
    $project: {
      Nombre_Curso: 1,
      Nombre_Capacitacion: 1,
      Nivel: 1,
      NivelCompleto: 1,
      Duracion: 1,
      DuracionSemanas: 1,
      EsCursoLargo: 1,
      Area_Especializacion: 1,
      _id: 0,
    },
  },
]);
```

**Resultado esperado:**

```json
[
  {
    "Nombre_Curso": "Estrategias para funcionalidades en línea",
    "Nombre_Capacitacion": "Desarrollo Web",
    "Nivel": "Principiante",
    "NivelCompleto": "Nivel Principiante",
    "Duracion": 2,
    "DuracionSemanas": "2 semanas",
    "EsCursoLargo": false,
    "Area_Especializacion": "Psicoterapeuta infantil"
  },
  {
    "Nombre_Curso": "Optimización de negocios electrónicos revolucionarios",
    "Nombre_Capacitacion": "Marketing Digital",
    "Nivel": "Intermedio",
    "NivelCompleto": "Nivel Intermedio",
    "Duracion": 7,
    "DuracionSemanas": "7 semanas",
    "EsCursoLargo": false,
    "Area_Especializacion": "Técnico de sonido en radiodifusión/cine/video"
  },
  {
    "Nombre_Curso": "Recontextualización de tecnologías interactivas",
    "Nombre_Capacitacion": "Tecnología Avanzada",
    "Nivel": "Principiante",
    "NivelCompleto": "Nivel Principiante",
    "Duracion": 12,
    "DuracionSemanas": "12 semanas",
    "EsCursoLargo": true,
    "Area_Especializacion": "Gerente de producción"
  }
]
```

### 28. Unir negocios con categorías y agregar análisis financiero

```javascript
db.negocio.aggregate([
  {
    $lookup: {
      from: "categoria_negocio",
      localField: "Id_Categoria",
      foreignField: "Id_Categoria",
      as: "categoria_info",
    },
  },
  {
    $unwind: "$categoria_info",
  },
  {
    $addFields: {
      Nombre_Categoria: "$categoria_info.Nombre_Categoria",
      PorcentajeCompletado: {
        $multiply: [{ $divide: ["$Capital_Recibido", "$Monto_Objetivo"] }, 100],
      },
      FaltaRecaudar: {
        $subtract: ["$Monto_Objetivo", "$Capital_Recibido"],
      },
      EstadoFinanciero: {
        $cond: {
          if: { $gte: ["$Capital_Recibido", "$Monto_Objetivo"] },
          then: "Completado",
          else: "En Progreso",
        },
      },
    },
  },
  {
    $project: {
      Nombre_Negocio: 1,
      Nombre_Categoria: 1,
      Capital_Recibido: 1,
      Monto_Objetivo: 1,
      PorcentajeCompletado: 1,
      FaltaRecaudar: 1,
      EstadoFinanciero: 1,
      Tipo_Negocio: 1,
      _id: 0,
    },
  },
]);
```

**Resultado esperado:**

```json
[
  {
    "Nombre_Negocio": "López Artesanías",
    "Nombre_Categoria": "Artesanías",
    "Capital_Recibido": 5000,
    "Monto_Objetivo": 10000,
    "PorcentajeCompletado": 50.0,
    "FaltaRecaudar": 5000,
    "EstadoFinanciero": "En Progreso",
    "Tipo_Negocio": "Local"
  },
  {
    "Nombre_Negocio": "Marketing Díaz",
    "Nombre_Categoria": "Marketing",
    "Capital_Recibido": 3000,
    "Monto_Objetivo": 8000,
    "PorcentajeCompletado": 37.5,
    "FaltaRecaudar": 5000,
    "EstadoFinanciero": "En Progreso",
    "Tipo_Negocio": "Regional"
  },
  {
    "Nombre_Negocio": "Huertos Verdes",
    "Nombre_Categoria": "Agricultura",
    "Capital_Recibido": 2000,
    "Monto_Objetivo": 5000,
    "PorcentajeCompletado": 40.0,
    "FaltaRecaudar": 3000,
    "EstadoFinanciero": "En Progreso",
    "Tipo_Negocio": "Local"
  }
]
```

### 29. Unir emprendedores con facturas y calcular estadísticas

```javascript
db.emprendedor.aggregate([
  {
    $lookup: {
      from: "facturacion",
      localField: "Id_Emprendedor",
      foreignField: "Id_Emprendedor",
      as: "facturas",
    },
  },
  {
    $addFields: {
      TotalFacturado: {
        $sum: "$facturas.Monto",
      },
      CantidadFacturas: {
        $size: "$facturas",
      },
      PromedioFactura: {
        $cond: {
          if: { $gt: [{ $size: "$facturas" }, 0] },
          then: {
            $divide: [{ $sum: "$facturas.Monto" }, { $size: "$facturas" }],
          },
          else: 0,
        },
      },
      FacturasPagadas: {
        $size: {
          $filter: {
            input: "$facturas",
            cond: { $eq: ["$$this.Estado_Pago", "Pagado"] },
          },
        },
      },
    },
  },
  {
    $project: {
      Nombre_Completo: 1,
      Tipo_Emprendimiento: 1,
      Distrito_Residencia: 1,
      TotalFacturado: 1,
      CantidadFacturas: 1,
      PromedioFactura: 1,
      FacturasPagadas: 1,
      _id: 0,
    },
  },
]);
```

**Resultado esperado:**

```json
[
  {
    "Nombre_Completo": "Ana López Pérez",
    "Tipo_Emprendimiento": "Comercio",
    "Distrito_Residencia": "Miraflores",
    "TotalFacturado": 1500,
    "CantidadFacturas": 1,
    "PromedioFactura": 1500,
    "FacturasPagadas": 1
  },
  {
    "Nombre_Completo": "Carlos Díaz Ramírez",
    "Tipo_Emprendimiento": "Servicios",
    "Distrito_Residencia": "Surco",
    "TotalFacturado": 2000.5,
    "CantidadFacturas": 1,
    "PromedioFactura": 2000.5,
    "FacturasPagadas": 0
  },
  {
    "Nombre_Completo": "Lucía Morales Vega",
    "Tipo_Emprendimiento": "Agricultura",
    "Distrito_Residencia": "Barranco",
    "TotalFacturado": 250.75,
    "CantidadFacturas": 1,
    "PromedioFactura": 250.75,
    "FacturasPagadas": 1
  }
]
```

### 30. Unir cursos con instructores y agregar información de contacto

```javascript
db.curso.aggregate([
  {
    $lookup: {
      from: "mentor",
      localField: "Instructor",
      foreignField: "Id_Mentor",
      as: "instructor_info",
    },
  },
  {
    $unwind: "$instructor_info",
  },
  {
    $addFields: {
      Nombre_Instructor: "$instructor_info.Nombre_Completo",
      Especialidad_Instructor: "$instructor_info.Especialidad",
      Experiencia_Instructor: "$instructor_info.Años_Experiencia",
      CursoCompleto: {
        $concat: ["$Nombre_Curso", " - ", "$Nivel"],
      },
      DuracionTexto: {
        $concat: [{ $toString: "$Duracion" }, " semanas (", "$Nivel", ")"],
      },
    },
  },
  {
    $project: {
      CursoCompleto: 1,
      Nombre_Instructor: 1,
      Especialidad_Instructor: 1,
      Experiencia_Instructor: 1,
      DuracionTexto: 1,
      Area_Especializacion: 1,
      _id: 0,
    },
  },
]);
```

**Resultado esperado:**

```json
[
  {
    "CursoCompleto": "Estrategias para funcionalidades en línea - Principiante",
    "Nombre_Instructor": "María González",
    "Especialidad_Instructor": "Desarrollo Web",
    "Experiencia_Instructor": 8,
    "DuracionTexto": "2 semanas (Principiante)",
    "Area_Especializacion": "Psicoterapeuta infantil"
  },
  {
    "CursoCompleto": "Optimización de negocios electrónicos revolucionarios - Intermedio",
    "Nombre_Instructor": "Juan Pérez",
    "Especialidad_Instructor": "Marketing Digital",
    "Experiencia_Instructor": 12,
    "DuracionTexto": "7 semanas (Intermedio)",
    "Area_Especializacion": "Técnico de sonido en radiodifusión/cine/video"
  },
  {
    "CursoCompleto": "Recontextualización de tecnologías interactivas - Principiante",
    "Nombre_Instructor": "Carlos Rodríguez",
    "Especialidad_Instructor": "Tecnología Avanzada",
    "Experiencia_Instructor": 15,
    "DuracionTexto": "12 semanas (Principiante)",
    "Area_Especializacion": "Gerente de producción"
  }
]
```

---

## Consultas de Actualización (UPDATE)

### 31. Actualizar el estado de un emprendedor específico

```javascript
db.emprendedor.updateOne(
  { Id_Emprendedor: 1 },
  { $set: { Estado_Emprendimiento: "Inactivo" } }
);
```

**Explicación:**
- `updateOne`: Actualiza un solo documento que coincida con el filtro
- `$set`: Establece el valor del campo especificado
- Filtro: Busca el emprendedor con `Id_Emprendedor: 1`
- Actualización: Cambia `Estado_Emprendimiento` a "Inactivo"

**Resultado esperado:**
```json
{
  "acknowledged": true,
  "matchedCount": 1,
  "modifiedCount": 1,
  "upsertedId": null
}
```

### 32. Actualizar el capital recibido de un negocio

```javascript
db.negocio.updateOne(
  { Id_Negocio: 2 },
  { 
    $set: { 
      Capital_Recibido: 3500,
      Fecha_Ultima_Actualizacion: new Date()
    } 
  }
);
```

**Explicación:**
- Actualiza el negocio con `Id_Negocio: 2`
- Cambia `Capital_Recibido` a 3500
- Actualiza `Fecha_Ultima_Actualizacion` con la fecha actual

### 33. Actualizar múltiples facturas pendientes a pagadas

```javascript
db.facturacion.updateMany(
  { Estado_Pago: "Pendiente" },
  { $set: { Estado_Pago: "Pagado" } }
);
```

**Explicación:**
- `updateMany`: Actualiza todos los documentos que coincidan con el filtro
- Filtro: Busca todas las facturas con `Estado_Pago: "Pendiente"`
- Actualización: Cambia el estado a "Pagado"

### 34. Incrementar la duración de todos los cursos principiantes

```javascript
db.curso.updateMany(
  { Nivel: "Principiante" },
  { $inc: { Duracion: 1 } }
);
```

**Explicación:**
- `$inc`: Incrementa el valor del campo en la cantidad especificada
- Filtro: Todos los cursos de nivel "Principiante"
- Actualización: Aumenta la duración en 1 semana

### 35. Actualizar la experiencia de un mentor específico

```javascript
db.mentor.updateOne(
  { Id_Mentor: 5 },
  { 
    $set: { 
      Años_Experiencia: 6,
      Area_Especializacion: "Marketing Digital Avanzado"
    } 
  }
);
```

**Explicación:**
- Actualiza el mentor con `Id_Mentor: 5`
- Cambia `Años_Experiencia` a 6
- Actualiza `Area_Especializacion` a "Marketing Digital Avanzado"

### 36. Actualizar el estado de múltiples negocios según su capital

```javascript
db.negocio.updateMany(
  { Capital_Recibido: { $gte: 5000 } },
  { $set: { Estado_Negocio: "Completado" } }
);
```

**Explicación:**
- Filtro: Negocios con capital recibido mayor o igual a 5000
- Actualización: Cambia el estado a "Completado"

### 37. Actualizar el método de pago de facturas específicas

```javascript
db.facturacion.updateMany(
  { Metodo_Pago: "Efectivo" },
  { $set: { Metodo_Pago: "Transferencia" } }
);
```

**Explicación:**
- Filtro: Todas las facturas con método de pago "Efectivo"
- Actualización: Cambia el método de pago a "Transferencia"

### 38. Actualizar la descripción de un curso específico

```javascript
db.curso.updateOne(
  { Id_Curso: 3 },
  { 
    $set: { 
      Descripcion_Curso: "Curso actualizado sobre tecnologías interactivas modernas",
      Area_Especializacion: "Tecnología Interactiva"
    } 
  }
);
```

**Explicación:**
- Actualiza el curso con `Id_Curso: 3`
- Modifica la descripción y área de especialización

### 39. Actualizar el tipo de mentoria de múltiples mentores

```javascript
db.mentor.updateMany(
  { Tipo_Mentoria: "Marketing" },
  { $set: { Tipo_Mentoria: "Marketing Digital" } }
);
```

**Explicación:**
- Filtro: Todos los mentores con tipo de mentoria "Marketing"
- Actualización: Cambia a "Marketing Digital"

### 40. Actualizar el distrito de residencia de un emprendedor

```javascript
db.emprendedor.updateOne(
  { Id_Emprendedor: 8 },
  { 
    $set: { 
      Distrito_Residencia: "San Miguel",
      Id_Distrito: 11
    } 
  }
);
```

**Explicación:**
- Actualiza el emprendedor con `Id_Emprendedor: 8`
- Cambia el distrito de residencia y su ID correspondiente

### 41. Actualizar múltiples campos de una factura

```javascript
db.facturacion.updateOne(
  { Id_Factura: 4 },
  { 
    $set: { 
      Monto: 350,
      Metodo_Pago: "Yape",
      Estado_Pago: "Pagado"
    } 
  }
);
```

**Explicación:**
- Actualiza la factura con `Id_Factura: 4`
- Modifica monto, método de pago y estado simultáneamente

### 42. Actualizar el estado de emprendedores inactivos

```javascript
db.emprendedor.updateMany(
  { Estado_Emprendimiento: "Inactivo" },
  { $set: { Estado_Emprendimiento: "Activo" } }
);
```

**Explicación:**
- Filtro: Todos los emprendedores inactivos
- Actualización: Reactiva todos los emprendedores

### 43. Actualizar la duración de cursos largos

```javascript
db.curso.updateMany(
  { Duracion: { $gt: 10 } },
  { $inc: { Duracion: 2 } }
);
```

**Explicación:**
- Filtro: Cursos con duración mayor a 10 semanas
- Actualización: Aumenta la duración en 2 semanas adicionales

### 44. Actualizar el capital objetivo de negocios específicos

```javascript
db.negocio.updateMany(
  { Tipo_Negocio: "Nacional" },
  { $inc: { Monto_Objetivo: 1000 } }
);
```

**Explicación:**
- Filtro: Negocios de tipo "Nacional"
- Actualización: Aumenta el monto objetivo en 1000

### 45. Actualizar la especialidad de mentores experimentados

```javascript
db.mentor.updateMany(
  { Años_Experiencia: { $gte: 15 } },
  { $set: { Area_Especializacion: "Especialista Senior" } }
);
```

**Explicación:**
- Filtro: Mentores con 15 o más años de experiencia
- Actualización: Cambia su área de especialización a "Especialista Senior"

---

## Operadores de Actualización Utilizados:

- **`$set`**: Establece el valor de un campo
- **`$inc`**: Incrementa el valor de un campo numérico
- **`$unset`**: Elimina un campo (no usado en los ejemplos)
- **`$push`**: Agrega elementos a un array (no usado en los ejemplos)
- **`$pull`**: Elimina elementos de un array (no usado en los ejemplos)

## JSON Schema Validation:

Memotecnia: 

- **`Julian`**: $JsonSchema: {

}
-  **`Busca`**: bsonType: 'object',
-  **`Reglas`**: required: [

]
-  **`Precisas`**: properties: {

}

### EJEMPLO: SINTAXIS DE VALIDACION

```javascript
$jsonSchema: {
  bsonType: "object",
  required: [...],
  properties: {
    campo1: {
      bsonType: "string"
    }
  }
}
```

_Nota: Este archivo se irá actualizando con más consultas según las necesidades del proyecto._

