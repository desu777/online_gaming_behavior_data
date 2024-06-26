CREATE TABLE online_gaming_behavior_dataset (
    PlayerID INT PRIMARY KEY,
    Age INT,
    Gender VARCHAR(10),
    Location VARCHAR(50),
    GameGenre VARCHAR(50),
    PlayTimeHours FLOAT,
    InGamePurchases BOOLEAN,
    GameDifficulty VARCHAR(20),
    SessionsPerWeek INT,
    AvgSessionDurationMinutes INT,
    PlayerLevel INT,
    AchievementsUnlocked INT,
    EngagementLevel VARCHAR(10)
);