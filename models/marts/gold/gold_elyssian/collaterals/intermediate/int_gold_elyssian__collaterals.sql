with
    business_concept as (
        select
            hub_asset.asset_nk              as ORIGINCOLLATERALID,
            'template'                      as REPORTING_DATE,
            'template'                      as ORIGINSYSTEMID,
            sat_asset_lf.property_type      as COLLATERALTYPE,
            'template'                      as ORIGINCOUNTERPARTYID,
            'template'                      as CURRENCY,
            sat_asset_lf.income_amount      as COLLATERALAMOUNT,
            'template'                      as APPRAISALDATE

        from
            {{ ref("hub_asset")}}
        left_join
            {{ ref("sat_asset_lf")}} 
            on 
                hub_asset.asset_hk = sat_asset_lf.asset_hk
    ),
    final as (
        select
            ORIGINCOLLATERALID,
            REPORTINGDATE,
            ORIGINSYSTEMID,
            COLLATERALTYPE,
            ORIGINCOUNTERPARTYID,
            CURRENCY,
            COLLATERALAMOUNT,
            APPRAISALDATE
        from
            business_concept
    )
select
    *
from
    final