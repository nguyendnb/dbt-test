with source as (

    select * from {{ source('erp', 'store') }}

),

renamed as (

    select

        cast(id as integer) as store_id,
        city as store_city,
        state as store_state,
        address,
        description

    from source

)

select * from renamed
