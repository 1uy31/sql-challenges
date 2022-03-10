-- https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true
-- MySQL
SET @totalRow := (SELECT COUNT(1) FROM STATION);
SET @currentRow := 0;

SELECT ROUND(AVG(temp.LAT_N), 4)
FROM (SELECT LAT_N FROM STATION ORDER BY LAT_N) AS temp
WHERE (SELECT @currentRow := @currentRow + 1)
BETWEEN @totalRow/2.0 AND @totalRow/2.0 + 1;

-- PostgreSQL
-- The ROW_NUMBER() function is a window function that assigns a sequential integer to each row in a result set.
--
-- ROW_NUMBER() OVER(
--     [PARTITION BY column_1, column_2,…]
--     [ORDER BY column_3,column_4,…]
-- )
--
-- The set of rows on which the ROW_NUMBER() function operates is called a window.
--
-- The PARTITION BY clause divides the window into smaller sets or partitions.
-- If you specify the PARTITION BY clause, the row number for each partition starts with one and increments by one.
--
-- Because the PARTITION BY clause is optional to the ROW_NUMBER() function, therefore you can omit it,
-- and ROW_NUMBER() function will treat the whole window as a partition.
--
-- The ORDER BY clause inside the OVER clause determines the order in which the numbers are assigned.
WITH orderedLatN as (
  SELECT
      LAT_N,
      row_number() over (ORDER BY LAT_N) as rowId,
      (SELCT COUNT(1) FROM STATION) as totalRow
  FROM STATION
) SELECT AVG(LAT_N) as median FROM orderedLatN WHERE rowId between totalRow/2.0 and totalRow/2.0 + 1
