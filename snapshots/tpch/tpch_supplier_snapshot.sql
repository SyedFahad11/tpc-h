{% snapshot tpch_supplier_snapshot %}
  {{ config(
      target_database='tpc_h',
      target_schema='snapshots',
      unique_key='s_suppkey',
      strategy='check',
      check_cols=['s_name','s_address','s_nationkey','s_phone','s_acctbal','s_comment']  
  ) }}

  select * from {{ source('tpch', 'supplier') }}
{% endsnapshot %}
