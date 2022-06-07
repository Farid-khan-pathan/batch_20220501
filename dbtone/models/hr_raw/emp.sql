
{{
    config(materialized='view',
    schema="hr_raw",database="dbt_database")
}}

select 
    empno,
    ename,
    doj,
    deptno as dno,
    salary
from demo_db.demo_schema.emp