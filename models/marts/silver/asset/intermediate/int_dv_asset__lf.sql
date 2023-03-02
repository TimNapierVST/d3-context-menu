{{ config(materialized='view') }}
{%- set yaml_metadata -%}
source_model: stg_lendfast__asset
derived_columns:
    LOAD_TS:     CURRENT_TIMESTAMP()
hashed_columns: 
    ASSET_HK:     ASSET_NK
    ASSET_HASHDIFF:
        is_hashdiff: false
        columns:
            - INCOME_AMOUNT
            - PROPERTY_TYPE
{%- endset -%}
{% set metadata_dict = fromyaml(yaml_metadata) %}
{{ dbtvault.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=metadata_dict['ranked_columns']) }}