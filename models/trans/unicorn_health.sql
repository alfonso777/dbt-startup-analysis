{{ config(schema='TRANS', materialized='table', tags=["startup","unicorn"]) }}

SELECT
    u.*
FROM {{ ref('unicorn') }} u
WHERE TRUE
    AND lower(industry) like 'health'

