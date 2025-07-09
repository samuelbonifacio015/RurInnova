# Consultas MongoDB para RurInnova

## Consultas Anidadas

### 1. Emprendedores con Información Completa de Usuario y Negocio

```javascript
// Consulta que anida información de usuario, emprendedor y negocio
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
    $lookup: {
      from: "negocio",
      localField: "Id_Emprendedor",
      foreignField: "Id_Emprendedor",
      as: "negocio"
    }
  },
  {
    $lookup: {
      from: "categoria_negocio",
      localField: "negocio.Id_Categoria",
      foreignField: "Id_Categoria",
      as: "categoria"
    }
  },
  {
    $project: {
      _id: 0,
      emprendedor: {
        id: "$Id_Emprendedor",
        nombre: "$Nombre_Completo",
        tipo_emprendimiento: "$Tipo_Emprendimiento",
        estado: "$Estado_Emprendimiento",
        distrito: "$Distrito_Residencia"
      },
      usuario: {
        nombre: { $arrayElemAt: ["$usuario.Nombre_Usuario", 0] },
        correo: { $arrayElemAt: ["$usuario.Correo_Electronico", 0] }
      },
      negocio: {
        nombre: { $arrayElemAt: ["$negocio.Nombre_Negocio", 0] },
        descripcion: { $arrayElemAt: ["$negocio.Descripcion_Negocio", 0] },
        tipo: { $arrayElemAt: ["$negocio.Tipo_Negocio", 0] },
        capital: { $arrayElemAt: ["$negocio.Capital_Recibido", 0] },
        categoria: { $arrayElemAt: ["$categoria.Nombre_Categoria", 0] }
      }
    }
  }
])
```

### 2. Mentores con Sus Sesiones de Mentoría

```javascript
// Consulta que anida mentores con sus sesiones de mentoría
db.mentor.aggregate([
  {
    $lookup: {
      from: "sesion_mentoria",
      localField: "Id_Mentor",
      foreignField: "Id_Mentor",
      as: "sesiones"
    }
  },
  {
    $lookup: {
      from: "emprendedor",
      localField: "sesiones.Id_Emprendedor",
      foreignField: "Id_Emprendedor",
      as: "emprendedores_mentoreados"
    }
  },
  {
    $project: {
      _id: 0,
      mentor: {
        id: "$Id_Mentor",
        nombre: "$Nombre_Completo",
        especializacion: "$Area_Especializacion",
        experiencia: "$Años_Experiencia",
        tipo_mentoria: "$Tipo_Mentoria"
      },
      sesiones: {
        $map: {
          input: "$sesiones",
          as: "sesion",
          in: {
            fecha: "$$sesion.Fecha_Sesion",
            duracion: "$$sesion.Duracion",
            tipo: "$$sesion.Tipo_Sesion",
            objetivo: "$$sesion.Objetivo",
            emprendedor: {
              $let: {
                vars: {
                  emprendedor: {
                    $arrayElemAt: [
                      {
                        $filter: {
                          input: "$emprendedores_mentoreados",
                          cond: { $eq: ["$$this.Id_Emprendedor", "$$sesion.Id_Emprendedor"] }
                        }
                      },
                      0
                    ]
                  }
                },
                in: "$$emprendedor.Nombre_Completo"
              }
            }
          }
        }
      }
    }
  }
])
```

### 3. Concursos con Participantes y Organizaciones

```javascript
// Consulta que anida concursos con información de participantes
db.concurso.aggregate([
  {
    $lookup: {
      from: "emprendedor",
      pipeline: [
        {
          $lookup: {
            from: "negocio",
            localField: "Id_Emprendedor",
            foreignField: "Id_Emprendedor",
            as: "negocio"
          }
        }
      ],
      as: "participantes_potenciales"
    }
  },
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
      concurso: {
        id: "$Id_Concurso",
        nombre: "$Nombre_Concurso",
        descripcion: "$Descripcion_Concurso",
        fecha_lanzamiento: "$Fecha_Lanzamiento",
        fecha_cierre: "$Fecha_Cierre",
        tema: "$Tema_Concurso",
        estado: "$Estado_Concurso",
        premios: "$Premios_Ofrecidos"
      },
      organizacion: {
        nombre: { $arrayElemAt: ["$organizacion.Nombre_Organizacion", 0] },
        tipo: { $arrayElemAt: ["$organizacion.Tipo_Organizacion", 0] }
      },
      participantes: {
        $map: {
          input: "$participantes_potenciales",
          as: "participante",
          in: {
            nombre: "$$participante.Nombre_Completo",
            tipo_emprendimiento: "$$participante.Tipo_Emprendimiento",
            negocio: {
              $arrayElemAt: ["$$participante.negocio.Nombre_Negocio", 0]
            }
          }
        }
      }
    }
  }
])
```

