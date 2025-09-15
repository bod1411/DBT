{% snapshot employee_snapshot %}
    {{
        config(
            target_schema='snapshots',
            unique_key='empno',
            strategy='timestamp',
            updated_at='last_updated',
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