with
    source as (
        SELECT
            ID,
            INCOMEAMOUNT,
            PROPERTYTYPE
        FROM
            {{ source('lendfast','asset') }}
    ),
    final as (
        select
            id as asset_nk,
            incomeamount as income_amount,
            propertytype as property_type
        from 
            source
    )
select 
    *
from
    final
