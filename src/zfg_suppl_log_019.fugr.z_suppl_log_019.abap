FUNCTION z_suppl_log_019.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IT_SUPPLEMENTS) TYPE  ZTT_SUPPL_LOG_019
*"     REFERENCE(IV_OP_TYPE) TYPE  ZDE_FLAG_019
*"  EXPORTING
*"     REFERENCE(EV_UPDATED) TYPE  ZDE_FLAG_019
*"----------------------------------------------------------------------
  CHECK NOT it_supplements IS INITIAL.
  CASE iv_op_type.
    WHEN 'C'.
      INSERT zbooksuppl_log19 FROM TABLE @it_supplements.
    WHEN 'U'.
      UPDATE zbooksuppl_log19 FROM TABLE @it_supplements.
    WHEN 'D'.
      DELETE zbooksuppl_log19 FROM TABLE @it_supplements.
  ENDCASE.
  IF sy-subrc EQ 0.
    ev_updated = abap_true.
  ENDIF.

ENDFUNCTION.
