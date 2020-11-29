rejoining = true
	if syn.queue_on_teleport then
		syn.queue_on_teleport('game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()')
	end
	if syn.queue_on_teleport then
        syn.queue_on_teleport('loadstring(game:HttpGet("https://pastebin.com/raw/Lp1S4fJW"))()')
    end

    local Decision = "any" 
    local Player = game.Players.LocalPlayer
	local GUIDs = {}
    local maxPlayers = 0
    local SendChatEvent = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest

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
           wait(3)
         SendChatEvent:FireServer("All hail Daddy Blaroo and Papa UrMadSkets","All")
        SendChatEvent:FireServer("Girls Hit us up Blar 8041 Skxet 0001 (No x)","All")
        end
        end)
    
    
   for _,v in pairs(game.Players:GetPlayers()) do 
        Player.Character:WaitForChild("HumanoidRootPart").CFrame = v.Character.HumanoidRootPart.CFrame
        wait(1.4)
   end
    ChatON = true
    
    coroutine.resume(Coro)

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