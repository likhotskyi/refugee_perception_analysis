-- Economic indicators grouped by refugee level

SELECT 
    CASE 
        WHEN r.refugees_per_1000 >= 20 THEN 'High (20+)'
        WHEN r.refugees_per_1000 >= 10 THEN 'Medium (10-20)'
        ELSE 'Low (<10)'
    END AS refugee_level,
    ROUND(AVG(e.inflation_rate), 1) AS avg_inflation,
    ROUND(AVG(e.gdp_growth_pct), 1) AS avg_gdp,
    COUNT(*) AS num_countries
FROM refugees r
JOIN economic_indicators e ON r.country = e.country AND r.year = e.year
WHERE r.year = 2024
GROUP BY 
    CASE 
        WHEN r.refugees_per_1000 >= 20 THEN 'High (20+)'
        WHEN r.refugees_per_1000 >= 10 THEN 'Medium (10-20)'
        ELSE 'Low (<10)'
    END
ORDER BY avg_inflation DESC;
