{% snapshot customer_snapshot %}
{{ config(schema='gold', unique_key='customer_id',strategy='check',check_cols=['first_name','last_name','email', 'phone','city','country']) }}

select * from {{ source('raw','customers') }}

{% endsnapshot %}
