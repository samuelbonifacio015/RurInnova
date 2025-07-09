# Consultas MongoDB para RurInnova
## Taller de Análisis y Consulta

### Configuración Inicial

```javascript
// Conectar a MongoDB
mongosh "mongodb://localhost:27017/rurInnova"

// Verificar las colecciones disponibles
show collections

// Contar documentos en cada colección
db.usuario.countDocuments()
db.emprendedor.countDocuments()
db.negocio.countDocuments()
db.mentor.countDocuments()
db.concurso.countDocuments()
db.sesion_mentoria.countDocuments()
db.categoria_negocio.countDocuments()
db.distrito.countDocuments()
db.tipo_usuario.countDocuments()
db.tipo_concurso.countDocuments()
db.organizacion_patrocinadora.countDocuments()
db.capacitacion.countDocuments()
db.curso.countDocuments()
db.direccion.countDocuments()
db.facturacion.countDocuments()
db.feedback.countDocuments()
db.historico_emprendimiento.countDocuments()
```

### 1. Consultas Básicas de Exploración

```javascript
// Mostrar todos los usuarios
db.usuario.find()

// Mostrar todos los emprendedores
db.emprendedor.find()

// Mostrar todos los negocios
db.negocio.find()

// Mostrar todos los mentores
db.mentor.find()

// Mostrar todos los concursos
db.concurso.find()

// Mostrar todas las sesiones de mentoría
db.sesion_mentoria.find()

// Mostrar todas las categorías de negocio
db.categoria_negocio.find()

// Mostrar todos los distritos
db.distrito.find()

// Mostrar todos los tipos de usuario
db.tipo_usuario.find()

// Mostrar todas las organizaciones patrocinadoras
db.organizacion_patrocinadora.find()

// Mostrar todas las capacitaciones
db.capacitacion.find()

// Mostrar todos los cursos
db.curso.find()

// Mostrar todas las direcciones
db.direccion.find()

// Mostrar todas las facturaciones
db.facturacion.find()

// Mostrar todos los feedbacks
db.feedback.find()

// Mostrar todo el histórico de emprendimiento
db.historico_emprendimiento.find()
```

### 2. Consultas con Proyección

```javascript
// Mostrar solo nombres y correos de usuarios
db.usuario.find({}, {Nombre_Usuario: 1, Correo_Electronico: 1, _id: 0})

// Mostrar emprendedores con nombre, tipo y distrito
db.emprendedor.find({}, {Nombre_Completo: 1, Tipo_Emprendimiento: 1, Distrito_Residencia: 1, _id: 0})

// Mostrar negocios con nombre, capital y tipo
db.negocio.find({}, {Nombre_Negocio: 1, Capital_Recibido: 1, Tipo_Negocio: 1, _id: 0})

// Mostrar mentores con nombre y especialización
db.mentor.find({}, {Nombre_Completo: 1, Area_Especializacion: 1, Años_Experiencia: 1, _id: 0})

// Mostrar concursos con nombre, estado y fechas
db.concurso.find({}, {Nombre_Concurso: 1, Estado_Concurso: 1, Fecha_Lanzamiento: 1, Fecha_Cierre: 1, _id: 0})

// Mostrar sesiones de mentoría con fecha y tipo
db.sesion_mentoria.find({}, {Fecha_Sesion: 1, Tipo_Sesion: 1, Duracion: 1, Tema_Trata: 1, _id: 0})
```

### 3. Consultas con Filtros

```javascript
// Buscar emprendedores activos
db.emprendedor.find({Estado_Emprendimiento: "Activo"})

// Buscar negocios con capital mayor a 5000
db.negocio.find({Capital_Recibido: {$gt: "5000"}})

// Buscar mentores con más de 10 años de experiencia
db.mentor.find({Años_Experiencia: {$gt: 10}})

// Buscar concursos abiertos
db.concurso.find({Estado_Concurso: "Abierto"})

// Buscar sesiones de mentoría virtuales
db.sesion_mentoria.find({Tipo_Sesion: "Virtual"})

// Buscar emprendedores en distritos específicos
db.emprendedor.find({Distrito_Residencia: {$in: ["Miraflores", "San Isidro", "Barranco"]}})

// Buscar mentores de marketing digital
db.mentor.find({Area_Especializacion: {$regex: "Marketing", $options: "i"}})

// Buscar capacitaciones activas
db.capacitacion.find({Estado_Capacitacion: "Activa"})

// Buscar cursos por tipo
db.curso.find({Tipo_Curso: "Presencial"})
```

