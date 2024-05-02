@EndUserText.label: 'Comsuption Booking'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZC_BOOKING_268_19 as projection on ZR_BOOKING_268_019
{
 key TravelId,
    @Search.defaultSearchElement: true 
 key BookingId,
 BookingDate,
    @ObjectModel.text.element: [ 'CustomerName' ]
    @Search.defaultSearchElement: true 
    @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Customer_StdVH', element: 'CustomerId'}, useForValidation: true }]
 CustomerId,
 _Customer.LastName as CustomerName,
 CarrierId,
  _Carrier.Name as CarrierName,
    @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Flight_StdVH', element: 'CarrierId'},
                                          additionalBinding: [ 
                                         {localElement: 'FlightDate', element: 'FlightDate', usage:#RESULT},                                         
                                         {localElement: 'FlightDate', element: 'FlightDate', usage:#RESULT},
                                         {localElement: 'ConnectionId', element: 'ConnectionId', usage:#RESULT},
                                         {localElement: 'FlightPrice', element: 'FlightPrice', usage:#RESULT},
                                         {localElement: 'CurrencyCode', element: 'CurrencyCode', usage:#RESULT}],
                                          useForValidation: true }]
 ConnectionId,
    @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Flight_StdVH', element: 'ConnectionId'},
                                          additionalBinding: [ 
                                         {localElement: 'FlightDate', element: 'FlightDate', usage:#RESULT},                                         
                                         {localElement: 'CarrierId', element: 'CarrierId', usage: #FILTER_AND_RESULT},                                         
                                         {localElement: 'FlightPrice', element: 'Price', usage:#RESULT},
                                         {localElement: 'CurrencyCode', element: 'CurrencyCode', usage:#RESULT}],
                                          useForValidation: true }] 
 FlightDate,
    @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Flight_StdVH', element: 'Price'},
                                          additionalBinding: [                                    
                                         {localElement: 'FlightDate', element: 'FlightDate', usage: #FILTER_AND_RESULT},  
                                         {localElement: 'CarrierId', element: 'CarrierId', usage: #FILTER_AND_RESULT},                                         
                                         {localElement: 'ConnectionId', element: 'ConnectionId', usage:#FILTER_AND_RESULT},     
                                         {localElement: 'CurrencyCode', element: 'CurrencyCode', usage:#RESULT}],
                                          useForValidation: true }] 
 FlightPrice,
   @Consumption.valueHelpDefinition: [{ entity: {name: 'I_CurrencyStdVH', element: 'Currency'}, useForValidation: true }]
 CurrencyCode,
 BookingStatus,
 LastChangeAt,
 /* Associations */
 _BookingSupplement: redirected to composition child zc_bookingsuppl_268_19,
 _Carrier,
 _Connection,
 _Customer,
 _Travel: redirected to parent zc_travel_268_019   
}
