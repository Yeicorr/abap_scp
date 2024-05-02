@EndUserText.label: 'Comsuption Travel'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity zc_travel_268_019
  provider contract transactional_query
  as projection on ZR_TRAVEL_268_019
{
          @Search.defaultSearchElement: true
  key     travel_id,
          @Search.defaultSearchElement: true
          @ObjectModel.text.element: [ 'AgencyName' ]
          @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Agency_StdVH', element: 'AgencyId'}, useForValidation: true }]
          agency_id,
          _Agency.Name       as AgencyName,
          @Search.defaultSearchElement: true
          @ObjectModel.text.element: [ 'CustomerName' ]
          @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Customer_StdVH', element: 'CustomerId'}, useForValidation: true }]
          customer_id,
          _Customer.LastName as CustomerName,
          begin_date,
          end_date,
          booking_fee,
          total_price,
          @Consumption.valueHelpDefinition: [{ entity: {name: 'I_CurrencyStdVH', element: 'Currency'}, useForValidation: true }]
          currency_code,
          description,
          @ObjectModel.text.element: [ 'CustomerName' ]
          @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Overall_Status_VH', element: 'overall_status'}, useForValidation: true }]
          overall_status,
          created_by,
          created_at,
          last_changed_by,
          last_changed_at,
          @Semantics.amount.currencyCode: 'currency_code'
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIRT_ELEM_LOG_19'
  virtual DiscountPrice : /dmo/total_price,
          /* Associations */
          _Booking,
          _Agency,
          _Currency,
          _Customer
}
