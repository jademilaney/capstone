with orders as ( select * 
            from {{ref('int_orders')}})
    ,products as (
    select * from {{ref('int_products')}}
        )
    ,reviews as (
         select * from {{ref('stg_order_reviews')}} 
        )
    ,final as (
            select 
            orders.order_item_sk
            ,reviews.review_order_sk
            ,reviews.review_id
            ,orders.order_id
            ,products.product_id
            ,orders.order_item_id
            ,orders.seller_id
            ,orders.customer_id
            ,orders.order_purchase_timestamp
            ,orders.order_delivered_customer_date
            ,reviews.review_creation_date
            ,reviews.review_answer_timestamp
            ,products.product_category_name_english
            ,orders.order_status
            ,reviews.review_score
            ,orders.price
            ,orders.freight_value
            from orders 
            left join products on products.product_id=orders.order_id 
            left join reviews on reviews.order_id = orders.order_id 
                    )
select * from final
