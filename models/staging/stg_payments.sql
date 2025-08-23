select
        payment_id,
        order_id,
        upper(payment_type) as payment_type,
        amount

    From {{source('raw','payments')}}