{{
    config(
        materialized='table'
    )
}}

select
    p.payment_id,
    p.order_id,
    p.payment_type,
    p.amount,
    o.customer_id,
    o.order_date
from {{ ref('stg_payments') }} p
left join {{ ref('stg_orders') }} o 
on p.order_id = o.order_id

