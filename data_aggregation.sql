--- Combine Multiple datasets and include name in a column 
SELECT
    'Jan' AS Month,
    *
FROM
    `bike-share-2024.Bikeshare2023.Jan`
UNION
ALL
SELECT
    'Feb' AS Month,
    *
FROM
    `bike-share-2024.Bikeshare2023.Feb`
UNION
ALL
SELECT
    'March' AS Month,
    *
FROM
    `bike-share-2024.Bikeshare2023.March`
UNION
ALL
SELECT
    'April' AS Month,
    *
FROM
    `bike-share-2024.Bikeshare2023.April`
UNION
ALL
SELECT
    'May' AS Month,
    *
FROM
    `bike-share-2024.Bikeshare2023.May`
UNION
ALL
SELECT
    'June' AS Month,
    *
FROM
    `bike-share-2024.Bikeshare2023.June`
UNION
ALL
SELECT
    'July' AS Month,
    *
FROM
    `bike-share-2024.Bikeshare2023.July`
UNION
ALL
SELECT
    'August' AS Month,
    *
FROM
    `bike-share-2024.Bikeshare2023.August`
UNION
ALL
SELECT
    'Sept' AS Month,
    *
FROM
    `bike-share-2024.Bikeshare2023.Sept`
UNION
ALL
SELECT
    'Oct' AS Month,
    *
FROM
    `bike-share-2024.Bikeshare2023.Oct`
UNION
ALL
SELECT
    'Nov' AS Month,
    *
FROM
    `bike-share-2024.Bikeshare2023.Nov`
UNION
ALL
SELECT
    'Dec' AS Month,
    *
FROM
    `bike-share-2024.Bikeshare2023.Dec`