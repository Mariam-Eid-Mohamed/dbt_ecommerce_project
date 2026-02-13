select
    shipping_id,
    order_id,
    shipped_date,
    delivery_date,
    shipping_status
from {{ source('raw', 'shipping') }}
