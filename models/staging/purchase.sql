with
source as (

    select * from {{ source('erp', 'purchase') }}

),

renamed as (

    select

        cast(source.id as integer) as purchase_id,
        cast(source.store as integer) as store_id,
        source.total,
        cast(source.customer as integer) as customer_id,
        safe_cast(source.created_at as timestamp) as created_at,
        cast(source.coupon_applied as integer) as coupon_applied,
        source.promo_discount,
        source.manual_discount

    from source

)

select * from renamed
