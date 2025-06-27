-- Data Analysis

-- Bike types used by each membership type
SELECT member_casual, rideable_type, COUNT(*) AS total_trips
FROM `divvy_trips.divvy_tripdata_cleaned`
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_trips;

-- Number of trips per month
SELECT month_of_year, member_casual, COUNT(ride_id) AS total_trips
FROM `divvy_trips.divvy_tripdata_cleaned`
GROUP BY month_of_year, member_casual
ORDER BY member_casual;

-- Number of trips per day of week
SELECT day_of_week, member_casual, COUNT(ride_id) AS total_trips
FROM `divvy_trips.divvy_tripdata_cleaned`
GROUP BY day_of_week, member_casual
ORDER BY member_casual;

-- Number of trips per hour
SELECT time_of_day, member_casual, COUNT(ride_id) AS total_trips
FROM `divvy_trips.divvy_tripdata_cleaned`
GROUP BY time_of_day, member_casual
ORDER BY member_casual;

-- Average ride length per month
SELECT month_of_year, member_casual, AVG(ride_length) AS avg_ride_length
FROM `divvy_trips.divvy_tripdata_cleaned`
GROUP BY month_of_year, member_casual;

-- Average ride length per day of week
SELECT day_of_week, member_casual, AVG(ride_length) AS avg_ride_length
FROM `divvy_trips.divvy_tripdata_cleaned`
GROUP BY day_of_week, member_casual;

-- Average ride length per hour
SELECT time_of_day, member_casual, AVG(ride_length) AS avg_ride_length
FROM `divvy_trips.divvy_tripdata_cleaned`
GROUP BY time_of_day, member_casual;


-- Starting station locations
SELECT start_station_name, member_casual, AVG(start_lat) AS start_lat, AVG(start_lng) AS start_lng, COUNT(ride_id) AS total_trips
FROM `divvy_trips.divvy_tripdata_cleaned`
GROUP BY start_station_name, member_casual
ORDER BY total_trips DESC;

-- Ending station locations
SELECT end_station_name, member_casual, AVG(end_lat) AS end_lat, AVG(end_lng) AS end_lng, COUNT(ride_id) AS total_trips
FROM `divvy_trips.divvy_tripdata_cleaned`
GROUP BY end_station_name, member_casual
ORDER BY total_trips DESC;
