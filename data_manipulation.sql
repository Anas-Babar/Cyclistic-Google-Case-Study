
---- Query to extract Day of the week and time

SELECT
    CAST(started_at AS TIME) AS time,
    CASE
        EXTRACT(
            DAYOFWEEK
            FROM
                started_at
        )
        WHEN 1 THEN 'Sunday'
        WHEN 2 THEN 'Monday'
        WHEN 3 THEN 'Tuesday'
        WHEN 4 THEN 'Wednesday'
        WHEN 5 THEN 'Thursday'
        WHEN 6 THEN 'Friday'
        ELSE 'Saturday'
    END AS day_of_week
FROM
    `bike-share-2024.Bikeshare2023.Dec` 
    
    
    --- Extract time of the day 

    
SELECT
    Quarter,
    Month,
    member_casual,
    rideable_type,
    time_of_day,
    COUNT(num_of_trips) AS Total_Trips
From
    (
        SELECT
            Quarter,
            Month,
            member_casual,
            rideable_type,
            CAST(started_at AS TIME) AS time,
            CASE
                WHEN CAST(started_at AS TIME) >= '06:00:00'
                AND CAST(started_at AS TIME) < '12:00:00' THEN 'Morning'
                WHEN CAST(started_at AS TIME) >= '12:00:00'
                AND CAST(started_at AS TIME) < '17:00:00' THEN 'Afternoon'
                WHEN CAST(started_at AS TIME) >= '17:00:00'
                AND CAST(started_at AS TIME) < '20:00:00' THEN 'Evening'
                ELSE 'Night'
            END AS time_of_day,
            COUNT(*) as num_of_trips
        FROM
            `bike-share-2024.Bikeshare2023.Year - 2023`
        GROUP BY
            Quarter,
            Month,
            member_casual,
            rideable_type,
            started_at
    )
GROUP BY
    time_of_day,
    Quarter,
    Month,
    member_casual,
    rideable_type 
    
    
    -- Merge two queries ( Extract WOW time of the day )


SELECT
    Quarter,
    Month,
    day_of_week,
    member_casual,
    rideable_type,
    time_of_day,
    Hour,
    COUNT(num_of_trips) AS Total_Trips
From
    (
        SELECT
            Quarter,
            Month,
            member_casual,
            rideable_type,
            EXTRACT(
                HOUR
                FROM
                    CAST(started_at AS TIME)
            ) AS Hour,
            CASE
                WHEN CAST(started_at AS TIME) >= '06:00:00'
                AND CAST(started_at AS TIME) < '12:00:00' THEN 'Morning'
                WHEN CAST(started_at AS TIME) >= '12:00:00'
                AND CAST(started_at AS TIME) < '17:00:00' THEN 'Afternoon'
                WHEN CAST(started_at AS TIME) >= '17:00:00'
                AND CAST(started_at AS TIME) < '20:00:00' THEN 'Evening'
                ELSE 'Night'
            END AS time_of_day,
            CASE
                EXTRACT(
                    DAYOFWEEK
                    FROM
                        started_at
                )
                WHEN 1 THEN 'Sunday'
                WHEN 2 THEN 'Monday'
                WHEN 3 THEN 'Tuesday'
                WHEN 4 THEN 'Wednesday'
                WHEN 5 THEN 'Thursday'
                WHEN 6 THEN 'Friday'
                ELSE 'Saturday'
            END AS day_of_week,
            COUNT(*) as num_of_trips
        FROM
            `bike-share-2024.Bikeshare2023.Year - 2023`
        GROUP BY
            Quarter,
            Month,
            member_casual,
            rideable_type,
            started_at
    )
GROUP BY
    time_of_day,
    Quarter,
    Month,
    day_of_week,
    member_casual,
    rideable_type,
    Hour 
    
    
    --- Calculate duration of each ridetype by route


SELECT
    rideable_type,
    CONCAT(start_station_name, " to ", end_station_name) AS Route,
    COUNT(*) AS num_trips,
    ROUND(
        AVG(CAST(UNIX_SECONDS(ended_at) AS INT64) / 60),
        1
    ) - ROUND(
        AVG(CAST(UNIX_SECONDS(started_at) AS INT64) / 60),
        1
    ) AS duration
FROM
    `bike-share-2024.Bikeshare2023.Bikeshare 2023 Q1`
GROUP BY
    start_station_name,
    end_station_name,
    rideable_type
Order By
    num_trips DESC 
    
    
    
    --- Calculate total trips - Avg duration - Group by Quarter , Month, Member, rideable_type


SELECT
    Quarter,
    Month,
    member_casual,
    rideable_type,
    Count(*) AS num_trips,
    ROUND(
        AVG(CAST(UNIX_SECONDS(ended_at) AS INT64) / 60),
        2
    ) - ROUND(
        AVG(CAST(UNIX_SECONDS(started_at) AS INT64) / 60),
        2
    ) AS duration
FROM
    `bike-share-2024.Bikeshare2023.Year - 2023`
GROUP BY
    Quarter,
    Month,
    member_casual,
    rideable_type
ORDER BY
    Quarter,
    Month