with source as ( select *  
        from {{source ('ecommerce','order_reviews') }}
    )

    ,fixed as ( select 
    {{dbt_utils.surrogate_key(['review_id','order_id'])}} as review_order_sk
    ,review_id
    ,order_id
    ,review_creation_date
    ,review_answer_timestamp
    ,review_score
    
    from  source
    )
    select * from fixed
