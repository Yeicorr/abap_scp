@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Booking'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_BOOKING_268_019 as select from zbooking_log_19
composition [0..*] of ZR_BOOKINGSUPPL_268_019 as _BookingSupplement
association to parent ZR_TRAVEL_268_019 as _Travel on $projection.TravelId = _Travel.travel_id
association [1..1] to /DMO/I_Customer as _Customer on $projection.CustomerId = _Customer.CustomerID
association [1..1] to /DMO/I_Carrier as _Carrier on $projection.CarrierId = _Carrier.AirlineID
association [1..*] to /DMO/I_Connection as _Connection on $projection.CarrierId = _Connection.AirlineID
{
    key travel_id as TravelId,
    key booking_id as BookingId,
    booking_date as BookingDate,
    customer_id as CustomerId,
    carrier_id as CarrierId,
    connection_id as ConnectionId,
    flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'Currencycode'
    flight_price as FlightPrice,
    currency_code as CurrencyCode,
    booking_status as BookingStatus,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    last_change_at as LastChangeAt,
    _Travel,
_BookingSupplement,
_Customer,
_Carrier,
_Connection
}
