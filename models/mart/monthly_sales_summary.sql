{{ config(
    materialized = 'incremental',
    unique_key   = 'month'
) }}

with monthly as (
    select
        date_trunc('month', o.order_date)::date as month,
        count(distinct o.order_id)             as order_count,
        sum(o.total_amount)                    as total_sales,
        min(o.order_date)                      as first_order_date,
        max(o.order_date)                      as last_order_date
    from {{ ref('stg_orders') }} o
    group by
        date_trunc('month', o.order_date)::date
)

select *
from monthly
{% if is_incremental() %}
where month > (
    select coalesce(max(month), date '1900-01-01') from {{ this }}
)
{% endif %}
