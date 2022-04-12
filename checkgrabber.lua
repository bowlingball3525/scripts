local notif = function(showntext, color)
    local ps = game:GetService('Players')
    local rs = game:GetService('RunService')
    local tps = game:GetService('TeleportService')
    local ts = game:GetService('TweenService')
    local uis = game:GetService('UserInputService')

    local lp = ps.LocalPlayer
    local lp = ps.LocalPlayer
    local lerp = function(num, goal, interval)
        return num + ((goal - num) * interval)
    end
    if showntext then
        showntext = showntext:gsub('^%s*(.-)%s*$', '%1')
    elseif not showntext then
        showntext = 'nil'
    end
    local play = function(id)
        task.spawn(function()
            local s = Instance.new('Sound', game:GetService('SoundService'))
            s.SoundId = tostring(id)
            s.Volume = 3.5
            game:GetService('SoundService'):PlayLocalSound(s)
            s:Destroy()
        end)
    end
    if not textamt then
        textamt = 0
    end
    textamt = textamt + 1
    local text = Drawing.new('Text')
    text.Text = string.format('%s', showntext)
    text.Size = 22
    text.Center = false
    text.Outline = true
    text.Font = 0
    text.Color = color or Color3.fromRGB(255, 255, 255)
    text.OutlineColor = Color3.fromRGB(35, 35, 35)
    text.Position = Vector2.new(lp.PlayerGui.Chat.Frame.ChatChannelParentFrame.AbsoluteSize.X + 5, 20 + (textamt * 20))
    text.Visible = true
    text.Transparency = 0
    task.spawn(function()
        for i = 0, 1, 0.05 do
            text.Transparency = lerp(text.Transparency, 1, i)
            task.wait(0.05)
        end
        task.wait(5)
        for i = 0, 1, 0.025 do
            text.Transparency = lerp(text.Transparency, 0, i)
            task.wait(0.025)
        end
        text:Remove()
        textamt -= 1
    end)
end
local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local boombox = game.Players.LocalPlayer.Character:FindFirstChildOfClass'Tool' or game.Players.LocalPlayer.Backpack:FindFirstChildOfClass'Tool'
game.Players.LocalPlayer.Character:SetPrimaryPartCFrame (game.Players.LocalPlayer.Character. HumanoidRootPart.CFrame + Vector3.new(1000))
boombox.Parent = game.Players.LocalPlayer.Character
wait(.4)
boombox.Parent = workspace
game.Players.LocalPlayer.Character:SetPrimaryPartCFrame (oldpos)
wait(.6)
if boombox.Parent == workspace then
   game.Players.LocalPlayer.Character.Humanoid: EquipTool (boombox)
   wait(.3)
   game.PlayersLocalPlayer.Character.Humanoid:UnequipTools()
else
   wait(.3)
   local grabber = game.Players: GetPlayerFromCharacter (boombox.Parent) or boombox.Parent.Parent
   game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(grabber.Character.Head.CFrame + Vector3.new(0,3,0))
   notif("" .. grabber.DisplayName.." [@"..grabber.Name.."] is grabbing boomboxes")
end
