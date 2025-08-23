with source as (
    select * from {{ source('raw', 'customers') }}
),
renamed as (
    select
        customer_id,
        initcap(first_name) as first_name,
        initcap(last_name) as last_name,
        region,
        cast(join_date as date) as join_date
    from source
)
select * from renamed