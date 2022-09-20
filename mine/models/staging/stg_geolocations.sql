with source as( 
    select *  from {{ source('ecommerce','geolocations')}}
    )

    ,fixed as( 
    select 
    geolocation_city
    ,geolocation_lat
    ,geolocation_lng as geolocation_long
    ,geolocation_state
    ,geolocation_zip_code_prefix
    from source 
    ) 

    select * from fixed
