{{ config(
    materialized='incremental',
    unique_key='customer_id'
) }}

with base as (

    select
        customer_id,
        first_name,
        last_name,
        region,
        join_date
    from {{ ref('stg_customers') }}

)

select * 
from base

{% if is_incremental() %}

-- Update logic: keep only rows where data is new or changed
where customer_id not in (
    select customer_id
    from {{ this }}
    where {{ this }}.region = base.region
      and {{ this }}.first_name = base.first_name
      and {{ this }}.last_name = base.last_name
)

{% endif %}
