local Player = game.Players.LocalPlayer
local Char = Player.Character
local protecting


local function FindPlayer(name)
	for i,v in pairs(game.Players:GetPlayers()) do
		if v.Name:lower():sub(1,#name) == name:lower() then
			return v.Name
		end
	end
end


Player.CharacterAdded:Connect(function()
	Player.Chatted:Connect(function(Message)
		if string.len(Message) <= 1 then return end
		Message = string.split(Message, " ")
		if #Message <= 1 then return end

		local Command = string.lower(Message[1])
		local Recipient = FindPlayer(string.lower(Message[2]))

		if Command == ";protect" or Command == ";prot" then
			if Recipient ~= nil then
				protecting = true
				while wait(0.01) do
					local hrp = Char.HumanoidRootPart
					local target = game.Players:FindFirstChild(Recipient).Character:WaitForChild("Humanoid")
					hrp.CFrame = target.RootPart.CFrame + target.RootPart.CFrame.LookVector * 20
				end
			end
		end
	end)
end)
print("protection ran")