### 4. Consultas de Agregación Básicas

```javascript
// Contar emprendedores por tipo
db.emprendedor.aggregate([
  {$group: {_id: "$Tipo_Emprendimiento", total: {$sum: 1}}},
  {$sort: {total: -1}}
])

// Contar negocios por tipo
db.negocio.aggregate([
  {$group: {_id: "$Tipo_Negocio", total: {$sum: 1}}},
  {$sort: {total: -1}}
])

// Contar mentores por especialización
db.mentor.aggregate([
  {$group: {_id: "$Area_Especializacion", total: {$sum: 1}}},
  {$sort: {total: -1}}
])

// Contar emprendedores por distrito
db.emprendedor.aggregate([
  {$group: {_id: "$Distrito_Residencia", total: {$sum: 1}}},
  {$sort: {total: -1}}
])

// Contar concursos por estado
db.concurso.aggregate([
  {$group: {_id: "$Estado_Concurso", total: {$sum: 1}}},
  {$sort: {total: -1}}
])

// Contar sesiones por tipo
db.sesion_mentoria.aggregate([
  {$group: {_id: "$Tipo_Sesion", total: {$sum: 1}}},
  {$sort: {total: -1}}
])

// Contar capacitaciones por estado
db.capacitacion.aggregate([
  {$group: {_id: "$Estado_Capacitacion", total: {$sum: 1}}},
  {$sort: {total: -1}}
])
```

### 5. Consultas con $lookup (Joins)

```javascript
// Emprendedores con información de usuario
db.emprendedor.aggregate([
  {
    $lookup: {
      from: "usuario",
      localField: "Id_Usuario",
      foreignField: "Id_Usuario",
      as: "usuario"
    }
  },
  {
    $project: {
      _id: 0,
      emprendedor: "$Nombre_Completo",
      tipo: "$Tipo_Emprendimiento",
      distrito: "$Distrito_Residencia",
      usuario: {$arrayElemAt: ["$usuario.Nombre_Usuario", 0]},
      correo: {$arrayElemAt: ["$usuario.Correo_Electronico", 0]}
    }
  }
])

// Negocios con información de emprendedor
db.negocio.aggregate([
  {
    $lookup: {
      from: "emprendedor",
      localField: "Id_Emprendedor",
      foreignField: "Id_Emprendedor",
      as: "emprendedor"
    }
  },
  {
    $project: {
      _id: 0,
      negocio: "$Nombre_Negocio",
      capital: "$Capital_Recibido",
      tipo: "$Tipo_Negocio",
      emprendedor: {$arrayElemAt: ["$emprendedor.Nombre_Completo", 0]},
      distrito: {$arrayElemAt: ["$emprendedor.Distrito_Residencia", 0]}
    }
  }
])

// Sesiones de mentoría con información de mentor y emprendedor
db.sesion_mentoria.aggregate([
  {
    $lookup: {
      from: "mentor",
      localField: "Id_Mentor",
      foreignField: "Id_Mentor",
      as: "mentor"
    }
  },
  {
    $lookup: {
      from: "emprendedor",
      localField: "Id_Emprendedor",
      foreignField: "Id_Emprendedor",
      as: "emprendedor"
    }
  },
  {
    $project: {
      _id: 0,
      fecha: "$Fecha_Sesion",
      tipo: "$Tipo_Sesion",
      duracion: "$Duracion",
      mentor: {$arrayElemAt: ["$mentor.Nombre_Completo", 0]},
      emprendedor: {$arrayElemAt: ["$emprendedor.Nombre_Completo", 0]},
      tema: "$Tema_Trata"
    }
  }
])

// Concursos con información de organización
db.concurso.aggregate([
  {
    $lookup: {
      from: "organizacion_patrocinadora",
      localField: "Id_Organizacion",
      foreignField: "Id_Organizacion",
      as: "organizacion"
    }
  },
  {
    $project: {
      _id: 0,
      concurso: "$Nombre_Concurso",
      estado: "$Estado_Concurso",
      tema: "$Tema_Concurso",
      organizacion: {$arrayElemAt: ["$organizacion.Nombre_Organizacion", 0]}
    }
  }
])

// Cursos con información de capacitación
db.curso.aggregate([
  {
    $lookup: {
      from: "capacitacion",
      localField: "Id_Capacitacion",
      foreignField: "Id_Capacitacion",
      as: "capacitacion"
    }
  },
  {
    $project: {
      _id: 0,
      curso: "$Nombre_Curso",
      tipo: "$Tipo_Curso",
      capacitacion: {$arrayElemAt: ["$capacitacion.Nombre_Capacitacion", 0]}
    }
  }
])
```

