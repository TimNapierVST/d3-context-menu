{{ config(
    materialized='incremental',
    unique_key='ASSET_HK')
}}
{%- set yaml_metadata -%}
source_model:
    - 'int_dv_asset__lf'
src_pk: 'ASSET_HK'
src_nk: 'ASSET_NK'
src_ldts: 'LOAD_TS'
src_source: 'SOURCE_SYSTEM'
{%- endset -%}
{% set metadata_dict = fromyaml(yaml_metadata) %}
{{ dbtvault.hub(src_pk=metadata_dict['src_pk'], 
    src_nk=metadata_dict['src_nk'],  
    src_ldts=metadata_dict['src_ldts'],
    src_source=metadata_dict['src_source'], 
    source_model=metadata_dict['source_model']
) }}
