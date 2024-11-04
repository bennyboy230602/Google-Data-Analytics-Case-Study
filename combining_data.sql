-- Convert "started_at" and "ended_at" attributes to TIMESTAMP datatype as the generated the schema used STRING.
-- Some files needed to be split to make the file size under 100MB to allow local file uploading.

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
  FROM `divvy_trips.2022-09`

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
  FROM `divvy_trips.2022-09-2`

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
  FROM `divvy_trips.2022-10`

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
  FROM `divvy_trips.2022-11`

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
  FROM `divvy_trips.2022-12`

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
  FROM `divvy_trips.2023-01`

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
  FROM `divvy_trips.2023-02`

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
  FROM `divvy_trips.2023-03`

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
  FROM `divvy_trips.2023-04`

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
  FROM `divvy_trips.2023-05`

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
  FROM `divvy_trips.2023-06`

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
  FROM `divvy_trips.2023-06-2`

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
  FROM `divvy_trips.2023-07`

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
  FROM `divvy_trips.2023-07-2`

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
  FROM `divvy_trips.2023-08`

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
  FROM `divvy_trips.2023-08-2`
)
