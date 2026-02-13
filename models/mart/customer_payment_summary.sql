{{ config(
    materialized = 'view'
) }}

with payments as (
    select *
    from {{ ref('stg_payments') }}
),

orders as (
    select *
    from {{ ref('stg_orders') }}
),

customers as (
    select *
    from {{ ref('stg_customers') }}
)

select
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    count(distinct p.payment_id) as payment_count,
    sum(p.amount)                as total_paid,
    min(p.payment_date)          as first_payment_date,
    max(p.payment_date)          as last_payment_date
from payments p
join orders o
  on p.order_id = o.order_id
join customers c
  on o.customer_id = c.customer_id
group by
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email
order by
    total_paid desc
