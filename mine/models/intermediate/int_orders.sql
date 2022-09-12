with order_items as (
    select * from {{ ref('stg_order_items') }}
)
,orders as (
    select * from {{ ref('stg_orders') }}
    )
,joined as (
    select
        order_item_sk
        ,order_items.order_id
        ,order_items.order_item_id
        ,order_items.product_id
        ,order_items.seller_id
        ,orders.customer_id
        ,order_items.shipping_limit_date
        ,orders.order_purchase_timestamp
        ,orders.order_approved_at
        ,orders.order_delivered_carrier_date
        ,orders.order_delivered_customer_date
        ,orders.order_estimated_delivery_date
        ,orders.order_status
        ,order_items.price
        ,order_items.freight_value

    from order_items
    left join orders on orders.order_id=order_items.order_id
)

select * from joined