### 4. Análisis de Capital por Categoría de Negocio

```javascript
// Consulta que agrupa negocios por categoría y calcula estadísticas
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
      _id: { $arrayElemAt: ["$categoria.Nombre_Categoria", 0] },
      total_negocios: { $sum: 1 },
      capital_total: { $sum: { $toDouble: "$Capital_Recibido" } },
      capital_promedio: { $avg: { $toDouble: "$Capital_Recibido" } },
      capital_maximo: { $max: { $toDouble: "$Capital_Recibido" } },
      capital_minimo: { $min: { $toDouble: "$Capital_Recibido" } },
      negocios: {
        $push: {
          nombre: "$Nombre_Negocio",
          capital: { $toDouble: "$Capital_Recibido" },
          tipo: "$Tipo_Negocio",
          estado: "$Estado_Negocio"
        }
      }
    }
  },
  {
    $project: {
      _id: 0,
      categoria: "$_id",
      estadisticas: {
        total_negocios: "$total_negocios",
        capital_total: "$capital_total",
        capital_promedio: { $round: ["$capital_promedio", 2] },
        capital_maximo: "$capital_maximo",
        capital_minimo: "$capital_minimo"
      },
      negocios: "$negocios"
    }
  },
  {
    $sort: { "estadisticas.capital_total": -1 }
  }
])
```

### 5. Emprendedores con Historial Completo de Mentorías

```javascript
// Consulta que anida emprendedores con su historial completo de mentorías
db.emprendedor.aggregate([
  {
    $lookup: {
      from: "sesion_mentoria",
      localField: "Id_Emprendedor",
      foreignField: "Id_Emprendedor",
      as: "sesiones"
    }
  },
  {
    $lookup: {
      from: "mentor",
      localField: "sesiones.Id_Mentor",
      foreignField: "Id_Mentor",
      as: "mentores"
    }
  },
  {
    $lookup: {
      from: "negocio",
      localField: "Id_Emprendedor",
      foreignField: "Id_Emprendedor",
      as: "negocio"
    }
  },
  {
    $project: {
      _id: 0,
      emprendedor: {
        id: "$Id_Emprendedor",
        nombre: "$Nombre_Completo",
        tipo_emprendimiento: "$Tipo_Emprendimiento",
        estado: "$Estado_Emprendimiento",
        fecha_registro: "$Fecha_Registro"
      },
      negocio: {
        $arrayElemAt: [{
          nombre: "$negocio.Nombre_Negocio",
          descripcion: "$negocio.Descripcion_Negocio",
          capital: "$negocio.Capital_Recibido",
          estado: "$negocio.Estado_Negocio"
        }, 0]
      },
      historial_mentorias: {
        $map: {
          input: "$sesiones",
          as: "sesion",
          in: {
            fecha: "$$sesion.Fecha_Sesion",
            duracion: "$$sesion.Duracion",
            tipo: "$$sesion.Tipo_Sesion",
            objetivo: "$$sesion.Objetivo",
            tema: "$$sesion.Tema_Trata",
            comentarios: "$$sesion.Comentarios_FinSesion",
            mentor: {
              $let: {
                vars: {
                  mentor: {
                    $arrayElemAt: [
                      {
                        $filter: {
                          input: "$mentores",
                          cond: { $eq: ["$$this.Id_Mentor", "$$sesion.Id_Mentor"] }
                        }
                      },
                      0
                    ]
                  }
                },
                in: {
                  nombre: "$$mentor.Nombre_Completo",
                  especializacion: "$$mentor.Area_Especializacion",
                  experiencia: "$$mentor.Años_Experiencia"
                }
              }
            }
          }
        }
      },
      total_sesiones: { $size: "$sesiones" }
    }
  },
  {
    $sort: { "total_sesiones": -1 }
  }
])
```

