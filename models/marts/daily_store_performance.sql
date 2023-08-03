{{ config(materialized='table') }}

with

store as (

    select * from {{ ref('store') }}

),

purchase as (

    select * from {{ ref('purchase') }}

),

final as (

    select

        store.store_id,
        store.description,
        date(purchase.created_at) as purchase_date,
        sum(purchase.total) as total_revenue

    from purchase
    left join store
        on purchase.store_id = store.store_id
    group by 1, 2, 3

)

select * from final