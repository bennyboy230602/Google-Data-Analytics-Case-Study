-- Combining Data

-- Create table joining all datasets
-- Converts start and end times to correct format
CREATE TABLE IF NOT EXISTS `divvy_trips.divvy_tripdata_combined` AS (
  SELECT ride_id,
  rideable_type,
  CAST(started_at AS TIMESTAMP) as start_time,
  CAST(ended_at AS TIMESTAMP) as end_time,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
  FROM `divvy_trips.08-22`

  UNION ALL
  
  SELECT ride_id,
  rideable_type,
  CAST(started_at AS TIMESTAMP) as start_time,
  CAST(ended_at AS TIMESTAMP) as end_time,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
  FROM `divvy_trips.09-22`

  UNION ALL

  SELECT ride_id,
  rideable_type,
  CAST(started_at AS TIMESTAMP) as start_time,
  CAST(ended_at AS TIMESTAMP) as end_time,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
  FROM `divvy_trips.10-22`

  UNION ALL

  SELECT ride_id,
  rideable_type,
  CAST(started_at AS TIMESTAMP) as start_time,
  CAST(ended_at AS TIMESTAMP) as end_time,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
  FROM `divvy_trips.11-22`

  UNION ALL

  SELECT ride_id,
  rideable_type,
  CAST(started_at AS TIMESTAMP) as start_time,
  CAST(ended_at AS TIMESTAMP) as end_time,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
  FROM `divvy_trips.12-22`

  UNION ALL

  SELECT ride_id,
  rideable_type,
  CAST(started_at AS TIMESTAMP) as start_time,
  CAST(ended_at AS TIMESTAMP) as end_time,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
  FROM `divvy_trips.01-23`

  UNION ALL

  SELECT ride_id,
  rideable_type,
  CAST(started_at AS TIMESTAMP) as start_time,
  CAST(ended_at AS TIMESTAMP) as end_time,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
  FROM `divvy_trips.02-23`

  UNION ALL

  SELECT ride_id,
  rideable_type,
  CAST(started_at AS TIMESTAMP) as start_time,
  CAST(ended_at AS TIMESTAMP) as end_time,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
  FROM `divvy_trips.03-23`

  UNION ALL

  SELECT ride_id,
  rideable_type,
  CAST(started_at AS TIMESTAMP) as start_time,
  CAST(ended_at AS TIMESTAMP) as end_time,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
  FROM `divvy_trips.04-23`

  UNION ALL

  SELECT ride_id,
  rideable_type,
  CAST(started_at AS TIMESTAMP) as start_time,
  CAST(ended_at AS TIMESTAMP) as end_time,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
  FROM `divvy_trips.05-23`

  UNION ALL

  SELECT ride_id,
  rideable_type,
  CAST(started_at AS TIMESTAMP) as start_time,
  CAST(ended_at AS TIMESTAMP) as end_time,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual 
  FROM `divvy_trips.06-23`

  UNION ALL

  SELECT ride_id,
  rideable_type,
  CAST(started_at AS TIMESTAMP) as start_time,
  CAST(ended_at AS TIMESTAMP) as end_time,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
  FROM `divvy_trips.07-23`
)
