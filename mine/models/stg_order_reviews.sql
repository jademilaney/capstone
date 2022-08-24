with source as ( select {{dbt_utils.surrogate_key(['review_id','order_id'])}} as review_order_sk
            ,*  
        from {{source ('ecommerce','order_reviews') }}
    )

    ,fixed as ( select 
    review_order_sk
    ,review_id
    ,order_id
    ,review_score
    ,review_creation_date
    ,review_answer_timestamp
    from  source
    )
    select * from fixed
