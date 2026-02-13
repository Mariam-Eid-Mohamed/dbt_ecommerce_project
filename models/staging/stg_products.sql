select
    product_id,
    product_name,
    category_id,
    price
from {{ source('raw', 'products') }}
