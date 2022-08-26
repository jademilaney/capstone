with source as( select *  
        from source {{('ecommerce','geolocations')}}
    )

    ,fixed as( select 
    gelocation_city
    ,geolocation_lat
    ,geolocation_lng as geolocation_long
    ,geolocation_state
    ,geolocation zip_code_prefix
    
    from source 
    ) 

    select * from fixed
