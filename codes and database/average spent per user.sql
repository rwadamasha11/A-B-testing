WITH total_per_user AS (
SELECT uid, SUM(spent) AS total_spent
FROM activity
GROUP BY uid
)
SELECT g."group", AVG(COALESCE(total_spent, 0))
FROM groups g
LEFT JOIN total_per_user a ON g.uid = a.uid
GROUP BY g."group";
