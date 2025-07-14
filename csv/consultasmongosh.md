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

_Nota: Este archivo se irá actualizando con más consultas según las necesidades del proyecto._
