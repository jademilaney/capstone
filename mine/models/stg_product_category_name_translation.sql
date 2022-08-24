with source as ( select *  
        from {{ source ('ecommerce','product_category_name_translation')}}
    ) 

    ,fixed as ( select 
    string_field_0 as product_category_name_portuguese
    ,string_field_1 as product_category_name_english
    from  source
    )

    select * from fixed
