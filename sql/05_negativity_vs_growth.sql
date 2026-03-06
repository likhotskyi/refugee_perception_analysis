-- Countries with high negativity but growing economy

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
