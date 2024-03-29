ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

Citizen.CreateThread(function()
	if Config.EnableCarGarageBlip == true then	
		for k,v in pairs(Config.CarZones) do
			for i = 1, #v.Pos, 1 do
				local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
				SetBlipSprite(blip, Config.CarGarageSprite)
				SetBlipDisplay(blip, Config.CarGarageDisplay)
				SetBlipScale  (blip, Config.CarGarageScale)
				SetBlipColour (blip, Config.CarGarageColour)
				SetBlipAsShortRange(blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(Config.CarGarageName)
				EndTextCommandSetBlipName(blip)
			end
		end
	end	
end)

Citizen.CreateThread(function()
	if Config.EnableHeliGarageBlip == true then
		for k,v in pairs(Config.HeliZones) do
			for i = 1, #v.Pos, 1 do
				local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
				SetBlipSprite(blip, Config.HeliGarageSprite)
				SetBlipDisplay(blip, Config.HeliGarageDisplay)
				SetBlipScale  (blip, Config.HeliGarageScale)
				SetBlipColour (blip, Config.HeliGarageColour)
				SetBlipAsShortRange(blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(Config.HeliGarageName)
				EndTextCommandSetBlipName(blip)
			end
		end
	end
end)

Citizen.CreateThread(function()
	if Config.EnableBoatGarageBlip == true then
		for k,v in pairs(Config.BoatZones) do
			for i = 1, #v.Pos, 1 do
				local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
				SetBlipSprite(blip, Config.BoatGarageSprite)
				SetBlipDisplay(blip, Config.BoatGarageDisplay)
				SetBlipScale  (blip, Config.BoatGarageScale)
				SetBlipColour (blip, Config.BoatGarageColour)
				SetBlipAsShortRange(blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(Config.BoatGarageName)
				EndTextCommandSetBlipName(blip)
			end
		end
	end
end)

local insideMarker = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local coords = GetEntityCoords(PlayerPedId())
		local veh = GetVehiclePedIsIn(PlayerPedId(), false)
		local pedInVeh = IsPedInAnyVehicle(PlayerPedId(), true)
		
		if (ESX.PlayerData.job and ESX.PlayerData.job.name == Config.PoliceDatabaseName) then
			for k,v in pairs(Config.CarZones) do
				for i = 1, #v.Pos, 1 do
					local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
					if (distance < 10.0) and insideMarker == false then
						DrawMarker(Config.PoliceCarMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z-0.97, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.PoliceCarMarkerScale.x, Config.PoliceCarMarkerScale.y, Config.PoliceCarMarkerScale.y, Config.PoliceCarMarkerColor.r,Config.PoliceCarMarkerColor.g,Config.PoliceCarMarkerColor.b,Config.PoliceCarMarkerColor.a, false, true, 2, true, false, false, false)						
					end
					if (distance < 2.5 ) and insideMarker == false then
						DrawText3Ds(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, Config.CarDraw3DText)
						if IsControlJustPressed(0, Config.KeyToOpenCarGarage) then
							PoliceGarage('car')
							insideMarker = true
							Citizen.Wait(500)
						end
					end
				end
			end

			for k,v in pairs(Config.HeliZones) do
				for i = 1, #v.Pos, 1 do
					local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
					if (distance < 10.0) and insideMarker == false then
						DrawMarker(Config.PoliceHeliMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z-0.95, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.PoliceHeliMarkerScale.x, Config.PoliceHeliMarkerScale.y, Config.PoliceHeliMarkerScale.z, Config.PoliceHeliMarkerColor.r,Config.PoliceHeliMarkerColor.g,Config.PoliceHeliMarkerColor.b,Config.PoliceHeliMarkerColor.a, false, true, 2, true, false, false, false)						
					end
					if (distance < 3.0 ) and insideMarker == false then
						DrawText3Ds(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, Config.HeliDraw3DText)
						if IsControlJustPressed(0, Config.KeyToOpenHeliGarage) then
							PoliceGarage('helicopter')
							insideMarker = true
							Citizen.Wait(500)
						end
					end
				end
			end

			for k,v in pairs(Config.BoatZones) do
				for i = 1, #v.Pos, 1 do
					local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
					if (distance < 20.0) and insideMarker == false then
						DrawMarker(Config.PoliceBoatMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.PoliceBoatMarkerScale.x, Config.PoliceBoatMarkerScale.y, Config.PoliceBoatMarkerScale.z, Config.PoliceBoatMarkerColor.r,Config.PoliceBoatMarkerColor.g,Config.PoliceBoatMarkerColor.b,Config.PoliceBoatMarkerColor.a, false, true, 2, true, false, false, false)						
					end
					if (distance < 3.0 ) and insideMarker == false then
						DrawText3Ds(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, Config.BoatDraw3DText)
						if IsControlJustPressed(0, Config.KeyToOpenBoatGarage) then
							PoliceGarage('boat')
							insideMarker = true
							Citizen.Wait(500)
						end
					end
				end
			end
		end
	end
end)

PoliceGarage = function(type)
	local elements = {
		{ label = Config.LabelStoreVeh, action = "store_vehicle" },
		{ label = Config.LabelGetVeh, action = "get_vehicle" },
	}
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_policeGarage_menu",
		{
			title    = Config.TitlePoliceGarage,
			align    = "center",
			elements = elements
		},
	function(data, menu)
		menu.close()
		local action = data.current.action
		if action == "get_vehicle" then
			if type == 'car' then
				VehicleMenu('car')
			elseif type == 'helicopter' then
				VehicleMenu('helicopter')
			elseif type == 'boat' then
				VehicleMenu('boat')
			end
		elseif data.current.action == 'store_vehicle' then
			local veh,dist = ESX.Game.GetClosestVehicle(playerCoords)
			if dist < 3 then
				DeleteEntity(veh)
				ESX.ShowNotification(Config.VehicleParked)
			else
				ESX.ShowNotification(Config.NoVehicleNearby)
			end
			insideMarker = false
		end
	end, function(data, menu)
		menu.close()
		insideMarker = false
	end, function(data, menu)
	end)
end

VehicleMenu = function(type)
	local storage = nil
	local elements = {}
	local ped = GetPlayerPed(-1)
	local playerPed = PlayerPedId()
	local pos = GetEntityCoords(ped)
	
	if type == 'car' then
		for k,v in pairs(Config.PoliceVehicles) do
			table.insert(elements,{label = v.label, name = v.label, model = v.model, price = v.price, type = 'car'})
		end
	elseif type == 'helicopter' then
		for k,v in pairs(Config.PoliceHelicopters) do
			table.insert(elements,{label = v.label, name = v.label, model = v.model, price = v.price, type = 'helicopter'})
		end
	elseif type == 'boat' then
		for k,v in pairs(Config.PoliceBoats) do
			table.insert(elements,{label = v.label, name = v.label, model = v.model, price = v.price, type = 'boat'})
		end
	end
		
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_policeGarage_vehicle_garage",
		{
			title    = Config.TitlePoliceGarage,
			align    = "center",
			elements = elements
		},
	function(data, menu)
		menu.close()
		insideMarker = false
		VehicleLoadTimer(data.current.model)
		local veh = CreateVehicle(data.current.model,pos.x,pos.y,pos.z,GetEntityHeading(playerPed),true,false)
		
		SetPedIntoVehicle(GetPlayerPed(-1),veh,-1)
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		ESX.Game.SetVehicleProperties(vehicle, {
        plate = 'LSPD',
        modXenon = true, 
		modEngine = 3, 
		modBrakes = 2, 
		modTransmission = 2, 
		modSuspension = 3, 
		modTurbo = true, 
		modLivery = 0
		})
		
		SetVehicleExtra (vehicle, 1, false)
		SetVehicleExtra (vehicle, 2, false)
		SetVehicleExtra (vehicle, 3, false)
		SetVehicleExtra (vehicle, 4, false)
		SetVehicleExtra (vehicle, 5, false)
		SetVehicleExtra (vehicle, 6, false)
		SetVehicleExtra (vehicle, 7, false)
		SetVehicleExtra (vehicle, 8, false)
		SetVehicleExtra (vehicle, 9, false)
		SetVehicleExtra (vehicle, 10, false)
		SetVehicleExtra (vehicle, 11, false)
		SetVehicleExtra (vehicle, 12, false)
		
		if type == 'car' then
			ESX.ShowNotification(Config.CarOutFromPolGar)
		elseif type == 'helicopter' then
			ESX.ShowNotification(Config.HeliOutFromPolGar)
		elseif type == 'boat' then
			ESX.ShowNotification(Config.BoatOutFromPolGar)
		end
		
		TriggerEvent("fuel:setFuel",veh,100.0)
		SetVehicleDirtLevel(veh, 0.1)		
	end, function(data, menu)
		menu.close()
		insideMarker = false
	end, function(data, menu)
	end)
