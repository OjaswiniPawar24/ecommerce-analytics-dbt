SELECT *
FROM {{ ref('stg_orders') }}
WHERE quantity <= 0