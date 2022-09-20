with sellers as (
    select * from {{ref ('stg_sellers')}}
    ) 
    ,orders as ( 
    select * from {{ref('int_orders')}}
    )
, joined as (
    select 
    orders.order_item_sk
    ,orders.order_id
    ,orders.order_item_id
    ,orders.product_id
    ,orders.seller_id
    ,orders.customer_id
    ,orders.order_status
    ,orders.price
    ,orders.freight_value
    ,sellers.seller_zip_code_prefix
    ,sellers.seller_city
    ,sellers.seller_state
    from orders 
    left join sellers on sellers.seller_id=orders.seller_id
    
)
select * from joined
