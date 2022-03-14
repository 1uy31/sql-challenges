-- https://www.hackerrank.com/challenges/occupations/problem?isFullScreen=true
SELECT
MIN(CASE WHEN Occupation = 'Doctor' THEN Name ELSE NULL END),
MIN(CASE WHEN Occupation = 'Professor' THEN Name ELSE NULL END),
MIN(CASE WHEN Occupation = 'Singer' THEN Name ELSE NULL END),
MIN(CASE WHEN Occupation = 'Actor' THEN Name ELSE NULL END)
FROM (
    SELECT Name, Occupation, ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS rowNumber
    FROM Occupations
) AS temp
GROUP BY rowNumber;
