@AbapCatalog.sqlViewName: 'ZV_HCM_LOG_019'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
//@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'HCM_Master'
define root view Z_I_HCM_MASTER_019
  as select from zhcm_master_019 as HCMMaster
{
  key e_number       as ENumber,
      e_name         as EName,
      e_department   as EDepartment,
      status         as Status,
      job_title      as JobTitle,
      start_date     as StartDate,
      end_date       as EndDate,
      email          as Email,
      m_number       as MNumber,
      m_name         as MName,
      m_department   as MDepartment,
      crea_date_time as CreaDateTime,
      crea_uname     as CreaUname,
      lchg_date_time as LchgDateTime,
      lchg_uname
}
