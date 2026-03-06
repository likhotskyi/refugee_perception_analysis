-- Pearson correlation between refugees and negative perception

SELECT 
    ROUND(
        CORR(r.refugees_per_1000, p.disagree_pct)::numeric, 
        3
    ) AS pearson_correlation
FROM refugees r
JOIN perception p ON r.country = p.country AND r.year = p.year
WHERE r.year = 2024;

-- result: 0.301 (weak) — refugee numbers don't predict negative perception
