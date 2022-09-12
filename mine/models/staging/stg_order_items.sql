with source as ( select *
        from {{ source ('ecommerce','order_items') }}
    ) 
    ,fixed as ( select 
        {{ dbt_utils.surrogate_key(['order_id', 'order_item_id']) }} as order_item_sk
        ,order_id
        ,order_item_id
        ,product_id
        ,seller_id
        ,shipping_limit_date
        ,price
        ,freight_value
        from  source
    )
    select * from fixed
