ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(500)
	end
end)

local into = false

RegisterNetEvent('item:voiture')
AddEventHandler('item:voiture', function()
	if into then
		ESX.ShowNotification("Vous avez ~r~déjà~s~ votre véhicule de sortie !")
	elseif not into then 
		local pos = GetEntityCoords(PlayerPedId())
		local heading = GetEntityHeading(PlayerPedId())
		local model = GetHashKey("bmx")
		local pos = GetEntityCoords(GetPlayerPed(-1))
		RequestModel(model)
		while not HasModelLoaded(model) do Citizen.Wait(10) end
		local vehicle = CreateVehicle(model, pos.x+1, pos.y+1, pos.z, 5.2, true, false)
		TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
		ESX.ShowNotification("Vous venez de ~r~sortir~s~ votre véhicule !")
		into = true
	end
end)

RegisterCommand('rangerbmx', function() 
	if into then
		TriggerEvent('esx:deleteVehicle')
		TriggerServerEvent('deletevoiture')
		ESX.ShowNotification("Vous avez ~g~rangé~s~ votre véhicule !")
		into = false
	end
end, false)

RegisterKeyMapping('rangerbmx', 'Ranger le Bmx', 'keyboard', 'i')