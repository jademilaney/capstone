with source as ( select *  
        from {{ source ('ecommerce','orders')}}
    ) 

    ,fixed as 
    ( select 
    order_id
    ,customer_id
    ,order_purchase_timestamp
    ,order_approved_at
    ,order_delivered_carrier_date
    ,order_delivered_customer_date
    ,order_estimated_delivery_date
    ,order_status
    
    from source
    ) 
    
    select * from fixed
