{{
    config(
        materialized='table'
    )
}}
select
        customer_id,
        first_name,
        last_name,
        region,
        join_date
    from {{ ref('stg_customers') }}
