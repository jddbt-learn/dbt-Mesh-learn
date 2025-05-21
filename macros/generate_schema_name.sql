{% macro generate_schema_name(customer_schema_name,node) -%}

    {%- set default_schema=target.schema -%}

    {%- if customer_schema_name is none -%}
        {{ default_schema}}
{#
    {% elsif  target.name in ['product'] %}
#}        
    {% elif env_var('DBT_MY_VAR') in  ['prod','product'] %}
        {{ customer_schema_name|trim }}
    {%- else -%}
        {{ default_schema }}_{{customer_schema_name | trim }}
    {%- endif -%}
    
{%- endmacro %}