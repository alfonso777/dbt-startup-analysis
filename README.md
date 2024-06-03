# DBT project

## Overview
There are 2 ways to run *dbt* in our project in Snowflake:
- DEV:  as a developer working in their dev environment (the `DEV` database)
- PROD: as the `DBT_USER` (updates the production `ANALYTICS` database)

## Deployment in Production
- Code review:
  - After validating the models in DEV environment you should create a Github PR (Pull Request). 
  - After the Code Review approval(s) the code can be merged from your branch to the _master_ (PROD) branch.
- Deployment:
  - Deprecated: deployment in DBT Cloud
  - Current approach:
    - The deployment is carried out by defining *Fivetran* scheduled jobs in `deployment.yml`
    - Automatically, Fivetran will pull up the code from _main_ branch to update the models and run them according to scheduling and job definitions.
    - Fivetran has already the properly PROD `dbt` profile with Snowflake configurations (like user `DBT_USER`).
    - After the executions the models/data will be updated/created in `ANALYTICS` database in the `STD`, `TRANS` and `RPT` schemas.
