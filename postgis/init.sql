-- Enable PostGIS and topology extensions on database creation
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_topology;

-- (Optional) confirm it's working
SELECT postgis_full_version();
