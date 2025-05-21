select *
from {{ ref('fct_orders',v=2) }}