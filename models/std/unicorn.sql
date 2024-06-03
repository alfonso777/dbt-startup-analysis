{{ config(schema='STD', tags=["startup","unicorn"]) }}

SELECT 
    _ROW AS id,
	INDUSTRY,
	COMPANY,
	LAST_VALUATION_BILLION_ AS last_valuation_in_billions,
	INVESTORS,
	CRUNCHBASE_URL,
	YEAR_JOINED,
	COUNTRY,
	CITY,
	UPDATED_AT          AS updated_at_dt,
	DATE_JOINED         AS joined_dt,
    _FIVETRAN_SYNCED    AS sync_dt
FROM {{ source('startups', 'unicorns') }}
