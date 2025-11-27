
{% snapshot tpch_part_snapshot %}

{{ config(
    target_database='tpc_h',
    target_schema='snapshots',
    unique_key='p_partkey',
    strategy='check',
    check_cols=[
      'p_name',
      'p_mfgr',
      'p_brand',
      'p_type',
      'p_size',
      'p_container',
      'p_retailprice',
      'p_comment'
    ],

    invalidate_hard_deletes=True
) }}

select * from {{ source('tpch', 'part') }}

{% endsnapshot %}
