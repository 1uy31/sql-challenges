-- https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true
-- MySQL
SET @totalRow := (SELECT COUNT(1) FROM STATION);
SET @currentRow := 0;

SELECT ROUND(AVG(temp.LAT_N), 4)
FROM (SELECT LAT_N FROM STATION ORDER BY LAT_N) AS temp
WHERE (SELECT @currentRow := @currentRow + 1)
BETWEEN @totalRow/2.0 AND @totalRow/2.0 + 1;

-- PostgreSQL
