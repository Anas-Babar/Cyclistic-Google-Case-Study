--- Remove null values from the dataset 
SELECT
    *
FROM
    `bike-share-2024.Bikeshare2023.Year - 2023`
WHERE
    ride_id is not null
    AND rideable_type is not null
    AND started_at is not null
    AND ended_at is not null
    AND start_station_name is not null
    AND start_station_id is not null
    AND end_station_name is not null
    AND end_station_id is not null
    AND end_station_name is not null
    AND end_station_id is not null
    AND start_lat is not null
    AND start_lng is not null
    AND end_lat is not null
    AND end_lng is not null
    AND member_casual is not NULL