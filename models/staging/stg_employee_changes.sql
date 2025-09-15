{{ config(
    materialized='view',
    tags=['staging', 'audit']
) }}

select
    change_id,
    empno as employee_number,
    change_type,
    old_value,
    new_value,
    change_date,
    changed_by
from {{ source('raw_data', 'employee_changes') }}  -- ✅ Points to PHANI.RAW_DATA.EMPLOYEE_CHANGES