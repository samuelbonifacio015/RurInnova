-- 2) Total de capital recibido y promedio de monto objetivo por categoría de negocio
SELECT
    cn.Nombre_Categoria,
    SUM(n.Capital_Recibido)   AS TotalCapitalRecibido,
    AVG(n.Monto_Objetivo)     AS PromedioMontoObjetivo
FROM
    dbo.Negocio AS n
    INNER JOIN dbo.Categoria_Negocio AS cn
        ON n.Id_Categoria = cn.Id_Categoria
GROUP BY
    cn.Nombre_Categoria
HAVING
    SUM(n.Capital_Recibido) > 0
ORDER BY
    TotalCapitalRecibido DESC;
 --Detalle de los concursos activos y su patrocinador

SELECT
    co.Nombre_Concurso,
    co.Fecha_Cierre,
    op.Nombre_Organizacion
FROM
    dbo.Concurso AS co
    INNER JOIN dbo.Organizacion_Patrocinadora AS op
        ON co.Id_Organizacion = op.Id_Organizacion
WHERE
    co.Fecha_Cierre > GETDATE()
ORDER BY
    co.Fecha_Cierre ASC;


--Usuarios con mayor progreso en capacitaciones
SELECT
    u.Nombre_Usuario,
    COUNT(c.Id_Capacitacion) AS TotalModulosCompletados
FROM
    dbo.Capacitacion AS c
    INNER JOIN dbo.Usuario AS u
        ON c.Id_Usuario = u.Id_Usuario
GROUP BY
    u.Nombre_Usuario
ORDER BY
    TotalModulosCompletados DESC;
