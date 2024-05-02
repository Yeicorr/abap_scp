@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Entity Root Travel'
define root view entity ZR_TRAVEL_268_019 as select from ztravel_268_19
//composition of target_data_source_name as _association_name
composition [0..*] of ZR_BOOKING_268_019 as _Booking
association [0..1] to /DMO/I_Agency as _Agency on $projection.agency_id = _Agency.AgencyID
association [0..1] to /DMO/I_Customer as _Customer on $projection.customer_id = _Customer.CustomerID
association [0..1] to I_Currency as _Currency on $projection.currency_code = _Currency.Currency
{
    
//    _association_name // Make association public
key travel_id,
agency_id,
customer_id,
begin_date,
end_date,
@Semantics.amount.currencyCode: 'currency_code'
booking_fee,
@Semantics.amount.currencyCode: 'currency_code'
total_price,
//@Semantics.currencyCode: true
currency_code,
description,
overall_status,
@Semantics.user.createdBy: true
created_by,
@Semantics.systemDateTime.createdAt: true
created_at,
@Semantics.user.lastChangedBy: true
last_changed_by,
@Semantics.systemDateTime.lastChangedAt: true
last_changed_at,
_Booking,
_Agency,
_Customer,
_Currency
}
