LOAD DATA INFILE '/path/to/online_gaming_behavior_dataset.csv'
INTO TABLE online_gaming_behavior_dataset
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(PlayerID, Age, Gender, Location, GameGenre, PlayTimeHours, InGamePurchases, GameDifficulty, SessionsPerWeek, AvgSessionDurationMinutes, PlayerLevel, AchievementsUnlocked, EngagementLevel);
