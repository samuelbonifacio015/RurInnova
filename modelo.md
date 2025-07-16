# CASO 2: PLATAFORMA DE EVENTOS DEPORTIVOS "SPORTEVENT"

## Descripción del Negocio

Una empresa colombiana llamada "SportEvent" se dedica a la organización y gestión de eventos deportivos a nivel nacional. La empresa conecta organizadores de eventos con patrocinadores y ofrece servicios de logística para la realización de competencias deportivas de diferentes disciplinas.

### Servicios Principales:

1. **Gestión de Eventos Deportivos:** La empresa administra un sistema de seguimiento de eventos a través de un "documento de evento" que incluye:
   - Número de evento
   - Fecha de realización
   - Cantidad de participantes registrados
   - Código del evento
   - Descripción del evento
   - Disciplina deportiva
   - Número de identificación del organizador
   - Nombre del organizador
   - Dirección del organizador
   - Ciudad del organizador

2. **Sistema de Patrocinadores:** La empresa trabaja con patrocinadores especializados. Para cada patrocinador se conoce:
   - Código del patrocinador
   - Nombre del patrocinador
   - Dirección del patrocinador
   - Tipo de patrocinio ofrecido (que puede ser equipamiento, bebidas, tecnología o vestuario)

Cuando la plataforma asigna un patrocinador a un evento, se genera un "contrato de patrocinio" que incluye:
   - Código del patrocinador
   - Nombre del patrocinador
   - Dirección del patrocinador
   - Tipo de producto patrocinado
   - Categoría del patrocinio
   - Valor del patrocinio (en millones de pesos)
   - Duración del contrato (en meses)

## Tareas (Relacionadas con MongoDB):

**a)** Identificar y crear todas las colecciones encontradas en el enunciado en MongoDB. (4 pts.)

**b)** Insertar un mínimo de 5 documentos en cada colección identificada. (4 pts.)

**c)** Escribir una regla de validación JSON Schema para al menos 2 de las colecciones identificadas. (4 pts.)

**d)** Escribir una consulta que permita mostrar todos los eventos donde la cantidad de participantes registrados esté entre 50 y 150 o entre 300 y 500. (4 pts.)

**e)** Escribir una consulta que permita actualizar la dirección del patrocinador siempre que el tipo de patrocinio sea tecnología. (4 pts.)

---

**Instrucciones Finales:**

Todos los resultados deben copiarse a un archivo WORD o PDF y subirse al aula virtual. Esta entrega debe incluir:
- Capturas de pantalla de los resultados.
- Capturas de pantalla de la ventana de código SQL o MongoDB.
- Los códigos ejecutados copiados en formato texto. 