### 6. Consultas de Análisis Estadístico

```javascript
// Estadísticas de capital por negocio
db.negocio.aggregate([
  {
    $group: {
      _id: null,
      total_negocios: {$sum: 1},
      capital_total: {$sum: {$toDouble: "$Capital_Recibido"}},
      capital_promedio: {$avg: {$toDouble: "$Capital_Recibido"}},
      capital_maximo: {$max: {$toDouble: "$Capital_Recibido"}},
      capital_minimo: {$min: {$toDouble: "$Capital_Recibido"}}
    }
  }
])

// Estadísticas de experiencia de mentores
db.mentor.aggregate([
  {
    $group: {
      _id: null,
      total_mentores: {$sum: 1},
      experiencia_promedio: {$avg: "$Años_Experiencia"},
      experiencia_maxima: {$max: "$Años_Experiencia"},
      experiencia_minima: {$min: "$Años_Experiencia"}
    }
  }
])

// Estadísticas de sesiones de mentoría
db.sesion_mentoria.aggregate([
  {
    $group: {
      _id: null,
      total_sesiones: {$sum: 1},
      sesiones_virtuales: {
        $sum: {$cond: [{$eq: ["$Tipo_Sesion", "Virtual"]}, 1, 0]}
      },
      sesiones_presenciales: {
        $sum: {$cond: [{$eq: ["$Tipo_Sesion", "Presencial"]}, 1, 0]}
      }
    }
  }
])

// Estadísticas de concursos
db.concurso.aggregate([
  {
    $group: {
      _id: null,
      total_concursos: {$sum: 1},
      concursos_abiertos: {
        $sum: {$cond: [{$eq: ["$Estado_Concurso", "Abierto"]}, 1, 0]}
      },
      concursos_cerrados: {
        $sum: {$cond: [{$eq: ["$Estado_Concurso", "Cerrado"]}, 1, 0]}
      },
      concursos_planificados: {
        $sum: {$cond: [{$eq: ["$Estado_Concurso", "Planificado"]}, 1, 0]}
      }
    }
  }
])

// Estadísticas de capacitaciones
db.capacitacion.aggregate([
  {
    $group: {
      _id: null,
      total_capacitaciones: {$sum: 1},
      capacitaciones_activas: {
        $sum: {$cond: [{$eq: ["$Estado_Capacitacion", "Activa"]}, 1, 0]}
      },
      capacitaciones_completadas: {
        $sum: {$cond: [{$eq: ["$Estado_Capacitacion", "Completada"]}, 1, 0]}
      }
    }
  }
])
```

### 7. Consultas con Filtros Avanzados

```javascript
// Emprendedores en distritos específicos
db.emprendedor.find({
  Distrito_Residencia: {$in: ["Miraflores", "San Isidro", "Barranco"]}
})

// Negocios con capital entre 3000 y 8000
db.negocio.find({
  Capital_Recibido: {$gte: "3000", $lte: "8000"}
})

// Mentores con experiencia entre 5 y 15 años
db.mentor.find({
  Años_Experiencia: {$gte: 5, $lte: 15}
})

// Concursos que terminan en 2025
db.concurso.find({
  Fecha_Cierre: {$regex: "2025"}
})

// Sesiones de mentoría en junio de 2025
db.sesion_mentoria.find({
  Fecha_Sesion: {$regex: "2025-06"}
})

// Capacitaciones con duración mayor a 20 horas
db.capacitacion.find({
  Duracion_Horas: {$gt: 20}
})
```

### 8. Consultas de Búsqueda de Texto

```javascript
// Buscar emprendedores por nombre
db.emprendedor.find({
  Nombre_Completo: {$regex: "Ana", $options: "i"}
})

// Buscar negocios por descripción
db.negocio.find({
  Descripcion_Negocio: {$regex: "digital", $options: "i"}
})

// Buscar mentores por especialización
db.mentor.find({
  Area_Especializacion: {$regex: "Marketing", $options: "i"}
})

// Buscar concursos por tema
db.concurso.find({
  Tema_Concurso: {$regex: "Tecnología", $options: "i"}
})

// Buscar capacitaciones por nombre
db.capacitacion.find({
  Nombre_Capacitacion: {$regex: "emprendimiento", $options: "i"}
})
```

