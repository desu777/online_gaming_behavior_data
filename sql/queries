-- Analysis of the conversion rate for in-game purchases according to engagement level and game genre
SELECT GameGenre, EngagementLevel,
       100.0 * SUM(CASE WHEN InGamePurchases = 1 THEN 1 ELSE 0 END) / COUNT(*) AS PurchaseConversionRate
FROM online_gaming_behavior_dataset
GROUP BY GameGenre, EngagementLevel
ORDER BY GameGenre DESC;

-- Average time it takes to get an achievement
SELECT GameDifficulty, Gender, 
       AVG(AchievementsUnlocked / PlayTimeHours) AS AvgTimeToGetAchievement
FROM online_gaming_behavior_dataset
GROUP BY GameDifficulty, Gender;

-- Correlation between number of sessions per week and player level for different levels of involvement
SELECT
    EngagementLevel,
    (COUNT(*) * SUM(SessionsPerWeek * PlayerLevel) - SUM(SessionsPerWeek) * SUM(PlayerLevel)) /
    SQRT(
        (COUNT(*) * SUM(SessionsPerWeek * SessionsPerWeek) - SUM(SessionsPerWeek) * SUM(SessionsPerWeek)) *
        (COUNT(*) * SUM(PlayerLevel * PlayerLevel) - SUM(PlayerLevel) * SUM(PlayerLevel))
    ) AS CorrelationSessionsPerWeekAndLevel
FROM
    online_gaming_behavior_dataset
GROUP BY
    EngagementLevel;

-- Locations where players spend the most time per session, broken down by game genre
SELECT Location, GameGenre,
       AVG(AvgSessionDurationMinutes) AS AvgSessionDuration
FROM online_gaming_behavior_dataset
GROUP BY Location, GameGenre
ORDER BY AvgSessionDuration DESC
LIMIT 10;

-- Percentage of high-engagement players who have reached at least 50% of levels in the game, depending on the game genre
WITH MaxPlayerLevels AS (
    SELECT GameGenre, MAX(PlayerLevel) AS MaxPlayerLevel
    FROM online_gaming_behavior_dataset
    GROUP BY GameGenre
)
SELECT 
    o.GameGenre,
    100.0 * SUM(CASE WHEN o.EngagementLevel = 'High' AND o.PlayerLevel >= 0.5 * m.MaxPlayerLevel THEN 1 ELSE 0 END) / COUNT(*) AS HighEngagementWithLevelsPercentage
FROM 
    online_gaming_behavior_dataset o
JOIN 
    MaxPlayerLevels m ON o.GameGenre = m.GameGenre
GROUP BY 
    o.GameGenre;

-- Analysis of the trend of the number of sessions per week according to the age of players
WITH AgeGroups AS (
    SELECT CASE
               WHEN Age BETWEEN 18 AND 25 THEN '18-25'
               WHEN Age BETWEEN 26 AND 35 THEN '26-35'
               WHEN Age BETWEEN 36 AND 45 THEN '36-45'
               WHEN Age BETWEEN 46 AND 55 THEN '46-55'
               ELSE '55+'
           END AS AgeGroup, SessionsPerWeek
    FROM online_gaming_behavior_dataset
)
SELECT AgeGroup, AVG(SessionsPerWeek) AS AvgSessionsPerWeek
FROM AgeGroups
GROUP BY AgeGroup
ORDER BY AgeGroup;

-- The rate of unlocked achievements depending on the average duration of the session and the level of engagement
SELECT EngagementLevel, 
       AVG(AvgSessionDurationMinutes) AS AvgSessionDuration,
       AVG(AchievementsUnlocked) AS AvgAchievementsUnlocked
FROM online_gaming_behavior_dataset
GROUP BY EngagementLevel 
HAVING AVG(AvgSessionDurationMinutes) > 0;
