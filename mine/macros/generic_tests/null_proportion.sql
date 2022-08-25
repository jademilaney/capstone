{% macro test_null_proportion(model) %}

{% set column_name = kwargs.get('column_name', kwargs.get('arg')) %}
{% set at_most = kwargs.get('at_most', kwargs.get('arg', 1)) %}

with validation as (
  select
    sum(case when {{ column_name }} is null then 1.0 else 0.0 end) / cast(count(*) as numeric) as null_proportion
  from {{ model }}
)
,validation_errors as (
  select
    null_proportion
  from validation
  where null_proportion > {{ at_most }}
)
select
  *
from validation_errors

{% endmacro %}
