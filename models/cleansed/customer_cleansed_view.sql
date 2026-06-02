{{
    config(materialized='view',schema='cleansed')
            
}}
select 

customer_id,
first_name,
last_name,			
email,		
phone,
city,			
state,			
country	,		
created_at	

from  {{ ref('customer_cleansed') }} 
