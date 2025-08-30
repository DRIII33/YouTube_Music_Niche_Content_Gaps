CREATE OR REPLACE VIEW driiiportfolio.music_content_gaps.vw_prioritized_artists AS
WITH artist_metrics AS (
    SELECT
        artist_name,
        COUNT(listen_id) AS total_listening_sessions,
        AVG(engagement_score) AS avg_engagement_score,
        ARRAY_AGG(genre_tag ORDER BY listen_id DESC LIMIT 1)[OFFSET(0)] AS most_listened_genre
    FROM
        `driiiportfolio.music_content_gaps.vw_unlicensed_listening_data`
    GROUP BY
        artist_name
),
normalized_metrics AS (
    SELECT
        artist_name,
        total_listening_sessions,
        avg_engagement_score,
        most_listened_genre,
        (total_listening_sessions - MIN(total_listening_sessions) OVER()) / (MAX(total_listening_sessions) OVER() - MIN(total_listening_sessions) OVER()) AS sessions_normalized,
        (avg_engagement_score - MIN(avg_engagement_score) OVER()) / (MAX(avg_engagement_score) OVER() - MIN(avg_engagement_score) OVER()) AS engagement_normalized
    FROM
        artist_metrics
)
SELECT
    artist_name,
    total_listening_sessions,
    avg_engagement_score,
    most_listened_genre,
    (sessions_normalized * 0.6) + (engagement_normalized * 0.4) AS priority_score
FROM
    normalized_metrics
ORDER BY
    priority_score DESC;
