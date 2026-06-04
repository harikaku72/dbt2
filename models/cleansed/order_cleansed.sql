{{
    config(materialized='table',schema='cleansed')
            
}}
select  *,"{{ var('domain') }}" as domain
from  {{ source('raw','orders') }} 


