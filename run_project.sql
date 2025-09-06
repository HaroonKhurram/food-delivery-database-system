-- Food Delivery Database Project - Master Setup Script
-- This script automates the setup of the entire project.
-- Run this script in psql or pgAdmin to create, populate, and analyze the database.

-- Check if we are in a PostgreSQL session
SELECT 'Master script started at ' || NOW() AS status;

-- 1. Build the database structure (Tables)
\i schema_definition.sql
SELECT 'Schema creation completed at ' || NOW() AS status;

-- 2. Populate with sample data
\i data_insertion.sql
SELECT 'Data insertion completed at ' || NOW() AS status;

-- 3. Run analysis queries
\i sql_queries.sql
SELECT 'Data analysis queries completed at ' || NOW() AS status;

SELECT 'Project setup finished successfully at ' || NOW() AS status;
