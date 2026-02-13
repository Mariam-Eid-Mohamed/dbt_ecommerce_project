{% snapshot orders_snapshot %}

{{
  config(
    target_schema = 'snapshots',
    unique_key    = 'order_id',
    strategy      = 'check',
    check_cols    = ['status', 'total_amount']
  )
}}

select
    order_id,
    customer_id,
    order_date,
    status,
    total_amount
from {{ ref('stg_orders') }}

{% endsnapshot %}
