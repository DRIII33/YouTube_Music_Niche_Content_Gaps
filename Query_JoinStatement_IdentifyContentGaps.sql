-- Join the tables to find unlicensed content
-- This is the core query that identifies content gaps.
-- It selects listening data for tracks that are not found in the licensed catalog.
SELECT
    t1.listen_id,
    t1.user_id,
    t1.track_id,
    t1.artist_name,
    t1.duration_ms,
    t1.engagement_score,
    t1.genre_tag
FROM
    `driiiportfolio.music_content_gaps.user_listening_data` AS t1
LEFT JOIN
    `driiiportfolio.music_content_gaps.licensed_catalog_data` AS t2
ON
    t1.artist_name = t2.artist_name
WHERE
    t2.is_licensed IS NULL
    OR t2.is_licensed = FALSE;
