
{{
    config(materialized='table',
    alias = "depts")
}}

select *
from demo_db.demo_schema.dept /* where dno =  {{ var('dno') }} */
