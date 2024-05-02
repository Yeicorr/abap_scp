//@AbapCatalog.sqlViewName: ''
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@EndUserText.label: 'HCM_Master Projection'
//@AccessControl.authorizationCheck: #CHECK "Comenta por WARNING
@Metadata.allowExtensions: true
define root view entity Z_C_HCM_MASTER_019
  as projection on Z_I_HCM_MASTER_019
{
      @ObjectModel.text.element: [ 'EmployeeName' ]
  key ENumber      as EmployeeNumber,
      EName        as EmployeeName,
      EDepartment  as EmployeeDepartment,
      Status       as EmployeeStatus,
      JobTitle     as JobTitle,
      StartDate    as StartDate,
      EndDate      as EndDate,
      Email        as Email,
      @ObjectModel.text.element: [ 'ManagerName' ]
      MNumber      as ManagerNumber,
      MName        as ManagerName,
      MDepartment  as ManagerDepartment,
      @Semantics.user.createdBy: true
      CreaDateTime as CreatedOn,
      CreaUname    as CreatedBy,      
      @Semantics.user.lastChangedBy: true
      LchgDateTime as ChangedOn,
      lchg_uname   as ChagedBy
}