### 6. Análisis de Efectividad de Mentorías por Especialización

```javascript
// Consulta que analiza la efectividad de mentorías por especialización
db.mentor.aggregate([
  {
    $lookup: {
      from: "sesion_mentoria",
      localField: "Id_Mentor",
      foreignField: "Id_Mentor",
      as: "sesiones"
    }
  },
  {
    $lookup: {
      from: "emprendedor",
      localField: "sesiones.Id_Emprendedor",
      foreignField: "Id_Emprendedor",
      as: "emprendedores"
    }
  },
  {
    $group: {
      _id: "$Area_Especializacion",
      mentores: {
        $push: {
          nombre: "$Nombre_Completo",
          experiencia: "$Años_Experiencia",
          tipo_mentoria: "$Tipo_Mentoria",
          total_sesiones: { $size: "$sesiones" }
        }
      },
      total_sesiones: { $sum: { $size: "$sesiones" } },
      promedio_experiencia: { $avg: "$Años_Experiencia" },
      tipos_emprendimiento: {
        $addToSet: "$emprendedores.Tipo_Emprendimiento"
      }
    }
  },
  {
    $project: {
      _id: 0,
      especializacion: "$_id",
      estadisticas: {
        total_mentores: { $size: "$mentores" },
        total_sesiones: "$total_sesiones",
        promedio_experiencia: { $round: ["$promedio_experiencia", 1] },
        tipos_emprendimiento: { $size: "$tipos_emprendimiento" }
      },
      mentores: "$mentores"
    }
  },
  {
    $sort: { "estadisticas.total_sesiones": -1 }
  }
])
```

### 7. Dashboard Completo de RurInnova

```javascript
// Consulta que crea un dashboard completo con todas las métricas importantes
db.emprendedor.aggregate([
  {
    $facet: {
      "resumen_general": [
        {
          $group: {
            _id: null,
            total_emprendedores: { $sum: 1 },
            emprendedores_activos: {
              $sum: { $cond: [{ $eq: ["$Estado_Emprendimiento", "Activo"] }, 1, 0] }
            },
            tipos_emprendimiento: { $addToSet: "$Tipo_Emprendimiento" }
          }
        }
      ],
      "negocios_por_distrito": [
        {
          $lookup: {
            from: "negocio",
            localField: "Id_Emprendedor",
            foreignField: "Id_Emprendedor",
            as: "negocio"
          }
        },
        {
          $group: {
            _id: "$Distrito_Residencia",
            total_negocios: { $sum: 1 },
            capital_total: {
              $sum: { $toDouble: { $arrayElemAt: ["$negocio.Capital_Recibido", 0] } }
            }
          }
        }
      ],
      "mentorias_por_mes": [
        {
          $lookup: {
            from: "sesion_mentoria",
            localField: "Id_Emprendedor",
            foreignField: "Id_Emprendedor",
            as: "sesiones"
          }
        },
        {
          $unwind: "$sesiones"
        },
        {
          $group: {
            _id: {
              $dateToString: {
                format: "%Y-%m",
                date: { $dateFromString: { dateString: "$sesiones.Fecha_Sesion" } }
              }
            },
            total_sesiones: { $sum: 1 },
            duracion_promedio: { $avg: { $toInt: { $substr: ["$sesiones.Duracion", 0, 2] } } }
          }
        }
      ],
      "capacitaciones_por_estado": [
        {
          $lookup: {
            from: "capacitacion",
            localField: "Id_Emprendedor",
            foreignField: "Id_Emprendedor",
            as: "capacitaciones"
          }
        },
        {
          $unwind: "$capacitaciones"
        },
        {
          $group: {
            _id: "$capacitaciones.Estado_Capacitacion",
            total_capacitaciones: { $sum: 1 },
            duracion_promedio: { $avg: "$capacitaciones.Duracion_Horas" }
          }
        }
      ]
    }
  },
  {
    $project: {
      dashboard: {
        resumen_general: { $arrayElemAt: ["$resumen_general", 0] },
        negocios_por_distrito: "$negocios_por_distrito",
        mentorias_por_mes: "$mentorias_por_mes",
        capacitaciones_por_estado: "$capacitaciones_por_estado"
      }
    }
  }
])
```

