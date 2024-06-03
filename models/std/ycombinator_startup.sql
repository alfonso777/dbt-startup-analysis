{{ config(schema='STD', materialized='view', tags=["startup","ycombinator"]) }}

SELECT
    _LINE AS id,
    NAME,
    DESCRIPTION,
    LOCATION,
    URL,
    SITE_URL,
    TAG_LINE,
    META::OBJECT,
    FOUNDERS::ARRAY,
    SOCIALS::ARRAY,
    TAGS::ARRAY,
    _FIVETRAN_SYNCED AS sync_dt
FROM {{ source('startups', 'yc_startups') }},
