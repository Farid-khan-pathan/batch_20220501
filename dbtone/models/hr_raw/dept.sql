
{{
    config(materialized='table',
    alias = "dept")
}}

select *
from demo_db.demo_schema.dept /* where dno =  {{ var('dno') }} */