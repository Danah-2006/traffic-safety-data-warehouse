-- ==========================================================
-- 1. Star Schema (Tables Definition)
-- ==========================================================

CREATE TABLE DIM_Date (
    Date_ID INT PRIMARY KEY,
    gregorian_date DATE,
    year INT,
    month INT,
    day INT
);

CREATE TABLE DIM_Location (
    Location_ID INT PRIMARY KEY,
    region_name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE DIM_Accident (
    Accident_ID INT PRIMARY KEY,
    accident_type VARCHAR(100),
    injured_flag VARCHAR(10)
);

CREATE TABLE FACT_Accidents (
    Fact_ID INT PRIMARY KEY,
    Date_ID INT,
    Location_ID INT,
    Accident_ID INT,
    total_injuries INT,
    total_deaths INT,
    number_of_vehicles INT,
    FOREIGN KEY (Date_ID) REFERENCES DIM_Date(Date_ID),
    FOREIGN KEY (Location_ID) REFERENCES DIM_Location(Location_ID),
    FOREIGN KEY (Accident_ID) REFERENCES DIM_Accident(Accident_ID)
);

-- ==========================================================
-- 2. Analytical OLAP Queries
-- ==========================================================

-- Query 1: Total Injuries per City
SELECT 
    L.city,
    SUM(F.total_injuries) AS Total_Injuries
FROM FACT_Accidents F
JOIN DIM_Location L ON F.Location_ID = L.Location_ID
GROUP BY L.city
ORDER BY Total_Injuries DESC;

-- Query 2: Total Deaths per Accident Type
SELECT 
    A.accident_type,
    SUM(F.total_deaths) AS Total_Deaths
FROM FACT_Accidents F
JOIN DIM_Accident A ON F.Accident_ID = A.Accident_ID
GROUP BY A.accident_type
ORDER BY Total_Deaths DESC;

-- Query 3: Accidents Trend by Month
SELECT 
    D.month,
    COUNT(F.Fact_ID) AS Total_Accidents
FROM FACT_Accidents F
JOIN DIM_Date D ON F.Date_ID = D.Date_ID
GROUP BY D.month
ORDER BY Total_Accidents DESC;

-- Query 4: Total Vehicles Involved per City
SELECT 
    L.city,
    SUM(F.number_of_vehicles) AS Total_Vehicles
FROM FACT_Accidents F
JOIN DIM_Location L ON F.Location_ID = L.Location_ID
GROUP BY L.city
ORDER BY Total_Vehicles DESC;