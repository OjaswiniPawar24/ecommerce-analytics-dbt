{{
    config(
        materialized='table'
    )
}}

SELECT 
    customer_id,
    first_name,
    last_name,
    region,
    join_date
FROM {{ref('stg_customers')}}