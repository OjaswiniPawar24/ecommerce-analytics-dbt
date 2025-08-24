{{
    config(
        materialized='view'
    )
}}

select 
    o.category,
    sum(p.amount) as revenue
from {{ ref('fact_payments') }} as p
join {{ ref('fact_orders') }} as o
on p.order_id = o.order_id
group by o.category