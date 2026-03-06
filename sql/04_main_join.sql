-- Main JOIN - all metrics in one table

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
