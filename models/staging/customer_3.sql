with source as (

    select * from {{ source('erp', 'customer') }}

),

renamed as (

    select
        cast(id as integer) as customer_id,
        cast(dob as timestamp) as date_of_birth,
        city as customer_city,
        email as customer_email,
        last_name,
        first_name

    from source

)

select * from renamed
