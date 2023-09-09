loadstring(game:HttpGet("https://raw.githubusercontent.com/v9h/dhrpvc/main/anticrash.lua", true))()
wait(5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/v9h/dhrpvc/main/anticrash.lua", true))()

local function ServerHop()
    function shop()
        pcall(function()
            local Servers =
            game.HttpService:JSONDecode(
            game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
        )
            while wait() do
                v = Servers.data[math.random(#Servers.data)]
                if v.playing < v.maxPlayers - 2 and v.id ~= game.JobId then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id)
                    break
                end
            end
        end)
    end


local function hop()
        shop()
        while wait() do
            pcall(shop)
        end
    end
    hop()
end

local messages = {
   "updated dhrp https://www.roblox.com/games/13917889801/Dollhouse-Roleplay-VC-VR",
   "join this dhrp https://www.roblox.com/games/13917889801/Dollhouse-Roleplay-VC-VR",
   "this dhrp sucks come to ours, https://www.roblox.com/games/13917889801/Dollhouse-Roleplay-VC-VR",
   "https://www.roblox.com/games/13917889801/Dollhouse-Roleplay-VC-VR",
   "dhrp with new UI, vc + vr, & antifling",
   "tired of getting lagged & crashed? Join our dhrp",
   ":3 https://www.roblox.com/games/13917889801/Dollhouse-Roleplay-VC-VR",
   "join .gg/k9GWW4qYBP for the game link"
}

local function Chat(msg)
    wait(0.2)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
end

coroutine.wrap(function()
    while true do
        Chat(messages[math.random(1, #messages)])
        wait(0.45)
    end
end)()

spawn(
    function()
        while true do
            wait(0.5)
            numb = numb + 1
            if numb == 212 then
                game.Players.LocalPlayer:Kick("Serverhopping")
                wait(2)
                pcall(hop)
            end
        end
    end
)

wait(120)
ServerHop()
