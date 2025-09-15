{{ config(
    materialized='incremental',
    unique_key='order_key',
    on_schema_change='fail'
) }}

select
    order_key,
    customer_key,
    order_date,
    sum(final_price) as total_amount,
    current_timestamp() as _updated_at
from {{ ref('int_order_items') }}
group by 1,2,3

{% if is_incremental() %}
    where order_date > (select max(order_date) from {{ this }})
{% endif %}