## Consultas de Análisis Avanzado

### 8. Predicción de Éxito de Emprendimientos

```javascript
// Consulta que analiza factores que contribuyen al éxito de emprendimientos
db.emprendedor.aggregate([
  {
    $lookup: {
      from: "negocio",
      localField: "Id_Emprendedor",
      foreignField: "Id_Emprendedor",
      as: "negocio"
    }
  },
  {
    $lookup: {
      from: "sesion_mentoria",
      localField: "Id_Emprendedor",
      foreignField: "Id_Emprendedor",
      as: "sesiones"
    }
  },
  {
    $lookup: {
      from: "capacitacion",
      localField: "Id_Emprendedor",
      foreignField: "Id_Emprendedor",
      as: "capacitaciones"
    }
  },
  {
    $project: {
      _id: 0,
      emprendedor: {
        nombre: "$Nombre_Completo",
        tipo: "$Tipo_Emprendimiento",
        distrito: "$Distrito_Residencia"
      },
      negocio: {
        nombre: { $arrayElemAt: ["$negocio.Nombre_Negocio", 0] },
        capital: { $toDouble: { $arrayElemAt: ["$negocio.Capital_Recibido", 0] } },
        estado: { $arrayElemAt: ["$negocio.Estado_Negocio", 0] }
      },
      metricas_mentoria: {
        total_sesiones: { $size: "$sesiones" },
        sesiones_virtuales: {
          $size: {
            $filter: {
              input: "$sesiones",
              cond: { $eq: ["$$this.Tipo_Sesion", "Virtual"] }
            }
          }
        },
        sesiones_presenciales: {
          $size: {
            $filter: {
              input: "$sesiones",
              cond: { $eq: ["$$this.Tipo_Sesion", "Presencial"] }
            }
          }
        }
      },
      metricas_capacitacion: {
        total_capacitaciones: { $size: "$capacitaciones" },
        capacitaciones_completadas: {
          $size: {
            $filter: {
              input: "$capacitaciones",
              cond: { $eq: ["$$this.Estado_Capacitacion", "Completada"] }
            }
          }
        }
      },
      factor_exito: {
        $cond: [
          {
            $and: [
              { $gte: [{ $size: "$sesiones" }, 3] },
              { $gte: [{ $toDouble: { $arrayElemAt: ["$negocio.Capital_Recibido", 0] } }, 5000] },
              { $gte: [{ $size: "$capacitaciones" }, 2] }
            ]
          },
          "Alto",
          {
            $cond: [
              { $or: [
                { $gte: [{ $size: "$sesiones" }, 2] },
                { $gte: [{ $toDouble: { $arrayElemAt: ["$negocio.Capital_Recibido", 0] } }, 3000] },
                { $gte: [{ $size: "$capacitaciones" }, 1] }
              ]},
              "Medio",
              "Bajo"
            ]
          }
        ]
      }
    }
  },
  {
    $sort: { "factor_exito": 1, "metricas_mentoria.total_sesiones": -1 }
  }
])
```

### 9. Análisis de Capacitaciones y Cursos

```javascript
// Consulta que analiza la relación entre capacitaciones y cursos
db.capacitacion.aggregate([
  {
    $lookup: {
      from: "curso",
      localField: "Id_Capacitacion",
      foreignField: "Id_Capacitacion",
      as: "cursos"
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
      capacitacion: {
        id: "$Id_Capacitacion",
        nombre: "$Nombre_Capacitacion",
        tipo: "$Tipo_Capacitacion",
        estado: "$Estado_Capacitacion",
        duracion: "$Duracion_Horas"
      },
      emprendedor: {
        nombre: { $arrayElemAt: ["$emprendedor.Nombre_Completo", 0] },
        tipo: { $arrayElemAt: ["$emprendedor.Tipo_Emprendimiento", 0] }
      },
      cursos: {
        $map: {
          input: "$cursos",
          as: "curso",
          in: {
            nombre: "$$curso.Nombre_Curso",
            tipo: "$$curso.Tipo_Curso",
            duracion: "$$curso.Duracion_Curso"
          }
        }
      },
      total_cursos: { $size: "$cursos" }
    }
  },
  {
    $sort: { "total_cursos": -1, "capacitacion.duracion": -1 }
  }
])
```

