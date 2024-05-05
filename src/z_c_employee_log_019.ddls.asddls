//@AbapCatalog.sqlViewName: ''
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@EndUserText.label: 'Employee Projection'
//@AccessControl.authorizationCheck: #CHECK "Comenta por WARNING
@Metadata.allowExtensions: true
define root view entity Z_C_EMPLOYEE_LOG_019
  as projection on Z_I_EMPLOYEE_LOG_019
{
      @ObjectModel.text.element: [ 'EmployeeName' ]
  key E_Number       as EmployeeNumber,
      E_Name         as EmployeeName,
      E_Department   as EmployeeDepartment,
      Status         as EmployeeStatus,
      Job_Title      as JobTitle,
      Start_Date     as StartDate,
      End_Date       as EndDate,
      Email          as Email,
      @ObjectModel.text.element: [ 'ManagerName' ]
      M_Number       as ManagerNumber,
      M_Name         as ManagerName,
      M_Department   as ManagerDepartment,
      @Semantics.user.createdBy: true
      Crea_Date_Time as CreatedOn,
      Crea_Uname     as CreatedBy,
      @Semantics.user.lastChangedBy: true
      Lchg_Date_Time as ChangedOn,
      lchg_uname     as ChagedBy
}
