with source as ( select *  
        from {{ source ('ecommerce','order_payments')}}
    ) 

    ,fixed as ( select 
    order_id
    ,payment_type
    ,payment_installments
    ,payment_sequential
    ,payment_value
    
    from  source
    )

    select * from fixed
