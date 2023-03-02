with
    intermediate as (
        SELECT
            ORIGINCOLLATERALID,
            REPORTINGDATE,
            ORIGINSYSTEMID,
            COLLATERALTYPE,
            ORIGINCOUNTERPARTYID,
            CURRENCY,
            COLLATERALAMOUNT,
            APPRAISALDATE
        FROM
            {{ ref("int_gold_elyssian__collaterals")}}
    ),
    final as (
        SELECT
            ORIGINCOLLATERALID,
            REPORTINGDATE,
            ORIGINSYSTEMID,
            COLLATERALTYPE,
            ORIGINCOUNTERPARTYID,
            CURRENCY,
            COLLATERALAMOUNT,
            APPRAISALDATE
        FROM 
            intermediate   
    )
select 
    *
FROM
    final