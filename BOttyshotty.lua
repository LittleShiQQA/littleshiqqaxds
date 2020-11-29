repeat wait() until game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents") and game.Players.LocalPlayer
rejoining = true
	if syn.queue_on_teleport then
		syn.queue_on_teleport('game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()')
	end
	if syn.queue_on_teleport then
	    wait(6)
        syn.queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/LittleShiQQA/littleshiqqaxds/main/BOttyshotty.lua"))()')
    end

    local Decision = "any" 
    local Player = game.Players.LocalPlayer
	local GUIDs = {}
    local maxPlayers = 0
    local SendChatEvent = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")

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
    
local ChatON = false
         


    local Coro = coroutine.create(function()
        while ChatON == false do 
         SendChatEvent.SayMessageRequest:FireServer("All hail Daddy Bl_xen and Papa UrMadSkets","All")
         wait(0.2)
        SendChatEvent.SayMessageRequest:FireServer("Girls Hit us up Blar 8041 Skxet 0001 (No x)","All")
	wait(8)
        end
        end)
    

        local Coro2 = coroutine.create(function()
             while wait(150) do 
                if Decision == "any" then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[math.random(1,#GUIDs)].id, Player)
                elseif Decision == "smallest" then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[#GUIDs].id, Player)
                elseif Decision == "largest" then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[1].id, Player)
                else
                    print("Broke")
                end
             end
        end)

        coroutine.resume(Coro)
        coroutine.resume(Coro2)

   for _,v in pairs(game.Players:GetPlayers()) do 
        if v and v.Character and  Player.Character:WaitForChild("HumanoidRootPart").CFrame and v.Character:WaitForChild("HumanoidRootPart").CFrame then 
        Player.Character:WaitForChild("HumanoidRootPart").CFrame = v.Character.HumanoidRootPart.CFrame
        end
        wait(1.4)
   end
    ChatON = true
    

	if Decision == "any" then
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[math.random(1,#GUIDs)].id, Player)
	elseif Decision == "smallest" then
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[#GUIDs].id, Player)
	elseif Decision == "largest" then
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[1].id, Player)
    else
        print("Broke")
	end
	wait(3)
	rejoining = false
