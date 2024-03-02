-- esx_overheidsgarage Made By Foxi Development --

Config = {}

Config.KeyToOpenCarGarage = 38			
Config.KeyToOpenHeliGarage = 38			
Config.KeyToOpenBoatGarage = 38			

Config.PoliceDatabaseName = 'any'	

Config.CarZones = {
	PoliceCarGarage = {
		Pos = {
			{x = -829.04,  y = -1217.52, z = 6.93}
		}
	}
}

Config.HeliZones = {
	PoliceHeliGarage = {
		Pos = {
			{x = 448.65,  y = -981.25, z = 43.69}
		}
	}
}

Config.BoatZones = {
	PoliceBoatGarage = {
		Pos = {
			{x = 1538.69,  y = 3901.5, z = 30.35}
		}
	}
}

Config.CarGarageSprite = 357
Config.CarGarageDisplay = 4
Config.CarGarageScale = 0.65
Config.CarGarageColour = 38
Config.CarGarageName = "Overheids Garage"
Config.EnableCarGarageBlip = false

Config.HeliGarageSprite = 43
Config.HeliGarageDisplay = 4
Config.HeliGarageScale = 0.65
Config.HeliGarageColour = 38
Config.HeliGarageName = "Politie Heli Garage"
Config.EnableHeliGarageBlip = false

Config.BoatGarageSprite = 427
Config.BoatGarageDisplay = 4
Config.BoatGarageScale = 0.65
Config.BoatGarageColour = 38
Config.BoatGarageName = "Politie Boot Garage"
Config.EnableBoatGarageBlip = true

Config.PoliceCarMarker = 27 												
Config.PoliceCarMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 			
Config.PoliceCarMarkerScale = { x = 1.5, y = 1.5, z = 1.0 }  				
Config.CarDraw3DText = "Druk ~g~[E]~s~ om je voertuig te pakken"			

Config.PoliceHeliMarker = 27 											
Config.PoliceHeliMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		
Config.PoliceHeliMarkerScale = { x = 5.5, y = 5.5, z = 1.0 }  				
Config.HeliDraw3DText = "Druk ~g~[E]~s~ om ~y~Heli Garage~s~ te openen"		

Config.PoliceBoatMarker = 27 												
Config.PoliceBoatMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		
Config.PoliceBoatMarkerScale = { x = 3.0, y = 3.0, z = 1.0 }  				
Config.BoatDraw3DText = "Druk ~g~[E]~s~ om ~y~Garage Boot te openen"		

Config.PoliceVehicles = {
	{ model = 'ambue', label = 'Ambulance Mercedes', price = 0 },
    { model = 'ambumotor', label = 'Ambulance Motor', price = 0 },
    { model = 'ambu3', label = 'Ambulance Offroad', price = 0 },
    { model = 'ambut6', label = 'Ambulance T6', price = 0 },
    { model = 'ambuvito', label = 'Ambulance Vito', price = 0 },
}

Config.PoliceHelicopters = {
	{ model = 'polmav', label = 'Police Maverick', price = 0 }
}

Config.PoliceBoats = {
	{ model = 'libertyboat', label = 'Police PredatorXV', price = 0 }
}

Config.RepairCommand = 'repareer'
Config.CleanCommand = 'poetsdoek'

Config.LabelStoreVeh = "Zet Voertuig Weg"
Config.LabelGetVeh = "Pak voertuig"
Config.LabelPrimaryCol = "Primary"
Config.LabelSecondaryCol = "Secondary"
Config.LabelExtra = "Extra"
Config.LabelLivery = "Livery"
Config.TitlePoliceGarage = "Foxi Development"
Config.TitlePoliceExtra = "Extra"
Config.TitlePoliceLivery = "Livery"
Config.TitleColorType = "Color Type"
Config.TitleValues = "Value"

Config.VehicleParked = "~b~Voertuig~s~ is geparkeerd!"
Config.NoVehicleNearby = "Geen ~b~Voertuig~s~ in de buurt!"
Config.CarOutFromPolGar = "Je pakte ~b~Voertuig~s~ uit ~y~Overheids Garage~s~!"
Config.HeliOutFromPolGar = "~b~Eagle~s~ ~y~Operating~s~!"
Config.BoatOutFromPolGar = "~b~Bonito~s~ ~y~Operating~s~!"
Config.VehRepNotify = "Je ~b~Auto~s~ is bezig met ~y~te vermaken~s~, Wacht Geduldig!"
Config.VehRepDoneNotify = "Je ~b~Auto~s~ is ~y~Vermaakt~s~!"
Config.VehCleanNotify = "Je ~b~Auto~s~ staat op het punt te ~y~schoon~s~, Wacht Geduldig!"
Config.VehCleanDoneNotify = "Je ~b~Auto~s~ is ~y~schoon~s~!"

Config.Progress1 = "Repareer Auto"
Config.Progress2 = "Auto Schoonmaken"

Config.RepairTime = 5	
Config.CleanTime = 3.5	

Config.VehicleLoadText = "Wachten op ~r~Auto!"

Config.Distance = 20

Config.DrawDistance      = 100.0
Config.TriggerDistance 	 = 3.0
Config.Marker 			 = {Type = 27, r = 0, g = 127, b = 22}