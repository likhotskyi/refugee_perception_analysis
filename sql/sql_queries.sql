-- Ukrainian Refugees Analysis - SQL Queries
-- PostgreSQL

-- Table creation

CREATE TABLE countries (
    country_name VARCHAR(100) PRIMARY KEY,
    iso_code CHAR(2),
    region VARCHAR(50),
    population_millions DECIMAL(5,2)
);

CREATE TABLE refugees (
    year INTEGER,
    country VARCHAR(100),
    refugee_count INTEGER,
    population_millions DECIMAL(5,2),
    refugees_per_1000 DECIMAL(6,2),
    PRIMARY KEY (year, country)
);

CREATE TABLE perception (
    year INTEGER,
    country VARCHAR(100),
    disagree_pct DECIMAL(5,2),
    PRIMARY KEY (year, country)
);

CREATE TABLE economic_indicators (
    year INTEGER,
    country VARCHAR(100),
    gdp_growth_pct DECIMAL(5,2),
    inflation_rate DECIMAL(5,2),
    PRIMARY KEY (year, country)
);


-- 1. Top countries by refugees per capita (2024)

SELECT 
    country,
    refugee_count,
    refugees_per_1000
FROM refugees
WHERE year = 2024
ORDER BY refugees_per_1000 DESC
LIMIT 10;


-- 2. Top countries by negative perception (2024)

SELECT 
    country,
    disagree_pct
FROM perception
WHERE year = 2024
ORDER BY disagree_pct DESC
LIMIT 10;


-- 3. Main JOIN - all metrics in one table

SELECT 
    r.country,
    r.year,
    r.refugees_per_1000,
    p.disagree_pct,
    e.gdp_growth_pct,
    e.inflation_rate
FROM refugees r
JOIN perception p ON r.country = p.country AND r.year = p.year
JOIN economic_indicators e ON r.country = e.country AND r.year = e.year
ORDER BY r.country, r.year;


-- 4. Countries with high negativity but growing economy
-- challenges the "economic anxiety" explanation

SELECT 
    r.country,
    p.disagree_pct,
    e.gdp_growth_pct,
    r.refugees_per_1000
FROM refugees r
JOIN perception p ON r.country = p.country AND r.year = p.year
JOIN economic_indicators e ON r.country = e.country AND r.year = e.year
WHERE r.year = 2024
  AND p.disagree_pct > 15
  AND e.gdp_growth_pct > 0
ORDER BY p.disagree_pct DESC;


-- 5. Economic indicators grouped by refugee level

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


-- 6. How perception changed over time

SELECT 
    year,
    ROUND(AVG(disagree_pct), 1) AS avg_disagree,
    MIN(disagree_pct) AS min_disagree,
    MAX(disagree_pct) AS max_disagree
FROM perception
GROUP BY year
ORDER BY year;


-- 7. Pearson correlation between refugees and negative perception

SELECT 
    ROUND(
        CORR(r.refugees_per_1000, p.disagree_pct)::numeric, 
        3
    ) AS pearson_correlation
FROM refugees r
JOIN perception p ON r.country = p.country AND r.year = p.year
WHERE r.year = 2024;

-- result: 0.301 (weak) — refugee numbers don't predict negative perception
