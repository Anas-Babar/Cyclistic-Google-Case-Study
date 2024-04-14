SELECT
    rideable_type,
    count(member_casual) AS total_casual_members
FROM
    `bike-share-2024.Bikeshare2023.Bikeshare 2023 Q1`
Group BY
    rideable_type