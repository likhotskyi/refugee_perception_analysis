# Ukrainian Refugees in the EU: Economic Reality vs Public Perception

**SQL & Power BI analysis exploring whether negative attitudes toward Ukrainian refugees correlate with actual refugee numbers or economic impact.**

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=flat&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=flat&logo=powerbi&logoColor=black)
![Excel](https://img.shields.io/badge/Excel-217346?style=flat&logo=microsoftexcel&logoColor=white)

---

## Research Question

> Do countries with more Ukrainian refugees actually have worse economies — or is the negative perception just not backed by data?

## Key Finding

**Pearson correlation = 0.30 (weak)**

Refugee numbers do not strongly predict negative perception. Countries with the highest refugee burden often show the lowest negativity.

| Metric | Value |
|--------|-------|
| Countries analyzed | 27 (EU) |
| Time period | 2022–2024 |
| Correlation (refugees ↔ negativity) | 0.30 (weak) |
| Avg negative perception (2024) | 13.4% |

---

## Main Insights

**1. High refugees ≠ high negativity**
- Latvia: 25 refugees per 1,000 → only 6% negative
- Poland: 26 per 1,000 → 14% negative

**2. Low refugees ≠ low negativity**
- Bulgaria: 11 per 1,000 → 30% negative
- Romania: 9 per 1,000 → 26% negative

**3. Economy is not the issue**
- High-refugee countries: 2.6% inflation, +1.8% GDP
- Low-refugee countries: 2.9% inflation, +1.8% GDP

**4. Proximity to Ukraine helps acceptance**
- Poland, Latvia, Lithuania show high acceptance despite high burden

---

## Data Sources

| Dataset | Source | Records |
|---------|--------|---------|
| Refugees | [UNHCR](https://data.unhcr.org/) | 81 |
| Public Perception | [Eurobarometer](https://europa.eu/eurobarometer/) EB97, EB99, STD101 | 81 |
| GDP & Inflation | [Eurostat](https://ec.europa.eu/eurostat/) | 162 |

**Perception metric:** % responding "Disagree" or "Totally disagree" to *"Welcoming in the EU people fleeing the war"*

---

## Project Structure

```
├── data/                   # CSV files (countries, refugees, perception, economic)
├── sql/                    # 8 SQL queries (create tables + analysis)
├── powerbi/                # Power BI dashboard (.pbix)
├── dashboard/              # Dashboard export (PDF)
├── reports/                # Final analysis report (PDF)
└── README.md
```

---

## SQL Queries

1. `01_create_tables.sql` — Database schema
2. `02_refugees_per_capita.sql` — Top countries by refugee burden
3. `03_negative_perception.sql` — Top countries by negativity
4. `04_main_join.sql` — All metrics combined
5. `05_negativity_vs_growth.sql` — High negativity but growing GDP
6. `06_economic_by_refugee_level.sql` — Inflation/GDP by refugee level
7. `07_perception_trend.sql` — Trend over years
8. `08_pearson_correlation.sql` — Statistical correlation

---

## Limitations

- **Correlation ≠ causation** — patterns identified, not causes proven
- **3 years of data** — long-term trends unknown
- **Survey limitations** — stated attitudes may differ from behavior
- **Country-level data** — hides regional and demographic variation

---

## Tools Used

- **PostgreSQL** — data storage, SQL analysis, correlation calculation
- **Power BI** — interactive dashboard, visualizations
- **Excel** — initial data cleaning

---

## Author

**Vasyl Likhotskyi**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/vasyl-likhotskyi-89b1a83b5)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=flat&logo=github&logoColor=white)](https://github.com/likhotskyi)
