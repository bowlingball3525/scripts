repeat
	wait();
until game:IsLoaded() 
tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(1.5, Enum.EasingStyle.Linear);
tweenService:Create(game:GetService("Players")['LocalPlayer'].Character.HumanoidRootPart, tweenInfo, {CFrame=CFrame.new(80.20547485351562, 52.98148727416992, -106.83248901367188)}):Play();
wait(1.5);
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true;
local function delayAndTeleport()
	local function teleport()
		local success, err = pcall(function()
			game:GetService("TeleportService"):Teleport(game.PlaceId);
		end);
		if not success then
			local DiscordWebhookURL = "";
			local data = {content=("Error occurred while teleporting: " .. tostring(err))};
			local headers = {["Content-Type"]="application/json"};
			local success, response = pcall(function()
				local httpService = game:GetService("HttpService");
				local requestInfo = {Url=DiscordWebhookURL,Method="POST",Headers=headers,Body=httpService:JSONEncode(data)};
				httpService:RequestAsync(requestInfo);
			end);
			if not success then
				warn("Failed to send error to Discord Webhook: " .. tostring(response));
			end
		end
	end
	local delayTime = 30;
	wait(delayTime);
	ServerHop();
end
coroutine.wrap(delayAndTeleport)();
local function ServerHop()
	local success, response = pcall(function()
		return game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"));
	end);
	if (success and response and response.data) then
		local AvailableServers = response.data;
		while true do
			wait();
			local RandomServer = AvailableServers[math.random(#AvailableServers)];
			if ((RandomServer.playing < (RandomServer.maxPlayers - 1)) and (RandomServer.playing > 12) and (RandomServer.id ~= game.JobId)) then
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, RandomServer.id);
			end
		end
	else
		warn("Failed to retrieve server list. Retrying...");
		ServerHop();
	end
end
local function hop()
	while true do
		local success, errorMessage = pcall(ServerHop);
		if not success then
			warn("Server hop error: " .. errorMessage);
		end
		wait();
	end
end
coroutine.wrap(function()
	while true do
		wait(0.2);
		for _, x in next, game.Players.LocalPlayer.Backpack:GetChildren() do
			if x:IsA("Tool") then
				x.Parent = game.Players.LocalPlayer.Character;
				x.Parent = workspace;
			end
		end
		game.ReplicatedStorage.GiveBox:FireServer();
		game.ReplicatedStorage.GiveCat:FireServer();
	end
end);
local messages = {
    "updated dhrp https://www.roblox.com/games/13917889801/Dollhouse-RP-VC-VR",
    "join this dhrp https://www.roblox.com/games/13917889801/Dollhouse-RP-VC-VR",
    "this dhrp sucks come to ours",
    "https://www.roblox.com/games/13917889801/Dollhouse-RP-VC-VR",
    "dhrp with new UI",
    "dhrp fling bots patched",
    "dhrp with vc + vr"
};
local function Chat(msg)
	game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All");
end
coroutine.wrap(function()
	while true do
		Chat(messages[math.random(1, #messages)]);
		wait(1);
	end
end)();
spawn(function()
	while true do
		wait(0.5);
		numb = numb + 1;
		if (numb == 212) then
			wait(0.5);
			pcall(hop);
		end
	end
end);
