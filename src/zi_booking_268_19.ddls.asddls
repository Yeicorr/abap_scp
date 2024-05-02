@EndUserText.label: 'Interface Booking'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity zi_booking_268_19 as projection on ZR_BOOKING_268_019
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LastChangeAt,
    /* Associations */
    _BookingSupplement: redirected to composition child zi_bookingsuppl_268_019,
    _Carrier,
    _Connection,
    _Customer,
    _Travel: redirected to parent ZI_TRAVEL_268_19
}
