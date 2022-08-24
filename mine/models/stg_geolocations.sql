with ( select *  
        from source {{('ecommerce','geolocations')}}
    ) as sources

    ,( select 
    geolocation_lat
    ,geolocation_lng as geolocation_long
    ,gelocation_city
    ,geolocation_state
    ,geolocation zip_code_prefix
    from source 
    )  as fixed

    select * from fixed
