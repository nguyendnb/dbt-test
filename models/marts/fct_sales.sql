{{ config(materialized='table') }}

with supermarket_sales as (

    select * from {{ ref('stg_supermarket_sales') }}

),

final as (

    select * from supermarket_sales

)

select * from final