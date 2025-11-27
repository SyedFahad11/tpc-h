
-- models/metrics/revenue_weekly_by_ship_mode.sql
{{ config(materialized='table') }}

{{ dbt_metric_utils_materialize(
    metrics=['total_revenue'],
    group_by=['metric_time__week', 'ship_mode']
) }}
