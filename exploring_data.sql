-- Exploratory Data Analysis

-- Check number of null values in each column
SELECT COUNT(*) - COUNT(ride_id) ride_id,
 COUNT(*) - COUNT(rideable_type) rideable_type,
 COUNT(*) - COUNT(start_time) start_time,
 COUNT(*) - COUNT(end_time) end_time,
 COUNT(*) - COUNT(start_station_name) start_station_name,
 COUNT(*) - COUNT(start_station_id) start_station_id,
 COUNT(*) - COUNT(end_station_name) end_station_name,
 COUNT(*) - COUNT(end_station_id) end_station_id,
 COUNT(*) - COUNT(start_lat) start_lat,
 COUNT(*) - COUNT(start_lng) start_lng,
 COUNT(*) - COUNT(end_lat) end_lat,
 COUNT(*) - COUNT(end_lng) end_lng,
 COUNT(*) - COUNT(member_casual) member_casual
FROM `divvy_trips.divvy_tripdata_combined`;
-- start_station_name, start_station_id - 868,772 null values
-- end_station_name, end_station_id - 925,008 null values
-- end_lat, end_lng - 6102 null values

-- Count number of duplicate ride_id
SELECT COUNT(*), COUNT(DISTINCT(ride_id))
FROM `divvy_trips.divvy_tripdata_combined`;
-- No duplicate ride_id

-- Check ride_id format is consistent
SELECT LENGTH(ride_id) as rider_id_length
FROM `divvy_trips.divvy_tripdata_combined`
GROUP BY LENGTH(ride_id);
-- All entries are 16 characters

-- Check what types of bikes there are
SELECT rideable_type
FROM `divvy_trips.divvy_tripdata_combined`
GROUP BY rideable_type;
-- Classic, electric and docked 

-- Count how many trips are too long or too short (<1 minute, >1 day)
SELECT COUNT(*) AS valid_trip,
FROM `divvy_trips.divvy_tripdata_combined`
WHERE 
TIMESTAMP_DIFF(end_time, start_time, MINUTE) <= 1 OR
TIMESTAMP_DIFF(end_time, start_time, MINUTE) >= 1440;
-- 269,929 trips

-- Check types of membership
SELECT member_casual, COUNT(*) as membership_count
FROM `divvy_trips.divvy_tripdata_combined`
GROUP BY member_casual;
-- Member and casual
