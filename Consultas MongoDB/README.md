# Consultas MongoDB para RurInnova

## Consultas 

### 1. Emprendedores con Información Completa de Usuario y Negocio

```javascript
// Consulta que anida información de usuario, emprendedor y negocio
db.emprendedores.aggregate([
  {
    $lookup: {
      from: "usuarios",
      localField: "Id_Usuario",
      foreignField: "Id_Usuario",
      as: "usuario"
    }
  },
  {
    $lookup: {
      from: "negocios",
      localField: "Id_Emprendedor",
      foreignField: "Id_Emprendedor",
      as: "negocio"
    }
  },
  {
    $lookup: {
      from: "categorias_negocio",
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
db.mentores.aggregate([
  {
    $lookup: {
      from: "sesiones_mentoria",
      localField: "Id_Mentor",
      foreignField: "Id_Mentor",
      as: "sesiones"
    }
  },
  {
    $lookup: {
      from: "emprendedores",
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
db.concursos.aggregate([
  {
    $lookup: {
      from: "emprendedores",
      pipeline: [
        {
          $lookup: {
            from: "negocios",
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
db.negocios.aggregate([
  {
    $lookup: {
      from: "categorias_negocio",
      localField: "Id_Categoria",
      foreignField: "Id_Categoria",
      as: "categoria"
    }
  },
  {
    $group: {
      _id: { $arrayElemAt: ["$categoria.Nombre_Categoria", 0] },
      total_negocios: { $sum: 1 },
      capital_total: { $sum: { $toInt: "$Capital_Recibido" } },
      capital_promedio: { $avg: { $toInt: "$Capital_Recibido" } },
      capital_maximo: { $max: { $toInt: "$Capital_Recibido" } },
      capital_minimo: { $min: { $toInt: "$Capital_Recibido" } },
      negocios: {
        $push: {
          nombre: "$Nombre_Negocio",
          capital: { $toInt: "$Capital_Recibido" },
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
db.emprendedores.aggregate([
  {
    $lookup: {
      from: "sesiones_mentoria",
      localField: "Id_Emprendedor",
      foreignField: "Id_Emprendedor",
      as: "sesiones"
    }
  },
  {
    $lookup: {
      from: "mentores",
      localField: "sesiones.Id_Mentor",
      foreignField: "Id_Mentor",
      as: "mentores"
    }
  },
  {
    $lookup: {
      from: "negocios",
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
db.mentores.aggregate([
  {
    $lookup: {
      from: "sesiones_mentoria",
      localField: "Id_Mentor",
      foreignField: "Id_Mentor",
      as: "sesiones"
    }
  },
  {
    $lookup: {
      from: "emprendedores",
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
db.emprendedores.aggregate([
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
            from: "negocios",
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
              $sum: { $toInt: { $arrayElemAt: ["$negocio.Capital_Recibido", 0] } }
            }
          }
        }
      ],
      "mentorias_por_mes": [
        {
          $lookup: {
            from: "sesiones_mentoria",
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
            duracion_promedio: { $avg: { $toInt: "$sesiones.Duracion" } }
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
        mentorias_por_mes: "$mentorias_por_mes"
      }
    }
  }
])
```

## Consultas de Análisis Avanzado

### 8. Predicción de Éxito de Emprendimientos

```javascript
// Consulta que analiza factores que contribuyen al éxito de emprendimientos
db.emprendedores.aggregate([
  {
    $lookup: {
      from: "negocios",
      localField: "Id_Emprendedor",
      foreignField: "Id_Emprendedor",
      as: "negocio"
    }
  },
  {
    $lookup: {
      from: "sesiones_mentoria",
      localField: "Id_Emprendedor",
      foreignField: "Id_Emprendedor",
      as: "sesiones"
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
        capital: { $toInt: { $arrayElemAt: ["$negocio.Capital_Recibido", 0] } },
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
      factor_exito: {
        $cond: [
          {
            $and: [
              { $gte: [{ $size: "$sesiones" }, 3] },
              { $gte: [{ $toInt: { $arrayElemAt: ["$negocio.Capital_Recibido", 0] } }, 5000] }
            ]
          },
          "Alto",
          {
            $cond: [
              { $or: [
                { $gte: [{ $size: "$sesiones" }, 2] },
                { $gte: [{ $toInt: { $arrayElemAt: ["$negocio.Capital_Recibido", 0] } }, 3000] }
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

## Notas Importantes

1. **Formato de Fechas**: Los datos CSV contienen fechas en formato YYYY-MM-DD, que MongoDB puede procesar directamente.

2. **Conversión de Tipos**: Algunos campos numéricos pueden necesitar conversión usando `$toInt` o `$toDouble`.

3. **Índices Recomendados**: Para mejorar el rendimiento, crear índices en los campos de relación:
   ```javascript
   db.emprendedores.createIndex({ "Id_Usuario": 1 })
   db.negocios.createIndex({ "Id_Emprendedor": 1 })
   db.sesiones_mentoria.createIndex({ "Id_Mentor": 1, "Id_Emprendedor": 1 })
   ```

4. **Validación de Datos**: Antes de ejecutar las consultas, verificar que los datos se hayan importado correctamente:
   ```javascript
   db.emprendedores.countDocuments()
   db.negocios.countDocuments()
   db.mentores.countDocuments()
   ```

## Uso de las Consultas

1. **Ejecutar en mongosh**: Copiar y pegar las consultas directamente en la consola de mongosh.

2. **Exportar Resultados**: Para exportar resultados a JSON:
   ```javascript
   // Ejemplo: Exportar dashboard completo
   db.emprendedores.aggregate([...]).forEach(printjson)
   ```

3. **Guardar Consultas**: Las consultas pueden guardarse en archivos .js y ejecutarse con:
   ```bash
   mongosh "mongodb://localhost:27017/rurInnova" --file consulta.js
   ``` 
