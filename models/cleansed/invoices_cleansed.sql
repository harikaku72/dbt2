{{
    config(materialized='table',schema='cleansed', alias = 'invoices_vat_cleansed')
            
}}
select  *,"{{ var('domain') }}" as domain, round({{ calculate_vat('amount') }},2) as vat
from  {{ source('raw','invoices') }} 
