-- Purpose: Calculate the average Engine RPM for different coolant temperature ranges to analyze the relationship between engine speed and cooling efficiency.
WITH TempRanges AS (
    SELECT 
        CASE 
            WHEN CoolantTemp_F < 150 THEN 'Low'
            WHEN CoolantTemp_F BETWEEN 150 AND 200 THEN 'Medium'
        END AS TempRange,
        EngineRPM
    FROM CarDataLog
)
SELECT TempRange, AVG(EngineRPM) AS avg_rpm
FROM TempRanges
GROUP BY TempRange
ORDER BY TempRange;


-- Purpose: Determine which engine load range occurs most frequently to understand typical engine load conditions.
SELECT LoadRange, COUNT(*) AS Frequency
FROM (
    SELECT 
        CASE 
            WHEN EngineLoadPercent < 30 THEN 'Low'
            WHEN EngineLoadPercent BETWEEN 30 AND 70 THEN 'Moderate'
            ELSE 'High'
        END AS LoadRange
    FROM CarDataLog
) AS LoadCategories
GROUP BY LoadRange
ORDER BY Frequency DESC
LIMIT 1;

-- Purpose: Identify time intervals with high RPM and engine load to spot moments of high engine demand.

SELECT Time_s, EngineRPM, EngineLoadPercent
FROM CarDataLog
WHERE EngineRPM > 2500 AND EngineLoadPercent > 65
ORDER BY Time_s;

-- Purpose: Analyze the relationship between average fuel level and coolant temperature across different engine load categories.
SELECT 
    CASE 
        WHEN EngineLoadPercent < 30 THEN 'Low Load'
        WHEN EngineLoadPercent BETWEEN 30 AND 70 THEN 'Moderate Load'
        ELSE 'High Load'
    END AS LoadCategory,
    AVG(FuelLevelPercent) AS avg_fuel_level,
    AVG(CoolantTemp_F) AS avg_coolant_temp
FROM CarDataLog
GROUP BY LoadCategory
ORDER BY avg_coolant_temp DESC;

-- Purpose: Calculate rolling average of fuel level to observe changes over time.
WITH RollingFuelAvg AS (
    SELECT 
        Time_s,
        FuelLevelPercent,
        AVG(FuelLevelPercent) OVER (ORDER BY Time_s ROWS BETWEEN 4 PRECEDING AND CURRENT ROW) AS rolling_avg_fuel
    FROM CarDataLog
)
SELECT Time_s, FuelLevelPercent, rolling_avg_fuel
FROM RollingFuelAvg
ORDER BY Time_s
LIMIT 100; 

SELECT * FROM CarDataLog cdl 
