{{ config(
    materialized='view',
    tags=['staging', 'employees']
) }}

select
    empno as employee_number,
    ename as employee_name,
    job as job_title,
    mgr as manager_id,
    hiredate as hire_date,
    sal as annual_salary,
    comm as annual_commission,
    deptno as department_number,
    last_updated
from {{ source('raw_data', 'employees') }}  -- ✅ This will now point to PHANI.RAW_DATA.EMPLOYEES