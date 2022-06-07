{{
    config(materialized='incremental', schema='sales_stage',unique_key='O_ORDERKEY',on_schema_change='fail')
}}

select a.O_ORDERKEY,
a.O_CUSTKEY,
a.O_ORDERSTATUS,
a.O_TOTALPRICE,
a.O_ORDERDATE,
a.O_ORDERPRIORITY,
a.O_CLERK,
a.O_SHIPPRIORITY,
a.O_COMMENT,
case when b.O_ORDERKEY is null then 'I' else 'U' end as CHG_FLG
from demo_db.demo_schema.ORDERS as a
left outer join {{ this }} b using(O_ORDERKEY)

{% if is_incremental() %}
where (
b.O_ORDERKEY is null 
or a.O_CUSTKEY <> b.O_CUSTKEY
or a.O_ORDERSTATUS <> b.O_ORDERSTATUS
or a.O_TOTALPRICE <> b.O_TOTALPRICE
or a.O_ORDERDATE <> b.O_ORDERDATE
or a.O_ORDERPRIORITY <> b.O_ORDERPRIORITY
or a.O_CLERK <> b.O_CLERK
or a.O_SHIPPRIORITY <> b.O_SHIPPRIORITY
or a.O_COMMENT <> b.O_COMMENT
)
{% endif %}
