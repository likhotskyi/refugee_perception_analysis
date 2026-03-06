-- Top countries by negative perception (2024)

SELECT 
    country,
    disagree_pct
FROM perception
WHERE year = 2024
ORDER BY disagree_pct DESC
LIMIT 10;
