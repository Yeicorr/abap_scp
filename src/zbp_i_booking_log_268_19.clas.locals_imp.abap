CLASS lhc_Booking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS calculateTotalFlightPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Booking~calculateTotalFlightPrice.

    METHODS calculateTotalSupplimPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Booking~calculateTotalSupplimPrice.

    METHODS validateStatus FOR VALIDATE ON SAVE
      IMPORTING keys FOR Booking~validateStatus.

ENDCLASS.

CLASS lhc_Booking IMPLEMENTATION.

  METHOD calculateTotalFlightPrice.
    IF keys IS NOT INITIAL.
      zcl_aux_travel_del_log_019=>calculate_price( it_travel_id =
          VALUE #( FOR GROUPS <booking> OF booking_key IN keys
                      GROUP BY booking_key-TravelId WITHOUT MEMBERS ( <booking> ) ) ).
    ENDIF.
  ENDMETHOD.

  METHOD calculateTotalSupplimPrice.
  ENDMETHOD.

  METHOD validateStatus.
    READ ENTITY zr_travel_268_019\\Booking
      FIELDS ( BookingStatus )
      WITH VALUE #( FOR <row_key> IN keys ( %key = <row_key>-%key ) )
      RESULT DATA(lt_booking_result).

    LOOP AT lt_booking_result INTO DATA(ls_booking_result).
      CASE ls_booking_result-BookingStatus.
        WHEN 'N'.
        WHEN 'X'.
        WHEN 'B'.
        WHEN OTHERS.

          APPEND VALUE #( %key = ls_booking_result-%key ) TO failed-booking.
          APPEND VALUE #( %key = ls_booking_result-%key
                              %msg = new_message( id = 'Z_MC_TRAVEL_LOG_019'
                                                  number = '007'
                                                  v1 = ls_booking_result-BookingId
                                                  severity = if_abap_behv_message=>severity-error )
                              %element-BookingStatus = if_abap_behv=>mk-on  ) TO reported-booking.

      ENDCASE.

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
