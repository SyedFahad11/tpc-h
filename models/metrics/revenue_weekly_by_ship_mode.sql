
-- models/metrics/revenue_weekly_by_ship_mode.sql
{{ config(materialized='table') }}

with src as (
    select order_date, ship_mode, gross_item_sales_amount
    from {{ ref('fct_order_items') }}
)
select
    date_trunc('week', order_date) as metric_time__week,
    ship_mode,
    sum(gross_item_sales_amount) as total_revenue
from src
group by 1, 2
