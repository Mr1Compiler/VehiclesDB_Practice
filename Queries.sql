




create view VehicleMasterDetails as
SELECT        VehicleDetails.ID, VehicleDetails.MakeID, Makes.Make, VehicleDetails.ModelID, MakeModels.ModelName, VehicleDetails.SubModelID, SubModels.SubModelName, VehicleDetails.BodyID, Bodies.BodyName, 
                         VehicleDetails.Vehicle_Display_Name, VehicleDetails.Year, VehicleDetails.DriveTypeID, DriveTypes.DriveTypeName, VehicleDetails.Engine, VehicleDetails.Engine_CC, VehicleDetails.Engine_Cylinders, 
                         VehicleDetails.Engine_Liter_Display, VehicleDetails.FuelTypeID,FuelTypes.FuelTypeName, VehicleDetails.NumDoors
FROM            VehicleDetails INNER JOIN
                         Makes ON VehicleDetails.MakeID = Makes.MakeID INNER JOIN
                         MakeModels ON VehicleDetails.ModelID = MakeModels.ModelID AND Makes.MakeID = MakeModels.MakeID INNER JOIN
                         SubModels ON VehicleDetails.SubModelID = SubModels.SubModelID AND MakeModels.ModelID = SubModels.ModelID INNER JOIN
                         Bodies ON VehicleDetails.BodyID = Bodies.BodyID INNER JOIN
                         DriveTypes ON VehicleDetails.DriveTypeID = DriveTypes.DriveTypeID INNER JOIN
                         FuelTypes ON VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID

select count(*) as Number from VehicleDetails



select * from VehicleDetails
where Year between '1950' and '2000'


select count(*) as NumberOfVehicle from VehicleDetails
where Year between '1950' and '2000'






select Make, count(*) as Number from VehicleMasterDetails
where (Year between 1950 and 2000)
group by Make
order by Number desc


select count(*) as Number from VehicleDetails
inner join Makes on VehicleDetails.MakeID = Makes.MakeID
where Makes.Make = 'ford'



select count(*) as Number from VehicleDetails

select count(*) as Number from VehicleMasterDetails

select * from VehicleDetails
where MakeID = '411'




select count(*) from VehicleDetails
where MakeID = 136


select count(*) from VehicleMasterDetails
where Make = 'ford'

------------------------------------------ Problem 4 ------------------------------------------
select Makes.Make, count(*) as NumberOfVehicles from VehicleDetails 
inner join Makes on Makes.MakeID = VehicleDetails.MakeID
where (VehicleDetails.Year between 1950 and 2000)
group by Makes.Make
order by NumberOfVehicles desc
------------------------------------------------------------------------------------------------

------------------------------------------ Problem 6 ------------------------------------------
select Makes.Make, count(*) as NumberOfVehicles from VehicleDetails 
inner join Makes on Makes.MakeID = VehicleDetails.MakeID
where (VehicleDetails.Year between 1950 and 2000)
group by Makes.Make
having count(*) > 12000
order by NumberOfVehicles desc


select * from (
select Makes.Make, NumberOfVehicles = count(*)  from VehicleDetails 
inner join Makes on Makes.MakeID = VehicleDetails.MakeID
where (VehicleDetails.Year between 1950 and 2000)
group by Makes.Make
)R1
where NumberOfVehicles > 12000
------------------------------------------------------------------------------------------------



------------------------------------------ Problem 7 ------------------------------------------

select Makes.Make, count(*) as NumberOfVehicles,(select count(*) from VehicleDetails) as TotalVehicls from VehicleDetails 
inner join Makes on Makes.MakeID = VehicleDetails.MakeID
where (VehicleDetails.Year between 1950 and 2000)
group by Makes.Make
order by NumberOfVehicles desc

------------------------------------------------------------------------------------------------



------------------------------------------ Problem 8 ------------------------------------------

select * , cast(NumberOfVehicles as float) / cast (TotalVehicls as float) as Perc from(
select Makes.Make, count(*) as NumberOfVehicles,(select count(*) from VehicleDetails) as TotalVehicls from VehicleDetails 
inner join Makes on Makes.MakeID = VehicleDetails.MakeID
where (VehicleDetails.Year between 1950 and 2000)
group by Makes.Make
)r1
order by NumberOfVehicles desc

------------------------------------------------------------------------------------------------

------------------------------------------ Problem 9 ------------------------------------------

select  Makes.Make,FuelTypes.FuelTypeName, count(*) as NumberOfVehicles 
from VehicleDetails
inner join Makes on Makes.MakeID = VehicleDetails.MakeID
inner join FuelTypes on FuelTypes.FuelTypeID = VehicleDetails.FuelTypeID
where (VehicleDetails.Year between 1950 and 2000)
group by Make, FuelTypes.FuelTypeName
order by Make

------------------------------------------------------------------------------------------------

------------------------------------------ Problem 10 ------------------------------------------

 select VehicleDetails.*, FuelTypes.FuelTypeID 
 from  VehicleDetails
 inner join FuelTypes on 
 FuelTypes.FuelTypeID = VehicleDetails.FuelTypeID 
 where (FuelTypes.FuelTypeName = N'GAS')

------------------------------------------------------------------------------------------------

------------------------------------------ Problem 11 ------------------------------------------

 select distinct Makes.Make, FuelTypes.FuelTypeName 
 from  VehicleDetails
 inner join FuelTypes on 
 FuelTypes.FuelTypeID = VehicleDetails.FuelTypeID 
 inner join Makes on
 Makes.MakeID = VehicleDetails.MakeID
 where (FuelTypes.FuelTypeName = N'GAS')

