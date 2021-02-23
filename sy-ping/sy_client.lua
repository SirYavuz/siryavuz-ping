ESX = nil
local gelen_istek_kisi = nil
local gelen_istek_konum = nil
local ping_durum = false


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
  end
end)

RegisterCommand('ping', function(source, args, user)
    if tostring(args[1]) ~= nil then
        local argh = tostring(args[1])
            TriggerServerEvent('konum-isteme', argh)
    end
end)


RegisterNetEvent('konum-ogren')
AddEventHandler('konum-ogren', function(gelen)
   local konum =  GetEntityCoords(PlayerPedId())
   local gelenmis = gelen
    
   gelen_istek_kisi = gelenmis
   gelen_istek_konum = konum

   print(gelen_istek_konum)
   print(gelen_istek_kisi)

end)

RegisterCommand('pingonay', function(source, args, user)    
    TriggerServerEvent('konum-geldi', gelen_istek_kisi, gelen_istek_konum)
end)


RegisterNetEvent('konum-isaretle')
AddEventHandler('konum-isaretle', function(konum)
    print('isaretlenen konum' ..konum)
    SetNewWaypoint(konum)

end)
