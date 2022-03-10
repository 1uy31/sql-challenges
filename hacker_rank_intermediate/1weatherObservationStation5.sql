-- https://www.hackerrank.com/challenges/weather-observation-station-5/problem?isFullScreen=true
WITH cityAndItsNameLength as
    (SELECT CITY as City, LENGTH(CITY) as CityNameLength FROM STATION)
    (SELECT City, CityNameLength FROM cityAndItsNameLength ORDER BY CityNameLength ASC, City ASC LIMIT 1)
    UNION
    (SELECT City, CityNameLength FROM cityAndItsNameLength ORDER BY CityNameLength DESC, City ASC LIMIT 1);
