-- Track customer information changes
{% snapshot customer_history %}
    {{ config(
        unique_key='customer_id',
        strategy='timestamp',
        updated_at='last_updated'
    ) }}
    select customer_id, name, email, address, status
    from {{ source('tpch', 'customer') }}
{% endsnapshot %}