{{
    config(
        materialized='view'
    )
}}

select * from {{ ref('customer_ranking') }}
where ranking<=20

