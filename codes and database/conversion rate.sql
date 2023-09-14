WITH t1 AS 
(
    SELECT COUNT (id) as num_a, g.group AS ga
    FROM users u
    LEFT JOIN groups g
    ON g.uid = u.id
    WHERE g.group = 'A'
    GROUP BY 2

)
,t2 AS
(
    SELECT COUNT (id) as num_b, g.group AS gb
    FROM users u
    LEFT JOIN groups g
    ON g.uid = u.id
    WHERE g.group = 'B'
    GROUP BY 2
)
, t3 AS 
(
     SELECT COUNT (DISTINCT a.uid) AS aa ,g.group 
    FROM groups g
    LEFT JOIN activity a
    ON a.uid = g.uid
    WHERE g.group = 'A'
    GROUP BY 2

)

,t4 AS 
(
    SELECT COUNT (DISTINCT a.uid) AS bb ,g.group
    FROM groups g
    LEFT JOIN activity a
    ON a.uid = g.uid
    WHERE g.group = 'B'
    GROUP BY 2 
)

SELECT   aa/CAST(num_a AS float) * 100  AS convertion_A , bb/CAST(num_b AS float) * 100  AS convertion_B
FROM t1,t2,t3,t4
