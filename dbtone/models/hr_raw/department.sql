
{{
    config(materialized='view',
    schema="hr_raw",database="dbt_database", alias = "department")
}}

select dno, 
    dname, 
    loc 
from demo_db.demo_schema.dept