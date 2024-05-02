@EndUserText.label: 'Interface BookingSuppl'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity zi_bookingsuppl_268_019 as projection on ZR_BOOKINGSUPPL_268_019
{
    key travel_id,
    key booking_id,
    key booking_supplement_id,
//    @ObjectModel.text.element:['SupplementDescription']
    supplement_id,
//    _SupplementText.Description as SuplementDescription : localized,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    price as Price,
//    @Semantics.currencyCode: true
    CurrencyCode,
    last_changed_at,
    /* Associations */
    _Travel: redirected to ZI_TRAVEL_268_19,
    _Booking: redirected to parent zi_booking_268_19,
    _Product,
    _SupplementText
}
