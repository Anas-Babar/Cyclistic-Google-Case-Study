SELECT
    column_name,
    data_type
FROM
    `bike-share-2024.Bikeshare2023`.INFORMATION_SCHEMA.COLUMNS
WHERE
    table_name = 'Year - 2023';