### 9. Consultas de Ordenamiento

```javascript
// Emprendedores ordenados por nombre
db.emprendedor.find().sort({Nombre_Completo: 1})

// Negocios ordenados por capital (descendente)
db.negocio.find().sort({Capital_Recibido: -1})

// Mentores ordenados por experiencia (descendente)
db.mentor.find().sort({Años_Experiencia: -1})

// Concursos ordenados por fecha de lanzamiento
db.concurso.find().sort({Fecha_Lanzamiento: 1})

// Sesiones ordenadas por fecha
db.sesion_mentoria.find().sort({Fecha_Sesion: -1})

// Capacitaciones ordenadas por duración
db.capacitacion.find().sort({Duracion_Horas: -1})
```

### 10. Consultas con Límites

```javascript
// Top 5 negocios con mayor capital
db.negocio.find().sort({Capital_Recibido: -1}).limit(5)

// Top 3 mentores con más experiencia
db.mentor.find().sort({Años_Experiencia: -1}).limit(3)

// Primeros 10 emprendedores
db.emprendedor.find().limit(10)

// Últimos 5 concursos
db.concurso.find().sort({Fecha_Lanzamiento: -1}).limit(5)

// Últimas 10 sesiones de mentoría
db.sesion_mentoria.find().sort({Fecha_Sesion: -1}).limit(10)

// Top 5 capacitaciones más largas
db.capacitacion.find().sort({Duracion_Horas: -1}).limit(5)
```

### 11. Consultas de Análisis por Categorías

```javascript
// Capital promedio por tipo de negocio
db.negocio.aggregate([
  {
    $group: {
      _id: "$Tipo_Negocio",
      capital_promedio: {$avg: {$toDouble: "$Capital_Recibido"}},
      total_negocios: {$sum: 1}
    }
  },
  {$sort: {capital_promedio: -1}}
])

// Emprendedores por tipo y distrito
db.emprendedor.aggregate([
  {
    $group: {
      _id: {
        tipo: "$Tipo_Emprendimiento",
        distrito: "$Distrito_Residencia"
      },
      total: {$sum: 1}
    }
  },
  {$sort: {total: -1}}
])

// Mentores por especialización y años de experiencia
db.mentor.aggregate([
  {
    $group: {
      _id: "$Area_Especializacion",
      promedio_experiencia: {$avg: "$Años_Experiencia"},
      total_mentores: {$sum: 1}
    }
  },
  {$sort: {promedio_experiencia: -1}}
])

// Sesiones por tipo y duración promedio
db.sesion_mentoria.aggregate([
  {
    $group: {
      _id: "$Tipo_Sesion",
      total_sesiones: {$sum: 1},
      duracion_promedio: {$avg: {$toInt: {$substr: ["$Duracion", 0, 2]}}}
    }
  },
  {$sort: {total_sesiones: -1}}
])

// Capacitaciones por tipo y duración promedio
db.capacitacion.aggregate([
  {
    $group: {
      _id: "$Tipo_Capacitacion",
      total_capacitaciones: {$sum: 1},
      duracion_promedio: {$avg: "$Duracion_Horas"}
    }
  },
  {$sort: {total_capacitaciones: -1}}
])
```

### 12. Consultas de Resumen Completo

