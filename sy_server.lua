ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('konum-isteme')
AddEventHandler('konum-isteme', function(argh)
    local _source = source

    local xPlayer = ESX.GetPlayerFromId(_source)
    local zPlayer = ESX.GetPlayerFromId(argh)

    TriggerClientEvent('notification', source, 'Konum isteği gönderildi ['..argh..']', 1 )
    TriggerClientEvent('notification', argh, 'Konum isteği geldi ['..source..']', 1 )

    local  gelen = xPlayer.source
    local  giden = zPlayer.source
    -- print('Gelen : ' ..gelen)
    -- print('Giden : ' ..argh)
    
    TriggerClientEvent('konum-ogren', argh, gelen)
    TriggerClientEvent('konum-test', source, giden)

end)

RegisterServerEvent('konum-geldi')
AddEventHandler('konum-geldi', function(gelen_istek_kisi, gelen_istek_konum)
    local _source = source
    -- print('serverside konum' ..gelen_istek_konum.. ' ' ..gelen_istek_kisi)

    local xPlayer = ESX.GetPlayerFromId(_source)
    local zPlayer = ESX.GetPlayerFromId(gelen_istek_kisi)

    TriggerClientEvent('notification', gelen_istek_kisi, 'Konum isteğin kabul edildi', 1 )
    TriggerClientEvent('notification', source, 'Konum isteğini onayladın', 1 )
    TriggerClientEvent('konum-isaretle', gelen_istek_kisi, gelen_istek_konum)

end)

