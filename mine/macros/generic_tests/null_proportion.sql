{% macro test_null_proportion(model, column_name, maximum) %}

with validation as (
  select
    sum(case when {{ column_name }} is null then 1.0 else 0.0 end) / cast(count(*) as numeric) as null_proportion
  from {{ model }}
)
,validation_errors as (
  select
    null_proportion
  from validation
  where null_proportion > {{ maximum }}
)
select
  *
from validation_errors

{% endmacro %}
