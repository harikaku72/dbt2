{{
    config(materialized='incremental',schema='cleansed') 
    }}
select 
customer_id,
first_name,
last_name,			
email,		
replace(phone,'x','') as phone,		
city,			
state,			
country	,		
created_at	
from  {{ source('raw','customers') }} 

{% if is_incremental() %}
where created_at > 
(select max(created_at) from {{ this }})
{% endif %}