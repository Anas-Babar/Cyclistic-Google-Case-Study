--- Calculate Null Values based on a criteria 

SELECT
rideable_type,
Count(*) AS Unknown

FROM `bike-share-2024.Bikeshare2023.Year - 2023`

WHERE
ride_id is null OR rideable_type is null OR started_at is null OR ended_at is null OR start_station_name is null OR start_station_id is null OR end_station_name is null OR end_station_id is null OR end_station_name is null OR end_station_id is null OR start_lat is null OR start_lng is null OR end_lat is null OR end_lng is null OR member_casual is null

Group BY
rideable_type

ORDER BY
rideable_type DESC


--- Query to Explore Data types

SELECT
column_name,
data_type
FROM `bike-share-2024.Bikeshare2023`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'Year - 2023';



--- Query to check total number of rides per rideable type

SELECT 
DISTINCT rideable_type, COUNT(rideable_type) AS no_of_trips
FROM `bike-share-2024.Bikeshare2023.Year - 2023`
GROUP BY rideable_type;

--- Query to check length of ride_id 

SELECT LENGTH(ride_id) AS length_ride_id, COUNT(ride_id) AS no_of_rows
FROM `bike-share-2024.Bikeshare2023.Year - 2023`
GROUP BY length_ride_id;


--- Calculate trips longer than a day

SELECT COUNT(*) AS longer_than_a_day
FROM `bike-share-2024.Bikeshare2023.Year - 2023`
WHERE (
EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
EXTRACT(MINUTE FROM (ended_at - started_at)) +
EXTRACT(SECOND FROM (ended_at - started_at)) / 60) >= 1440;


--- Query to calculate trips less than a minute

SELECT COUNT(*) AS less_than_a_minute
FROM `bike-share-2024.Bikeshare2023.Year - 2023`
WHERE (
EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
EXTRACT(MINUTE FROM (ended_at - started_at)) +
EXTRACT(SECOND FROM (ended_at - started_at)) / 60) <= 1



























