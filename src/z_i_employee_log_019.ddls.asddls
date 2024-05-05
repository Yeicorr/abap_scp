@AbapCatalog.sqlViewName: 'ZV_EMPL_LOG_019'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
//@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Employee'
define root view Z_I_EMPLOYEE_LOG_019
  as select from zemployee_log_19 as Employee
{
  key e_number       as E_Number,
      e_name         as E_Name,
      e_department   as E_Department,
      status         as Status,
      job_title      as Job_Title,
      start_date     as Start_Date,
      end_date       as End_Date,
      email          as Email,
      m_number       as M_Number,
      m_name         as M_Name,
      m_department   as M_Department,
      crea_date_time as Crea_Date_Time,
      crea_uname     as Crea_Uname,
      lchg_date_time as Lchg_Date_Time,
      lchg_uname
}
