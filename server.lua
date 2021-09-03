ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('bmx', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('bmx', 1)
    TriggerClientEvent('item:voiture', source)
end)

RegisterNetEvent('deletevoiture')
AddEventHandler('deletevoiture', function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local limititem = 1 
    local item = 'bmx'
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count
    if nbitemdansinventaire >= limititem then
        TriggerClientEvent('esx:showNotification', _src, "~r~Problème~s~ : Vous avez déjà un BMX sur vous !")
    else
        xPlayer.addInventoryItem(item, 1)
    end
end)

