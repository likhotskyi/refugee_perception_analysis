-- Top countries by refugees per capita (2024)

SELECT 
    country,
    refugee_count,
    refugees_per_1000
FROM refugees
WHERE year = 2024
ORDER BY refugees_per_1000 DESC
LIMIT 10;
