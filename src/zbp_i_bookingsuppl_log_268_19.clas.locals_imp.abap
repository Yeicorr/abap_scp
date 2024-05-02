CLASS lhc_Supplement DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS calculateTotalSupplimPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Supplement~calculateTotalSupplimPrice.

ENDCLASS.

CLASS lhc_Supplement IMPLEMENTATION.

  METHOD calculateTotalSupplimPrice.
    IF keys IS NOT INITIAL.
      zcl_aux_travel_del_log_019=>calculate_price( it_travel_id =
          VALUE #( FOR GROUPS <booking_suppl> OF booking_key IN keys
                      GROUP BY booking_key-travel_id WITHOUT MEMBERS ( <booking_suppl> ) ) ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_supplement DEFINITION INHERITING FROM
cl_abap_behavior_saver.
  PUBLIC SECTION.
    CONSTANTS: create TYPE string VALUE 'C',
               update TYPE string VALUE 'U',
               delete TYPE string VALUE 'D'.
  PROTECTED SECTION.
    METHODS save_modified REDEFINITION.
ENDCLASS.

CLASS lsc_supplement IMPLEMENTATION.

  METHOD save_modified.
    DATA: lt_supplements TYPE STANDARD TABLE OF
                     zbooksuppl_log19,
          lv_op_type     TYPE zde_flag_019,
          lv_updated     TYPE zde_flag_019.
    IF NOT create-supplement IS INITIAL.
      lt_supplements = CORRESPONDING #( create-supplement ).
      lv_op_type = lsc_supplement=>create.
    ENDIF.
    IF NOT update-supplement IS INITIAL.
      lt_supplements = CORRESPONDING #( update-supplement ).
      lv_op_type = lsc_supplement=>update.
    ENDIF.
    IF NOT delete-supplement IS INITIAL.
      lt_supplements = CORRESPONDING #( delete-supplement ).
      lv_op_type = lsc_supplement=>delete.
    ENDIF.
    IF NOT lt_supplements IS INITIAL.
      CALL FUNCTION 'Z_SUPPL_LOG_019'
        EXPORTING
          it_supplements = lt_supplements
          iv_op_type     = lv_op_type
        IMPORTING
          ev_updated     = lv_updated.
      IF lv_updated EQ abap_true.
* reported-supplement
      ENDIF.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
