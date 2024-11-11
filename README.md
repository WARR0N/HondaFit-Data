# HondaFit-Data
SQL Data Analysis of Honda Fit Engine Performance and Fuel Efficiency
Project Goals:
The goal of this project is to analyze the performance and efficiency of a Honda Fit based on data related to engine RPM, coolant temperature, engine load, and fuel levels. The analysis aims to uncover patterns and correlations in engine behavior and fuel consumption under various operating conditions.

Key objectives:

Engine RPM Analysis: Investigate how engine RPM changes with different coolant temperature ranges, and assess the relationship between engine speed and cooling efficiency.
Engine Load Analysis: Identify which engine load range occurs most frequently to understand typical driving behavior.
High Load Events: Find specific time intervals with high engine RPM and load to identify moments of high engine demand.
Fuel and Load Correlation: Analyze the relationship between fuel level and coolant temperature across different engine load categories.
Fuel Consumption Trends: Track changes in fuel level over time to understand fuel consumption patterns.
Data Structure Overview:
The dataset consists of data points related to the operation of the Honda Fit, captured over time. Below is an overview of the main columns in the dataset:

Time_s: The timestamp (in seconds) of when the data was recorded.
EngineRPM: The engine's revolutions per minute (RPM), indicating the engine speed.
EngineLoadPercent: The percentage of engine load, representing how much load the engine is under at a given time.
CoolantTemp_F: The temperature of the engine coolant, measured in degrees Fahrenheit.
FuelLevelPercent: The fuel level as a percentage, showing how much fuel remains in the vehicle’s tank.
Relationships:

EngineRPM, EngineLoadPercent, and CoolantTemp_F are direct indicators of engine performance and efficiency under different conditions.
FuelLevelPercent is influenced by engine load and RPM, providing insights into fuel consumption trends.
Time_s provides a temporal context, allowing analysis of how these parameters change over time.
Summary of SQL Queries and Key Insights:
1. Average Engine RPM for Coolant Temperature Ranges:
Query: Calculated the average engine RPM for different coolant temperature ranges (Low, Medium, High).
Key Insight: The average RPM is highest when the coolant temperature is in the Medium range (~2154 RPM), indicating more optimal engine performance at moderate temperatures. The lowest RPM occurs in the Low temperature range (~1522 RPM), which may indicate less optimal operating conditions.
2. Most Frequent Engine Load Range:
Query: Determined the most frequent engine load range (Low, Moderate, High).
Key Insight: The Moderate engine load range occurs most frequently, suggesting that the engine is typically used under moderate load conditions, which could be representative of regular driving.
3. Time Intervals with High RPM and High Engine Load:
Query: Identified time intervals where both engine RPM and load exceeded threshold values (2500 RPM and 65% load).
Key Insight: High RPM and load events are indicative of periods of high engine demand. These events are crucial for understanding the behavior of the engine under stress, such as during rapid acceleration or when carrying heavy loads.
4. Fuel Level and Coolant Temperature Across Load Categories:
Query: Analyzed the relationship between average fuel level and coolant temperature under different engine load categories (Low, Moderate, High).
Key Insight: The average fuel level is slightly higher under Low Load conditions (around 35.32%), which may indicate that the engine is consuming less fuel under lighter loads compared to higher loads, where fuel consumption tends to increase.
5. Rolling Average of Fuel Level:
Query: Calculated the rolling average of fuel level over time to observe fuel consumption trends.
Key Insight: The rolling average helps to smooth out short-term fluctuations, revealing trends in fuel consumption. The fuel level decreases more noticeably in the first 30 seconds, which could be tied to engine warm-up or initial consumption during acceleration.
