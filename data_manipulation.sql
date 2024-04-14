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
    `bike-share-2024.Bikeshare2023.Dec` --- Extract time of the day 
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
    rideable_type -- Merge two queries ( Extract WOW time of the day )
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