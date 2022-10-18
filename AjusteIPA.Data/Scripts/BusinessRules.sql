/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [idReclamacion]
      ,[NumReclamacion]
      ,[NumeroIPA]
      ,[NumeroPCP]
      ,[NombrePCP]
      ,[Tier]
      ,[Cuenta]
      ,[NumeroContrato]
      ,[NombreAsegurado]
      ,[Edad]
      ,[FechaServicio]
      ,[FechaPago]
      ,[TipoServicio]
      ,[LugarServicio]
      ,[NumeroServicio]
      ,[CargoTotal]
      ,[ICD9]
      ,[ICD10]
      ,[IdCodigoCatastrofico]
      ,[Especialidad]
      ,[Municipio]
      ,[CantidadPagada]
      ,[EstatusAjuste]
      ,[CantidadAjustada]
      ,[FechaAjuste]
      ,[EstatusReclamacion]
      ,[IDUsuario]
      ,[Comentarios]
  FROM [AjusteIpaDB1].[dbo].[Reclamaciones]

Select *
FROM [AjusteIpaDB1].[dbo].[Reclamaciones]

/*
Paso 1: Select (...Boton Cargar Reclamaciones Para Ajustar) Select * from [dbo].[Reclamaciones] Where [EstatusReclamacion] == "Pendiente" 

Boton Ajustar esta disable hasta que se cargue la tabla 
Paso 2: Verificar NumeroReclamacion existe en [dbo].[LogReclamacionesAjustadas]
Si existe 
	- Update al campo [EstatusAjuste] from [dbo].[Reclamaciones] ==> 'Denegado' 
	- Update al campo [EstatusReclamacion] == "Duplicado"
Paso 3: 
 [EstatusReclamacion] == "Pendiente" (default value) 
-- If [NumeroContrato] Not Exists [dbo].[RegistroCatastrofico] Then  ==> EstatusAjuste = Denegado 
If Not Null 
	,t1.[NumeroIPA]
    ,t1.[NumeroContrato]
    ,t1.[Especialidad] 
&&  [NumeroContrato] Exists [dbo].[RegistroCatastrofico] Then  ==> EstatusAjuste = Aceptado 
 
 ----------------------------



*/

-- Verify not exist in  [dbo].[LogReclamacionesAjustadas]
-- Select (Load Boton Ajustar)
/*
Y si el campo de idReclamacion de la tabla de Reclamaciones no existe 
en la tabla de LogReclamacionesAjustadas.  (Si ya existe, debe ser Denegado y el EstatusReclamacion debe ser Duplicado)
*/

/*
	
insert into [dbo].[LogReclamacionesAjustadas]
select * from [dbo].[Reclamaciones]
where EstatusReclamacion = 'Procesada'

Transfer (Boton Transferir)
*/

-- Reclamacion sin NumeroIPA = NULL || [NumeroContrato] || [Especialidad] ==> EstatusAjuste = Denegado 
SELECT t1.idReclamacion
	  ,t1.[NumeroIPA]
      ,t1.[NumeroContrato]
      ,t1.[Especialidad] 
FROM [dbo].[Reclamaciones] t1
LEFT JOIN [dbo].[IPA] t2 ON t2.NumeroIPA = t1.NumeroIPA
WHERE t1.NumeroIPA IS NULL




















