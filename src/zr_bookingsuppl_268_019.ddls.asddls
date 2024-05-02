@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_BOOKINGSUPPL_268_019 as select from zbooksuppl_log19 as BookingSupplement
association to parent ZR_BOOKING_268_019 as _Booking on $projection.travel_id = _Booking.TravelId
and $projection.booking_id = _Booking.BookingId
association [1..1] to ZR_TRAVEL_268_019 as _Travel on $projection.travel_id = _Travel.travel_id
association [1..1] to /DMO/I_Supplement as _Product on $projection.supplement_id = _Product.SupplementID
association [1..*] to /DMO/I_SupplementText as _SupplementText on $projection.supplement_id = _SupplementText.SupplementID
{
    key travel_id,
    key booking_id,
    key booking_supplement_id,
    supplement_id,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    price,
    BookingSupplement.currency_code as CurrencyCode,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    _Travel.last_changed_at,
_Booking,
_Travel,
_Product,
_SupplementText
}
