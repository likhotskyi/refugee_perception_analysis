-- How perception changed over time

SELECT 
    year,
    ROUND(AVG(disagree_pct), 1) AS avg_disagree,
    MIN(disagree_pct) AS min_disagree,
    MAX(disagree_pct) AS max_disagree
FROM perception
GROUP BY year
ORDER BY year;