------------------------------------------------------------------------------------------------

------------------------------------------ Problem 12 ------------------------------------------

select count(*) as TotalMakesRunsOnGas from
(
 select distinct Makes.Make, FuelTypes.FuelTypeName 
 from  VehicleDetails
 inner join FuelTypes on 
 FuelTypes.FuelTypeID = VehicleDetails.FuelTypeID 
 inner join Makes on
 Makes.MakeID = VehicleDetails.MakeID
  where (FuelTypes.FuelTypeName = N'GAS')
 )R1

------------------------------------------------------------------------------------------------

------------------------------------------ Problem 13 ------------------------------------------

select Makes.Make, count(VehicleDetails.MakeID) as NumberOfVehicles from VehicleDetails 
inner join Makes on 
Makes.MakeID = VehicleDetails.MakeID
group by Makes.Make
order by NumberOfVehicles desc

------------------------------------------------------------------------------------------------

------------------------------------------ Problem 14 ------------------------------------------

select Makes.Make, count(VehicleDetails.MakeID) as NumberOfVehicles
from VehicleDetails 
inner join Makes on 
Makes.MakeID = VehicleDetails.MakeID
group by Makes.Make
having count(*) > 20000
order by NumberOfVehicles desc

------------------------------------------------------------------------------------------------

------------------------------------------ Problem 15 ------------------------------------------

select Makes.Make 
from Makes
where Makes.Make like 'B%';

------------------------------------------------------------------------------------------------

------------------------------------------ Problem 16 ------------------------------------------

select Makes.Make 
from Makes
where Makes.Make like '%W';

------------------------------------------------------------------------------------------------

------------------------------------------ Problem 17 ------------------------------------------

select count(*) as MakeWithFWD from 
(
select distinct Makes.Make, DriveTypes.DriveTypeName
from VehicleDetails
inner join Makes on Makes.MakeID = VehicleDetails.MakeID
inner join DriveTypes on DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID
where DriveTypeName = N'FWD'
)R1
------------------------------------------------------------------------------------------------

------------------------------------------ Problem 18 ------------------------------------------

select Makes.Make, DriveTypes.DriveTypeName, count(*) as Total 
from VehicleDetails inner join Makes on Makes.MakeID = VehicleDetails.MakeID
inner join DriveTypes on DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID
group by DriveTypes.DriveTypeName, Makes.Make
order by Makes.Make asc, Total desc

------------------------------------------------------------------------------------------------

------------------------------------------ Problem 19 ------------------------------------------

select Makes.Make, DriveTypes.DriveTypeName, count(*) as Total 
from VehicleDetails inner join Makes on Makes.MakeID = VehicleDetails.MakeID
inner join DriveTypes on DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID
group by DriveTypes.DriveTypeName, Makes.Make
having count(*) > 10000
order by Makes.Make asc, Total desc

------------------------------------------------------------------------------------------------

------------------------------------------ Problem 20 ------------------------------------------

select * from VehicleDetails
where NumDoors is null

------------------------------------------------------------------------------------------------

------------------------------------------ Problem 21 ------------------------------------------

select count(*) as TotalWithNoSpecifiedDoors from VehicleDetails
where NumDoors is null

------------------------------------------------------------------------------------------------

------------------------------------------ Problem 22 ------------------------------------------

select 
(
	cast ((select count(*) as TotalWithNoSpecifiedDoors from VehicleDetails where NumDoors is null)
	as float)
	/
	cast((select count(*) from VehicleDetails) as float)
)as PercOfNoSpecifiedDoors

------------------------------------------------------------------------------------------------

------------------------------------------ Problem 23 ------------------------------------------

select distinct Makes.MakeID, Makes.Make, SubModels.SubModelName from VehicleDetails 
inner join Makes on Makes.MakeID = VehicleDetails.MakeID
inner join SubModels on SubModels.SubModelID = VehicleDetails.SubModelID
where SubModels.SubModelName = N'Elite'

------------------------------------------------------------------------------------------------

------------------------------------------ Problem 24 ------------------------------------------

select * from VehicleDetails
where Engine_Liter_Display > 3 and NumDoors = 2

------------------------------------------------------------------------------------------------

------------------------------------------ Problem 25 ------------------------------------------

select Makes.Make, VehicleDetails.*
from VehicleDetails
inner join Makes on Makes.MakeID = VehicleDetails.MakeID
where (VehicleDetails.Engine like '%OHV%') and (VehicleDetails.Engine_Cylinders = 4)

------------------------------------------------------------------------------------------------

------------------------------------------ Problem 26 ------------------------------------------

select Bodies.BodyName, VehicleDetails.*
from VehicleDetails
inner join Bodies on VehicleDetails.BodyID = Bodies.BodyID
where Bodies.BodyName in ('Sport Utility', 'Coupe','Sedan') 

------------------------------------------------------------------------------------------------

------------------------------------------ Problem 27 ------------------------------------------

select Bodies.BodyName, VehicleDetails.*
from VehicleDetails
inner join Bodies on VehicleDetails.BodyID = Bodies.BodyID
where Bodies.BodyName in ('Sport Utility', 'Coupe','Sedan') 
and
VehicleDetails.Year in (2008, 2020, 2021)

------------------------------------------------------------------------------------------------

------------------------------------------ Problem 28 ------------------------------------------

select found = 1
where
exists
(select top 1 * from VehicleDetails where Year = 1950)

------------------------------------------------------------------------------------------------