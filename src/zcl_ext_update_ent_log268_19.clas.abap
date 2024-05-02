CLASS zcl_ext_update_ent_log268_19 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ext_update_ent_log268_19 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    MODIFY ENTITIES OF zr_travel_268_019
    ENTITY Travel
    UPDATE FIELDS ( agency_id description )
    WITH VALUE #( ( travel_id = '00000005'
                    agency_id = '070007'
                    description = 'New external Update'
                 ) )
                 FAILED DATA(failed)
                 REPORTED DATA(reported).

    READ ENTITIES OF zr_travel_268_019
    ENTITY Travel
    FIELDS  ( agency_id description )
    WITH VALUE #( ( travel_id = '00000005'
    ) )
    RESULT DATA(lt_travel_Data)
    FAILED failed
    REPORTED reported.

    COMMIT ENTITIES.

    IF failed IS INITIAL.
      out->write( 'Commit Succesfull' ).
    ELSE.
      out->write( 'Commit Failed' ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
