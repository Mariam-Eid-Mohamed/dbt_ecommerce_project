{{ config(
    materialized = 'table'
) }}

with orders as (
    select *
    from {{ ref('stg_orders') }}
),

customers as (
    select *
    from {{ ref('stg_customers') }}
),

regions as (
    select *
    from {{ ref('stg_regions') }}
)

select
    r.region_name,
    date_trunc('month', o.order_date)::date as month,
    count(distinct o.order_id)        as order_count,
    sum(o.total_amount)               as total_sales
from orders o
join customers c
  on o.customer_id = c.customer_id
join regions r
  on c.region_id = r.region_id
group by
    r.region_name,
    date_trunc('month', o.order_date)::date
order by
    month,
    region_name
