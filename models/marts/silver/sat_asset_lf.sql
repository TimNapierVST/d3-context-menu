{{config(materialized='incremental')}}
{%- set yaml_metadata -%}
source_model: int_dv_asset__lf
src_pk: ASSET_NK
src_hashdiff: ASSET_HASHDIFF
src_payload:
  - INCOME_AMOUNT
  - PROPERTY_TYPE
src_ldts: LOAD_TS
src_source: SOURCE_SYSTEM
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ dbtvault.sat(src_pk=metadata_dict["src_pk"],
                src_hashdiff=metadata_dict["src_hashdiff"],
                src_payload=metadata_dict["src_payload"],
                src_eff=metadata_dict["src_eff"],
                src_ldts=metadata_dict["src_ldts"],
                src_source=metadata_dict["src_source"],
                source_model=metadata_dict["source_model"]) }}