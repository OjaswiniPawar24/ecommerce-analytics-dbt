{{
    config(
        materialized='view'
    )
}}

select 
    o.region,
    sum(f.amount) as total_sales
from {{ ref('fact_payments') }} as f
join {{ ref('fact_orders') }}  as o
on f.order_id = o.order_id 
group by o.region