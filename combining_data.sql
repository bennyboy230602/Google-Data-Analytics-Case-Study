-- Convert "started_at" and "ended_at" attributes to TIMESTAMP datatype for the tables that generated the schema as STRING (2022_08 - 2022_10 and 2023_05 - 2023_07) while combining all tables

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
  FROM `divvy_trips.divvy_tripdata_2022_08`

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
  FROM `divvy_trips.divvy_tripdata_2022_09`

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
  FROM `divvy_trips.divvy_tripdata_2022_10`

  UNION ALL

  SELECT * 
  FROM `divvy_trips.divvy_tripdata_2022_11`

  UNION ALL

  SELECT * 
  FROM `divvy_trips.divvy_tripdata_2022_12`

  UNION ALL

  SELECT * 
  FROM `divvy_trips.divvy_tripdata_2023_01`

  UNION ALL

  SELECT * 
  FROM `divvy_trips.divvy_tripdata_2023_02`

  UNION ALL

  SELECT * 
  FROM `divvy_trips.divvy_tripdata_2023_03`

  UNION ALL

  SELECT * 
  FROM `divvy_trips.divvy_tripdata_2023_04`

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
  FROM `divvy_trips.divvy_tripdata_2023_05`

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
  FROM `divvy_trips.divvy_tripdata_2023_06`

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
  FROM `divvy_trips.divvy_tripdata_2023_07`
)
