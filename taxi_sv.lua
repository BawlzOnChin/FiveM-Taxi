RegisterServerEvent('taxi:success')
AddEventHandler('taxi:success', function()
  print("Player ID " ..source)
	-- Get the players money amount
TriggerEvent('es:getPlayerFromId', source, function(user)
  print('Player current cash ' ..user.money)
  print('Player permission ' ..user.permission_level)

  total = tonumber(user.money) + math.random(100, 500);
  print('Players new cash amount ' ..total)
  -- update player money amount
 TriggerEvent("es:setPlayerData", source, "money", total, function(response, success)
   print('update Response ' ..response)

   if(success)then
    print('Success data ' ..success)
     TriggerClientEvent('es:activateMoney', source, total)
     TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Your money has been updated to ~g~$".. tonumber(total))
   end
  end)
 end)
end)
