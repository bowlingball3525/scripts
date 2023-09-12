repeat task.wait() until game:IsLoaded()
for i,v in pairs(workspace:GetChildren()) do
    if v:IsA("Tool") then
        v:Destroy()
    end;
end;

if _G.AntiCrash then _G.AntiCrash:Disconnect() end;
_G.AntiCrash = workspace["ChildAdded"]:connect(function(v)
    coroutine.wrap(function()
        repeat task.wait() until v:FindFirstChild("Handle", true)
        if v:IsA("Tool") then
            v:Destroy()
        end;
    end)()
end)
