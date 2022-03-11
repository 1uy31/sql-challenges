-- https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true
SELECT hackerId, hackerName FROM (
    SELECT h.hacker_id as hackerId, h.name as hackerName, COUNT(h.hacker_id) as fullScoreNumber
    FROM Hackers h
    LEFT JOIN Submissions s ON h.hacker_id = s.hacker_id
    LEFT JOIN Challenges c ON s.challenge_id = c.challenge_id
    LEFT JOIN Difficulty d ON d.difficulty_level = c.difficulty_level
    WHERE s.score = d.score
    GROUP BY hackerId, hackerName
) as fullScoreTable WHERE fullScoreNumber > 1 ORDER BY fullScoreNumber DESC, hackerId ASC;
