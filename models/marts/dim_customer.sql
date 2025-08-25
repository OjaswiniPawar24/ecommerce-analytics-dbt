{{
    config(
        materialized='table',
        post_hook="INSERT INTO E_COMMERCE_DB.RAW.MODEL_AUDIT_LOG 
              (model_name, run_timestamp) 
              VALUES ('dim_customer', CURRENT_TIMESTAMP)"
    )
}}
select
        customer_id,
        first_name,
        last_name,
        region,
        join_date
    from {{ ref('stg_customers') }}
