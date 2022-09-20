with calendar as ({{ dbt_utils.date_spine(
    datepart="month",
    start_date="cast('2016-10-01' as  date )",
    end_date="cast('2018-11-01' as date )"
        )
 }} )
,formatted_calendar as (
    select  format_date("%b-%Y", date_month) AS month_year
    from calendar
)
,products_w_large_sample as  (
    select 
    count(review_id) as reviews_total
    ,product_category_name_english
    from {{ref ('int_reviews')}}
    where cast(review_answer_timestamp as date)  <= DATE_ADD("2018-10-29", interval -365 day)    
    group by product_category_name_english
    -- there are ways to do this but since the data is static i'll just write in the max date of reviews 
    having 
    count(review_id)  >= 30 
) 
,reviews as (
    select 
    review_answer_sk
    ,review_id
    ,order_id
    ,review_creation_date
    ,format_date("%b-%Y", review_answer_timestamp) as formatted_review_time
    ,review_answer_timestamp
    ,product_category_name_english
    ,review_score_1
    ,review_score_2
    ,review_score_3
    ,review_score_4
    ,review_score_5
    from {{ref ('int_reviews')}}
)
, spined_reviews as ( 
    select 
    reviews.review_answer_sk
    ,reviews.product_category_name_english
    ,formatted_calendar.month_year
    ,reviews.review_score_1
    ,reviews.review_score_2
    ,reviews.review_score_3
    ,reviews.review_score_4
    ,reviews.review_score_5
    from reviews 
    left join formatted_calendar on formatted_calendar.month_year=reviews.formatted_review_time
    right join products_w_large_sample on products_w_large_sample.product_category_name_english = reviews.product_category_name_english
    )
,aggregated_reviews as ( 
    select 
    spined_reviews.product_category_name_english
    ,spined_reviews.month_year
    ,count(spined_reviews.review_answer_sk) as count_reviews
    ,sum(spined_reviews.review_score_1) as count_reviews_score_1
    ,sum(spined_reviews.review_score_2) as count_reviews_score_2
    ,sum(spined_reviews.review_score_3) as count_reviews_score_3 
    ,sum(spined_reviews.review_score_4) as count_reviews_score_4
    ,sum(spined_reviews.review_score_5) as count_reviews_score_5
    from spined_reviews
    group by 1,2
    order by 2 desc
    ) 

select * from aggregated_reviews
