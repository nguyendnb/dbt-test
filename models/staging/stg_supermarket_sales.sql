{{ config(materialized='table') }}

with source as (

    select * from {{ source('supermarket', 'supermarket_sales')}}

),

final as (

    select

        cast(invoice_id as string) as invoice_id,
        cast(branch as string) as branch,
        cast(city as string) as city,
        cast(customer_type as string) as customer_type,
        cast(gender as string) as gender,
        cast(product_line as string) as product_line,
        cast(unit_price as decimal) as unit_price,
        cast(quantity as int) as quantity,
        cast(tax_5_ as decimal) as total_tax,
        cast(total as decimal) as total_amount,
        cast(`date` as date) as sales_date,
        cast(`time` as string) as sales_time,
        cast(payment as string) as payment_type

    from source

)

select * from final