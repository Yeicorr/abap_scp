CLASS lcl_buffer DEFINITION.
  PUBLIC SECTION.
    CONSTANTS: created TYPE c LENGTH 1 VALUE 'C',
               updated TYPE c LENGTH 1 VALUE 'U',
               deleted TYPE c LENGTH 1 VALUE 'D'.
    TYPES: BEGIN OF ty_buffer_master.
             INCLUDE TYPE zhcm_master_019 AS data.
    TYPES:   flag TYPE c LENGTH 1,
           END OF ty_buffer_master.
    TYPES: tt_master TYPE SORTED TABLE OF ty_buffer_master WITH UNIQUE KEY e_number.
    CLASS-DATA mt_buffer_master TYPE tt_master.
ENDCLASS.

CLASS lhc_HCM_Master DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE HCM_Master.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE HCM_Master.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE HCM_Master.

    METHODS read FOR READ
      IMPORTING keys FOR READ HCM_Master RESULT result.

ENDCLASS.

CLASS lhc_HCM_Master IMPLEMENTATION.

  METHOD create.
    GET TIME STAMP FIELD DATA(lv_time_stamp).
    DATA(lv_uname) = cl_abap_context_info=>get_user_technical_name( ).
    SELECT MAX( e_number ) FROM zhcm_master_019
    INTO @DATA(lv_max_employee_number).
    LOOP AT entities INTO DATA(ls_entities).
      ls_entities-%data-creadatetime = lv_time_stamp.
      ls_entities-%data-creauname = lv_uname.
      ls_entities-%data-enumber = lv_max_employee_number + 1.
      INSERT VALUE #( flag = lcl_buffer=>created
      "data = CORRESPONDING #( ls_entities-%data )
      "       ) INTO TABLE lcl_buffer=>mt_buffer_master.
       data-e_name = ls_entities-%data-EName
       data-e_department = ls_entities-%data-edepartment
       data-job_title = ls_entities-%data-JobTitle
       data-start_date = ls_entities-%data-startdate
       data-end_date = ls_entities-%data-enddate
       data-m_number = ls_entities-%data-mnumber
       data-m_name = ls_entities-%data-mname
       data-m_department = ls_entities-%data-mdepartment
       data-e_number = ls_entities-%data-ENumber
       data-crea_date_time = ls_entities-%data-creadatetime
       data-crea_uname = ls_entities-%data-creauname
         ) INTO TABLE lcl_buffer=>mt_buffer_master.
      IF NOT ls_entities-%cid IS INITIAL.
        INSERT VALUE #( %cid = ls_entities-%cid
        enumber = ls_entities-ENumber ) INTO TABLE mapped-hcm_master.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD update.
    GET TIME STAMP FIELD DATA(lv_time_stamp).
    DATA(lv_uname) = cl_abap_context_info=>get_user_technical_name( ).
    LOOP AT entities INTO DATA(ls_entities).
      SELECT SINGLE * FROM zhcm_master_019
      WHERE e_number EQ @ls_entities-%data-enumber
      INTO @DATA(ls_ddbb).
      ls_entities-%data-lchgdatetime = lv_time_stamp.
      ls_entities-%data-lchg_uname = lv_uname.
      INSERT VALUE #( flag = lcl_buffer=>updated
      data = VALUE #( e_number = ls_entities-%data-enumber
      e_name = COND #( WHEN ls_entities-%control-ename EQ if_abap_behv=>mk-on
      THEN ls_entities-%data-ename
      ELSE ls_ddbb-e_name )
      e_department = COND #( WHEN ls_entities-%control-edepartment EQ if_abap_behv=>mk-on
      THEN ls_entities-%data-edepartment
      ELSE ls_ddbb-e_department )
      status = COND #( WHEN ls_entities-%control-status EQ if_abap_behv=>mk-on
      THEN ls_entities-%data-status
      ELSE ls_ddbb-status )
      job_title = COND #( WHEN ls_entities-%control-jobtitle EQ if_abap_behv=>mk-on
      THEN ls_entities-%data-jobtitle
      ELSE ls_ddbb-job_title )
      start_date = COND #( WHEN ls_entities-%control-startdate EQ if_abap_behv=>mk-on
      THEN ls_entities-%data-startdate
      ELSE ls_ddbb-start_date )
      end_date = COND #( WHEN ls_entities-%control-enddate EQ if_abap_behv=>mk-on
      THEN ls_entities-%data-enddate
      ELSE ls_ddbb-end_date )
      email = COND #( WHEN ls_entities-%control-email EQ if_abap_behv=>mk-on
      THEN ls_entities-%data-email
      ELSE ls_ddbb-email )
      m_number = COND #( WHEN ls_entities-%control-mnumber EQ if_abap_behv=>mk-on
      THEN ls_entities-%data-mnumber
      ELSE ls_ddbb-m_number )
      m_name = COND #( WHEN ls_entities-%control-mname EQ if_abap_behv=>mk-on
      THEN ls_entities-%data-mname
      ELSE ls_ddbb-m_name )
      m_department = COND #( WHEN ls_entities-%control-mdepartment EQ if_abap_behv=>mk-on
      THEN ls_entities-%data-mdepartment
      ELSE ls_ddbb-m_department )
      crea_date_time = ls_ddbb-crea_date_time
      crea_uname = ls_ddbb-crea_uname
      ) ) INTO TABLE lcl_buffer=>mt_buffer_master.
      IF NOT ls_entities-enumber IS INITIAL.
        INSERT VALUE #( %cid = ls_entities-%data-enumber
        enumber = ls_entities-%data-enumber ) INTO TABLE mapped-hcm_master.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD delete.
    LOOP AT keys INTO DATA(ls_keys).
      INSERT VALUE #( flag = lcl_buffer=>deleted
    data = VALUE #( e_number = ls_keys-%key-enumber ) ) INTO TABLE lcl_buffer=>mt_buffer_master.
      IF NOT ls_keys-enumber IS INITIAL.
        INSERT VALUE #( %cid = ls_keys-%key-enumber
        enumber = ls_keys-%key-enumber ) INTO TABLE mapped-hcm_master.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_Z_I_HCM_MASTER_019 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_Z_I_HCM_MASTER_019 IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
    DATA: lt_data_created TYPE STANDARD TABLE OF zhcm_master_019,
          lt_data_updated TYPE STANDARD TABLE OF zhcm_master_019,
          lt_data_deleted TYPE STANDARD TABLE OF zhcm_master_019.
    lt_data_created = VALUE #( FOR <row> IN lcl_buffer=>mt_buffer_master
    WHERE ( flag = lcl_buffer=>created ) ( <row>-data ) ).
    IF NOT lt_data_created IS INITIAL.
      INSERT zhcm_master_019 FROM TABLE @lt_data_created.
    ENDIF.

    lt_data_updated = VALUE #( FOR <row> IN lcl_buffer=>mt_buffer_master
    WHERE ( flag = lcl_buffer=>updated ) ( <row>-data ) ).
    IF NOT lt_data_updated IS INITIAL.
      UPDATE zhcm_master_019 FROM TABLE @lt_data_updated.
    ENDIF.

    lt_data_deleted = VALUE #( FOR <row> IN lcl_buffer=>mt_buffer_master
    WHERE ( flag = lcl_buffer=>deleted ) ( <row>-data ) ).
    IF NOT lt_data_deleted IS INITIAL.
      DELETE zhcm_master_019 FROM TABLE @lt_data_deleted.
    ENDIF.
    CLEAR lcl_buffer=>mt_buffer_master.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
