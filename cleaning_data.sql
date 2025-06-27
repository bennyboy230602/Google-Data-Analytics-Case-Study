-- Cleaning Data

-- Delete existing table for the new one
DROP TABLE IF EXISTS `divvy_trips.divvy_tripdata_cleaned`;

-- Create columns for ride length, month, day of the week, and hour of day
-- Remove rows with null values 
-- Remove rows where values lie outside accepted data ranges
CREATE TABLE `divvy_trips.divvy_tripdata_cleaned` AS (
  SELECT 
  DISTINCT(ride_id), 
  rideable_type,
  start_time,
  end_time,
  ride_length,
  member_casual,
  start_station_name,
  start_lat,
  start_lng,
  end_station_name,
  end_lat,
  end_lng,
  

  CASE EXTRACT(MONTH FROM start_time)
    WHEN 1 THEN 'January'
    WHEN 2 THEN 'February'
    WHEN 3 THEN 'March'
    WHEN 4 THEN 'April'
    WHEN 5 THEN 'May'      
    WHEN 6 THEN 'June'
    WHEN 7 THEN 'July'
    WHEN 8 THEN 'August'
    WHEN 9 THEN 'September'
    WHEN 10 THEN 'October'      
    WHEN 11 THEN 'November'
    WHEN 12 THEN 'December'
  END AS month_of_year,

  CASE EXTRACT(DAYOFWEEK FROM start_time)
    WHEN 1 THEN 'Sunday'
    WHEN 2 THEN 'Monday'
    WHEN 3 THEN 'Tuesday'
    WHEN 4 THEN 'Wednesday'
    WHEN 5 THEN 'Thursday'
    WHEN 6 THEN 'Friday'
    WHEN 7 THEN 'Saturday'    
  END AS day_of_week,

  EXTRACT(HOUR FROM start_time) AS time_of_day,

  FROM `divvy_trips.divvy_tripdata_combined`

  JOIN 
    (SELECT ride_id, TIMESTAMP_DIFF(end_time, start_time, MINUTE) AS ride_length
    FROM `divvy_trips.divvy_tripdata_combined`) 

  USING (ride_id)

  WHERE ride_length > 1 AND ride_length < 1440 AND
    start_station_name IS NOT NULL AND
    start_lat IS NOT NULL AND
    start_lng IS NOT NULL AND
    end_station_name IS NOT NULL AND
    end_lat IS NOT NULL AND
    end_lng IS NOT NULL

  );

SELECT COUNT(ride_id) AS no_of_rows       -- 5,723,606 - 4,175,831 = 1,547,775 rows removed
FROM `divvy_trips.divvy_tripdata_cleaned`;
