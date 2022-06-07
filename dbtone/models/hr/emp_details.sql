{{
    config(materialized='table',
    schema="hr",database="dbt_database", alias='employee_Details')
}}


with emp as (
    select * from {{ ref('emp') }}
),

dept as (
    select * from {{ ref('dept') }}
)
select
    dept.dno,
    dept.dname,
    emp.ename,
    emp.salary,
    emp.doj

from dept

left join emp using (dno)