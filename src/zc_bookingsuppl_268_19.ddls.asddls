@EndUserText.label: 'Comsuption Booking Supply'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity zc_bookingsuppl_268_19 as projection on ZR_BOOKINGSUPPL_268_019
{
    key travel_id,
    key booking_id,
    key booking_supplement_id,
    @Search.defaultSearchElement: true 
    @ObjectModel.text.element: [ 'SupplementDescription' ]
    @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Supplement_StdVH', element: 'supplement_id'}, 
     additionalBinding: [ 
                                      //   {localElement: 'BookSupplPrice', element: 'price', usage:#RESULT},     
                                         {localElement: 'CurrencyCode', element: 'CurrencyCode', usage:#RESULT}],   
                                          useForValidation: true }]
    supplement_id,
    _SupplementText.Description as SupplementDescription: localized,
    price,
   @Consumption.valueHelpDefinition: [{ entity: {name: 'I_CurrencyStdVH', element: 'Currency'}, useForValidation: true }]
    CurrencyCode,
    last_changed_at,
    /* Associations */
    _Booking: redirected to parent ZC_BOOKING_268_19,
    _Product,
    _SupplementText,
    _Travel: redirected to zc_travel_268_019
}