```javascript
// Dashboard completo del sistema
db.emprendedor.aggregate([
  {
    $facet: {
      "resumen_emprendedores": [
        {$group: {
          _id: null,
          total: {$sum: 1},
          activos: {$sum: {$cond: [{$eq: ["$Estado_Emprendimiento", "Activo"]}, 1, 0]}}
        }}
      ],
      "por_tipo": [
        {$group: {_id: "$Tipo_Emprendimiento", total: {$sum: 1}}}
      ],
      "por_distrito": [
        {$group: {_id: "$Distrito_Residencia", total: {$sum: 1}}}
      ]
    }
  }
])

// Resumen de negocios
db.negocio.aggregate([
  {
    $facet: {
      "resumen_negocios": [
        {$group: {
          _id: null,
          total: {$sum: 1},
          capital_total: {$sum: {$toDouble: "$Capital_Recibido"}},
          capital_promedio: {$avg: {$toDouble: "$Capital_Recibido"}}
        }}
      ],
      "por_tipo": [
        {$group: {_id: "$Tipo_Negocio", total: {$sum: 1}}}
      ],
      "por_estado": [
        {$group: {_id: "$Estado_Negocio", total: {$sum: 1}}}
      ]
    }
  }
])

// Resumen de mentoría
db.sesion_mentoria.aggregate([
  {
    $facet: {
      "resumen_sesiones": [
        {$group: {
          _id: null,
          total: {$sum: 1},
          virtuales: {$sum: {$cond: [{$eq: ["$Tipo_Sesion", "Virtual"]}, 1, 0]}},
          presenciales: {$sum: {$cond: [{$eq: ["$Tipo_Sesion", "Presencial"]}, 1, 0]}}
        }}
      ],
      "por_tema": [
        {$group: {_id: "$Tema_Trata", total: {$sum: 1}}}
      ],
      "por_tipo": [
        {$group: {_id: "$Tipo_Sesion", total: {$sum: 1}}}
      ]
    }
  }
])

// Resumen de capacitaciones
db.capacitacion.aggregate([
  {
    $facet: {
      "resumen_capacitaciones": [
        {$group: {
          _id: null,
          total: {$sum: 1},
          activas: {$sum: {$cond: [{$eq: ["$Estado_Capacitacion", "Activa"]}, 1, 0]}},
          completadas: {$sum: {$cond: [{$eq: ["$Estado_Capacitacion", "Completada"]}, 1, 0]}}
        }}
      ],
      "por_tipo": [
        {$group: {_id: "$Tipo_Capacitacion", total: {$sum: 1}}}
      ],
      "por_duracion": [
        {$group: {_id: "$Duracion_Horas", total: {$sum: 1}}}
      ]
    }
  }
])
```

### 13. Consultas de Validación de Datos

```javascript
// Verificar emprendedores sin usuario asociado
db.emprendedor.aggregate([
  {
    $lookup: {
      from: "usuario",
      localField: "Id_Usuario",
      foreignField: "Id_Usuario",
      as: "usuario"
    }
  },
  {
    $match: {
      usuario: {$size: 0}
    }
  }
])

// Verificar negocios sin emprendedor asociado
db.negocio.aggregate([
  {
    $lookup: {
      from: "emprendedor",
      localField: "Id_Emprendedor",
      foreignField: "Id_Emprendedor",
      as: "emprendedor"
    }
  },
  {
    $match: {
      emprendedor: {$size: 0}
    }
  }
])

// Verificar sesiones sin mentor asociado
db.sesion_mentoria.aggregate([
  {
    $lookup: {
      from: "mentor",
      localField: "Id_Mentor",
      foreignField: "Id_Mentor",
      as: "mentor"
    }
  },
  {
    $match: {
      mentor: {$size: 0}
    }
  }
])

// Verificar cursos sin capacitación asociada
db.curso.aggregate([
  {
    $lookup: {
      from: "capacitacion",
      localField: "Id_Capacitacion",
      foreignField: "Id_Capacitacion",
      as: "capacitacion"
    }
  },
  {
    $match: {
      capacitacion: {$size: 0}
    }
  }
])
```

### 14. Consultas de Exportación

```javascript
// Exportar emprendedores a formato legible
db.emprendedor.find().forEach(function(doc) {
  printjson({
    id: doc.Id_Emprendedor,
    nombre: doc.Nombre_Completo,
    tipo: doc.Tipo_Emprendimiento,
    distrito: doc.Distrito_Residencia,
    estado: doc.Estado_Emprendimiento
  });
})

// Exportar estadísticas de negocios
db.negocio.aggregate([
  {
    $group: {
      _id: "$Tipo_Negocio",
      total: {$sum: 1},
      capital_total: {$sum: {$toDouble: "$Capital_Recibido"}}
    }
  }
]).forEach(function(doc) {
  printjson(doc);
})

// Exportar resumen de mentoría
db.sesion_mentoria.aggregate([
  {
    $group: {
      _id: "$Tipo_Sesion",
      total: {$sum: 1},
      temas: {$addToSet: "$Tema_Trata"}
    }
  }
]).forEach(function(doc) {
  printjson(doc);
})

// Exportar estadísticas de capacitaciones
db.capacitacion.aggregate([
  {
    $group: {
      _id: "$Tipo_Capacitacion",
      total: {$sum: 1},
      duracion_promedio: {$avg: "$Duracion_Horas"}
    }
  }
]).forEach(function(doc) {
  printjson(doc);
})
```

