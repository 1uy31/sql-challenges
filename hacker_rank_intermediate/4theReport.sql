-- https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true
SELECT
CASE
    WHEN g.Grade >= 8 THEN s.Name
    ELSE null  -- If Grade < 8, use null as Name
END as Name, g.Grade, s.Marks
FROM Students s
JOIN Grades g ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
ORDER BY g.Grade DESC,
(CASE
    WHEN g.Grade >= 8 THEN Name
    ELSE s.Marks  -- If Grade < 8, order by Grade and Marks
END) ASC;
