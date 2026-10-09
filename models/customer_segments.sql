{{ config(materialized='table', alias='customer_segments') }}

select
    customer_id,
    case
        when signup_date >= current_date - interval '30 days' then 'new'
        else 'established'
    end as customer_segment
from {{ source('cu_fixture', 'customer_profiles') }}
