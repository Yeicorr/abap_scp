    CLASS zcl_virt_elem_log_19 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

      PUBLIC SECTION.
        INTERFACES if_sadl_exit_calc_element_read.
      PROTECTED SECTION.
      PRIVATE SECTION.
    ENDCLASS.



    CLASS zcl_virt_elem_log_19 IMPLEMENTATION.
      METHOD if_sadl_exit_calc_element_read~get_calculation_info.
        IF iv_entity = 'ZC_TRAVEL_268_019'.
          LOOP AT it_requested_calc_elements INTO DATA(LS_CALC_elements).
            IF ls_calc_elements = 'DISCOUNTPRICE'.
              APPEND 'TOTAL_PRICE' TO et_requested_orig_elements.
            ENDIF.
          ENDLOOP.
        ENDIF.
      ENDMETHOD.
      METHOD if_sadl_exit_calc_element_read~calculate.
        DATA: LT_ORIGINAL_dATA TYPE STANDARD TABLE OF zc_travel_268_019 WITH DEFAULT KEY.
        LT_ORIGINAL_dATA = CORRESPONDING #( IT_ORIGINAL_dATA ).
        LOOP AT LT_ORIGINAL_dATA ASSIGNING FIELD-SYMBOL(<ls_original_data>).
          <ls_original_data>-DiscountPrice = <ls_original_data>-total_price - ( <ls_original_data>-total_price * ( 1 / 10 ) ).
        ENDLOOP.
        ct_calculated_data = CORRESPONDING #( lt_original_data ).
      ENDMETHOD.

    ENDCLASS.
