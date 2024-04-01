

-- A. Retrieve all records from the Olympics table.
SELECT * FROM Olympics;

-- B. Retrieve only the Athlete names and the Medals they won.
SELECT name,medal FROM Olympics;

-- C. Count the total number of athletes in the dataset.
SELECT COUNT(DISTINCT name) AS Total_names FROM Olympics;

-- D. Find all records of athletes who won a Gold medal.
SELECT * FROM Olympics WHERE medal = 'Gold';

-- E. List all athletes who won Silver, ordered by the Year they won it. 
SELECT name, medal, year FROM Olympics WHERE Medal = 'Silver' ORDER BY year;

-- F. Count how many Gold, Silver, and Bronze medals each country has won.
SELECT country, medal, COUNT(*) AS medal_count
FROM Olympics 
GROUP BY country, medal;

-- G. Identify countries that have won more than 50 Gold medals.
SELECT country, COUNT(*) AS gold_count 
FROM Olympics 
WHERE medal = 'Gold' 
GROUP BY country 
HAVING gold_count > 50;

-- H. Olympics data with country information to show the total number of medals won by countries with a population over 10 million.
SELECT o.country, COUNT(*) AS medal_count 
FROM Olympics o 
JOIN countries c ON o.country = c.country 
WHERE c.population > 10000000 
GROUP BY o.country;

-- I. Find the athlete who has won the most medals.
SELECT name, COUNT(*) AS medal_count 
FROM Olympics 
GROUP BY name
ORDER BY medal_count DESC 
LIMIT 1;

-- J. List all events that include the term 'Freestyle' in their name.
SELECT DISTINCT Event 
FROM Olympics 
WHERE Event LIKE '%Freestyle%';

-- K. Find the top 3 athletes by the total number of medals won in each sport.
SELECT sport, name, COUNT(*) AS medal_count 
FROM Olympics 
GROUP BY sport, name 
ORDER BY medal_count DESC 
LIMIT 3;

-- L. List athletes who won more than one medal in a single Olympic year.
SELECT name, year, COUNT(*) AS medal_count 
FROM Olympics 
GROUP BY name, year 
HAVING medal_count > 1;

-- M. Identify countries that have won gold medals in both Summer and Winter Olympics.
SELECT country 
FROM Olympics 
GROUP BY country 
HAVING COUNT(DISTINCT Season) = 2 AND SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) > 0;

-- N. Show the year difference between the first and last medal won by each country.
SELECT 
    country,
    MAX(year) - MIN(year) AS year_difference
FROM 
    Olympics
GROUP BY 
    country;
    
-- O. Calculate the average number of medals won per athlete for each country.
SELECT 
    country,
    COUNT(*) / COUNT(DISTINCT name) AS avg_medals_per_athlete
FROM 
    Olympics
GROUP BY 
    country;

















