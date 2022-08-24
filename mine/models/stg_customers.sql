with (
    select * 
    from {{source('ecommerce', 'customers')}}
    ) as source 
    ,( select 
       
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
    from source 
    ) as fixed 

    select * from fixed
