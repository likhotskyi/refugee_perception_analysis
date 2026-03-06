-- Table creation for Ukrainian Refugees Analysis

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
