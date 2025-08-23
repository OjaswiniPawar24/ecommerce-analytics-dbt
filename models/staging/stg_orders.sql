select
    order_id,
    customer_id,
    product_id,
    order_date,
    ship_date,
    quantity
From {{source('raw','orders')}}