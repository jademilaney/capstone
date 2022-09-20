with reviews as ( 
    select * from {{ref ('fct_order_items')}}
)
,joined as ( 
    {% set review_scores = [1,2,3,4,5]%}
    select 
        {{dbt_utils.surrogate_key(['review_id','review_answer_timestamp'])}} as review_answer_sk
        ,reviews.review_id
        ,reviews.order_id
        ,max(reviews.order_item_id) as count_items_in_order
        ,reviews.review_creation_date
        ,reviews.review_answer_timestamp
        ,reviews.product_category_name_english
        ,reviews.review_score
        {% for review_score in review_scores %}
        ,first_value(case when review_score = {{review_score}} then 1 else 0 end) over (partition by reviews.review_id order by reviews.review_answer_timestamp ) as review_score_{{review_score}}
        {% endfor %}
        from reviews
        group by 1,2,3,5,6,7,8
    )
select * from joined
