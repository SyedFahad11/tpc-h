
{% snapshot tpch_customer_snapshot %}

{{ config(
    target_database='tpc_h',
    target_schema='snapshots',
    unique_key='c_custkey',
    strategy='check',
    check_cols=[
      'c_name',
      'c_address',
      'c_nationkey',
      'c_phone',
      'c_acctbal',
      'c_mktsegment',
      'c_comment'
    ],
   
    invalidate_hard_deletes=True
) }}

select * from {{ source('tpch', 'customer') }}

{% endsnapshot %}
