local message = "SilliestZel"
local remote = game:GetService("ReplicatedStorage"):WaitForChild("ChatEvent")

for i = 1, 100000 do
	remote:FireServer("text", message)
end
