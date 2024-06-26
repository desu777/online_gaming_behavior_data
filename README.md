# SQL Data Analysis Project

This project contains a set of SQL queries to analyze player behavior in online games. The queries are categorized into basic, advanced, and analytical queries.

## Project Structure

- `sql/`: Contains SQL scripts for creating tables, loading data, and various queries.
- `data/`: Contains the sample data used in the project.

## Getting Started

1. **Create Tables**: Run the script `sql/create_tables.sql` to create the necessary database tables.
2. **Load Data**: Use `sql/load_data.sql` to load data from `data/online_gaming_behavior_dataset.csv` into the database.
3. **Run Queries**: Execute the queries in `sql/queries.sql` to perform different analyses.

## Example Queries

### Purchase Conversion Rate by Engagement Level and Game Genre

```sql
SELECT GameGenre, EngagementLevel,
       100.0 * SUM(CASE WHEN InGamePurchases = 1 THEN 1 ELSE 0 END) / COUNT(*) AS PurchaseConversionRate
FROM online_gaming_behavior_dataset
GROUP BY GameGenre, EngagementLevel
ORDER BY GameGenre DESC;
