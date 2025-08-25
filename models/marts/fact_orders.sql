{{ config(
    materialized='incremental',
    unique_key='order_id'
   
) }}

select
    o.order_id,
    o.order_date,
    o.ship_date,
    o.quantity,
    c.customer_id,
    c.region,
    p.product_id,
    p.category,
    p.price
from {{ ref('stg_orders') }} o
left join {{ ref('stg_customers') }} c
  on o.customer_id = c.customer_id
left join {{ ref('stg_products') }} p 
  on o.product_id = p.product_id

{% if is_incremental() %}
WHERE o.order_date > (SELECT COALESCE(MAX(order_date), '1900-01-01') 
      FROM {{ this }})    
{% endif %}