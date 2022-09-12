with products as ( 
    select * from {{ref ('stg_products')}} 
    )
    
    ,product_names as (
    select * from {{ref('stg_product_category_name_translation')}}
    
    )
    ,joined as (
    select 
    products.product_id
    ,product_names.product_category_name_english
    ,products.product_name_length
    ,products.product_description_length
    ,products.product_photos_qty
    ,products.product_weight_g
    ,products.product_length_cm
    ,products.product_height_cm
    ,products.product_width_cm
    from products 
    left join product_names on products.product_category_name=product_names.product_category_name_portuguese
        
        )

select * from joined
