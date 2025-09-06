-- This is a master script to set up the entire Food Delivery database project.
-- Run this script in PostgreSQL to create, populate, and analyze the database.

-- 1. Build the database structure (Tables)
\i schema_definition.sql

-- 2. Populate with sample data
\i data_insertion.sql

-- 3. Run analysis queries (Optional: User can run sql_queries.sql manually)
\i sql_queries.sql