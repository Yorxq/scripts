local Player = game.Players.LocalPlayer
local Char = Player.Character
local loop


local function FindPlayer(name)
	for i,v in pairs(game.Players:GetPlayers()) do
		if v.Name:lower():sub(1,#name) == name:lower() then
			return v.Name
		end
	end
end


Player.CharacterAdded:Connect(function()
	print("respawned")
	Player.Chatted:Connect(function(Message)
		if string.len(Message) <= 1 then return end
		Message = string.split(Message, " ")
		if #Message <= 1 then return end

		local Command = string.lower(Message[1])
		local Recipient = FindPlayer(string.lower(Message[2]))

		if Command == ";protect" or Command == ";prot" then
			if Recipient ~= nil then
				loop = game:GetService('RunService').Stepped:Connect(function()
					pcall(function()
						local hrp = Char.HumanoidRootPart
						local target = game.Players:FindFirstChild(Recipient).Character:WaitForChild("Humanoid")
						hrp.CFrame = target.RootPart.CFrame + target.RootPart.CFrame.LookVector * 20
						
						if target.Health <= 0 then loop = loop:Disconnect() end
						if Player.Character:WaitForChild("Humanoid").Health <= 0 then loop = loop:Disconnect() end
					end)
				end)
			end
		elseif Command == ";unprotect" or Command == ";unprot" or Command == ";stop" then
			if loop then
				loop = loop:Disconnect()
			end
		end
	end)
end)
Player.Chatted:Connect(function(Message)
	if string.len(Message) <= 1 then return end
	Message = string.split(Message, " ")
	if #Message <= 1 then return end

	local Command = string.lower(Message[1])
	local Recipient = FindPlayer(string.lower(Message[2]))

	if Command == ";protect" or Command == ";prot" then
		if Recipient ~= nil then
			loop = game:GetService('RunService').Stepped:Connect(function()
				pcall(function()
					local hrp = Char.HumanoidRootPart
					local target = game.Players:FindFirstChild(Recipient).Character:WaitForChild("Humanoid")
					hrp.CFrame = target.RootPart.CFrame + target.RootPart.CFrame.LookVector * 20

					if target.Health <= 0 then loop = loop:Disconnect() end
					if Player.Character:WaitForChild("Humanoid").Health <= 0 then loop = loop:Disconnect() end
				end)
			end)
		end
	elseif Command == ";unprotect" or Command == ";unprot" or Command == ";stop" then
		if loop then
			loop = loop:Disconnect()
		end
	end
end)
print("protection ran succesful")
