@EndUserText.label: 'Interface Travel'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_TRAVEL_268_19 
provider contract transactional_interface
as projection on ZR_TRAVEL_268_019
{
    key travel_id,
    agency_id,
    customer_id,
    begin_date,
    end_date,
    booking_fee,
    total_price,
    currency_code,
    description,
    overall_status,
    created_by,
    created_at,
    last_changed_by,
    last_changed_at,
    /* Associations */
    _Booking,
    _Agency,
    _Currency,
    _Customer
}