### 10. Análisis de Feedback y Satisfacción

```javascript
// Consulta que analiza el feedback de los emprendedores
db.feedback.aggregate([
  {
    $lookup: {
      from: "emprendedor",
      localField: "Id_Emprendedor",
      foreignField: "Id_Emprendedor",
      as: "emprendedor"
    }
  },
  {
    $lookup: {
      from: "capacitacion",
      localField: "Id_Capacitacion",
      foreignField: "Id_Capacitacion",
      as: "capacitacion"
    }
  },
  {
    $group: {
      _id: "$Tipo_Feedback",
      total_feedbacks: { $sum: 1 },
      calificacion_promedio: { $avg: "$Calificacion" },
      calificacion_maxima: { $max: "$Calificacion" },
      calificacion_minima: { $min: "$Calificacion" },
      emprendedores: {
        $addToSet: { $arrayElemAt: ["$emprendedor.Nombre_Completo", 0] }
      },
      capacitaciones: {
        $addToSet: { $arrayElemAt: ["$capacitacion.Nombre_Capacitacion", 0] }
      }
    }
  },
  {
    $project: {
      _id: 0,
      tipo_feedback: "$_id",
      estadisticas: {
        total_feedbacks: "$total_feedbacks",
        calificacion_promedio: { $round: ["$calificacion_promedio", 2] },
        calificacion_maxima: "$calificacion_maxima",
        calificacion_minima: "$calificacion_minima"
      },
      participantes: {
        total_emprendedores: { $size: "$emprendedores" },
        total_capacitaciones: { $size: "$capacitaciones" }
      }
    }
  },
  {
    $sort: { "estadisticas.calificacion_promedio": -1 }
  }
])
```

## Notas Importantes

1. **Formato de Fechas**: Los datos CSV contienen fechas en formato YYYY-MM-DD, que MongoDB puede procesar directamente.

2. **Conversión de Tipos**: Algunos campos numéricos pueden necesitar conversión usando `$toInt` o `$toDouble`.

3. **Índices Recomendados**: Para mejorar el rendimiento, crear índices en los campos de relación:
   ```javascript
   db.emprendedor.createIndex({ "Id_Usuario": 1 })
   db.negocio.createIndex({ "Id_Emprendedor": 1 })
   db.sesion_mentoria.createIndex({ "Id_Mentor": 1, "Id_Emprendedor": 1 })
   db.capacitacion.createIndex({ "Id_Emprendedor": 1 })
   db.curso.createIndex({ "Id_Capacitacion": 1 })
   db.feedback.createIndex({ "Id_Emprendedor": 1 })
   ```

4. **Validación de Datos**: Antes de ejecutar las consultas, verificar que los datos se hayan importado correctamente:
   ```javascript
   db.emprendedor.countDocuments()
   db.negocio.countDocuments()
   db.mentor.countDocuments()
   db.capacitacion.countDocuments()
   db.feedback.countDocuments()
   ```

5. **Estructura de Colecciones**: Todas las colecciones están en singular:
   - `usuario`, `emprendedor`, `negocio`, `mentor`, `concurso`
   - `sesion_mentoria`, `categoria_negocio`, `capacitacion`, `curso`
   - `feedback`, `historico_emprendimiento`, `direccion`, `facturacion`

## Uso de las Consultas

1. **Ejecutar en mongosh**: Copiar y pegar las consultas directamente en la consola de mongosh.

2. **Exportar Resultados**: Para exportar resultados a JSON:
   ```javascript
   // Ejemplo: Exportar dashboard completo
   db.emprendedor.aggregate([...]).forEach(printjson)
   ```

3. **Guardar Consultas**: Las consultas pueden guardarse en archivos .js y ejecutarse con:
   ```bash
   mongosh "mongodb://localhost:27017/rurInnova" --file consulta.js
   ```

4. **Colecciones Excluidas**: No se incluyen consultas para `redes_sociales`, `recursos` y `premios_concurso` según especificación. 