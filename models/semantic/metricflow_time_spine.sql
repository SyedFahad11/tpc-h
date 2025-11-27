
with spine as (

  {{ dbt_utils.date_spine(
      datepart="day",
      start_date="to_date('2000-01-01')",
      end_date="current_date()"
  ) }}

)

select cast(date_spine as date) as date_day
