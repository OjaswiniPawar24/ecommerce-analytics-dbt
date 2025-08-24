{% snapshot customer_snapshot %}
{{
    config(
        target_schema='snapshots',
        unique_key='customer_id',
        strategy='check',
        check_cols=['first_name', 'last_name', 'region']  
    )
    
}}

SELECT
    customer_id,
    first_name,
    last_name,
    region,
    join_date
FROM {{ ref('stg_customers') }}

{% endsnapshot %}