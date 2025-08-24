{{
    config(
        materialized='ephemeral'
    )
}}

select f.customer_id,
     c.first_name || ' ' || c.last_name as customer_name,
     sum(f.amount) as total_spent,
      row_number() over (order by total_spent desc) as ranking
from {{ ref('fact_payments') }} as f
join {{ ref('stg_customers') }} as c 
on f.customer_id = c.customer_id
group by 1,2
order by total_spent desc