### 15. Consultas Específicas de RurInnova

```javascript
// Emprendedores por tipo de emprendimiento
db.emprendedor.aggregate([
  {
    $group: {
      _id: "$Tipo_Emprendimiento",
      total: {$sum: 1},
      distritos: {$addToSet: "$Distrito_Residencia"}
    }
  },
  {$sort: {total: -1}}
])

// Análisis de capital por categoría de negocio
db.negocio.aggregate([
  {
    $lookup: {
      from: "categoria_negocio",
      localField: "Id_Categoria",
      foreignField: "Id_Categoria",
      as: "categoria"
    }
  },
  {
    $group: {
      _id: {$arrayElemAt: ["$categoria.Nombre_Categoria", 0]},
      total_negocios: {$sum: 1},
      capital_total: {$sum: {$toDouble: "$Capital_Recibido"}},
      capital_promedio: {$avg: {$toDouble: "$Capital_Recibido"}}
    }
  },
  {$sort: {capital_total: -1}}
])

// Análisis de mentoría por área de especialización
db.sesion_mentoria.aggregate([
  {
    $lookup: {
      from: "mentor",
      localField: "Id_Mentor",
      foreignField: "Id_Mentor",
      as: "mentor"
    }
  },
  {
    $group: {
      _id: {$arrayElemAt: ["$mentor.Area_Especializacion", 0]},
      total_sesiones: {$sum: 1},
      temas: {$addToSet: "$Tema_Trata"}
    }
  },
  {$sort: {total_sesiones: -1}}
])

// Análisis de concursos por organización
db.concurso.aggregate([
  {
    $lookup: {
      from: "organizacion_patrocinadora",
      localField: "Id_Organizacion",
      foreignField: "Id_Organizacion",
      as: "organizacion"
    }
  },
  {
    $group: {
      _id: {$arrayElemAt: ["$organizacion.Nombre_Organizacion", 0]},
      total_concursos: {$sum: 1},
      temas: {$addToSet: "$Tema_Concurso"},
      estados: {$addToSet: "$Estado_Concurso"}
    }
  },
  {$sort: {total_concursos: -1}}
])

// Análisis de capacitaciones por tipo
db.capacitacion.aggregate([
  {
    $group: {
      _id: "$Tipo_Capacitacion",
      total_capacitaciones: {$sum: 1},
      duracion_promedio: {$avg: "$Duracion_Horas"},
      estados: {$addToSet: "$Estado_Capacitacion"}
    }
  },
  {$sort: {total_capacitaciones: -1}}
])

// Análisis de feedback por tipo
db.feedback.aggregate([
  {
    $group: {
      _id: "$Tipo_Feedback",
      total_feedbacks: {$sum: 1},
      calificacion_promedio: {$avg: "$Calificacion"}
    }
  },
  {$sort: {total_feedbacks: -1}}
])
```

### Notas de Uso

1. **Ejecutar en mongosh**: Todas las consultas están diseñadas para ejecutarse directamente en mongosh.

2. **Verificar datos**: Antes de ejecutar consultas complejas, verificar que los datos se hayan importado correctamente.

3. **Formato de salida**: Usar `.pretty()` para formatear la salida de manera legible.

4. **Índices**: Para mejorar el rendimiento, crear índices en campos frecuentemente consultados:
   ```javascript
   db.emprendedor.createIndex({Id_Usuario: 1})
   db.negocio.createIndex({Id_Emprendedor: 1})
   db.mentor.createIndex({Area_Especializacion: 1})
   db.sesion_mentoria.createIndex({Id_Mentor: 1})
   db.concurso.createIndex({Estado_Concurso: 1})
   db.capacitacion.createIndex({Estado_Capacitacion: 1})
   ```

5. **Validación**: Verificar que las colecciones existan con `show collections`.

6. **Estructura de datos**: Las consultas están basadas en los nombres reales de las colecciones en singular de los archivos CSV de RurInnova.

7. **Colecciones excluidas**: No se incluyen consultas para redes_sociales, recursos y premios_concurso según especificación.