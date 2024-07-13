




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