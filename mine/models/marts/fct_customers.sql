with customers as (
    select * from {{ref ('stg_customers')}}
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
    ,customers.customer_zip_code_prefix
    ,customers.customer_city
    ,customers.customer_state
    from orders 
    left join customers on customers.customer_id=orders.customer_id
    
)
select * from joined
