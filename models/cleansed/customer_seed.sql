{{
    config(materialized='table',schema='cleansed')
            
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
created_at,
country_cd
from  {{ source('raw','customers') }} a left join {{ ref('country') }} c on a.country = c.country_name