end

function VehicleLoadTimer(modelHash)
	modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))

	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)

		while not HasModelLoaded(modelHash) do
			Citizen.Wait(0)
			DisableAllControlActions(0)

			drawLoadingText(Config.VehicleLoadText, 255, 255, 255, 255)
		end
	end
end

function drawLoadingText(text, red, green, blue, alpha)
	SetTextFont(4)
	SetTextScale(0.0, 0.5)
	SetTextColour(red, green, blue, alpha)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(0.5, 0.5)
end

RegisterCommand(Config.RepairCommand, function(source, args)
	if ESX.PlayerData.job and (ESX.PlayerData.job.name == Config.PoliceDatabaseName) then
		policeFix()
	end
end,false)

function policeFix()
	local ped = GetPlayerPed(-1)
	for k,v in pairs(Config.CarZones) do
		for i = 1, #v.Pos, 1 do
			if IsPedInAnyVehicle(ped, true) then
				local veh = GetVehiclePedIsIn(ped, false)
				if GetDistanceBetweenCoords(GetEntityCoords(ped), v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) <= Config.Distance then
					ESX.ShowNotification(Config.VehRepNotify)
					FreezeEntityPosition(veh, true)
					exports['progressBars']:startUI((Config.RepairTime * 5000), Config.Progress1)
					Citizen.Wait((Config.RepairTime * 5000))
					ESX.ShowNotification(Config.VehRepDoneNotify)
					SetVehicleFixed(veh)
					FreezeEntityPosition(veh, false)
				end
			end
		end	
	end
end

RegisterCommand(Config.CleanCommand, function(source, args)
	if ESX.PlayerData.job and (ESX.PlayerData.job.name == Config.PoliceDatabaseName) then
		policeClean()
	end
end,false)

function policeClean()
	local ped = GetPlayerPed(-1)
	for k,v in pairs(Config.CarZones) do
		for i = 1, #v.Pos, 1 do
			if IsPedInAnyVehicle(ped, true) then
				local veh = GetVehiclePedIsIn(ped, false)
				if GetDistanceBetweenCoords(GetEntityCoords(ped), v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) <= Config.Distance then
					ESX.ShowNotification(Config.VehCleanNotify)
					FreezeEntityPosition(veh, true)
					exports['progressBars']:startUI((Config.CleanTime * 5000), Config.Progress2)
					Citizen.Wait((Config.CleanTime * 5000))
					ESX.ShowNotification(Config.VehCleanDoneNotify)
					SetVehicleDirtLevel(veh, 0.1)
					FreezeEntityPosition(veh, false)
				end
			end
		end	
	end
end


print("^9 esx_overheidsgarage Made By Foxi Development")
print("^9 esx_overheidsgarage Made By Foxi Development")
print("^9 esx_overheidsgarage Made By Foxi Development")