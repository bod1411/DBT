{% snapshot employee_snapshot_check %}
    {{
        config(
            target_schema='snapshots',
            unique_key='empno',
            strategy='check',
            check_cols=['ENAME', 'JOB', 'MGR', 'HIREDATE', 'SAL', 'COMM', 'DEPTNO']
        )
    }}
    select 
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno,
        last_updated
    from {{ source('raw_data', 'employees') }}
{% endsnapshot %}