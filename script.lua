-- Felipe's Ascension GUI (Teleport-Only Edition)

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Create GUI
local gui = Instance.new("ScreenGui")
gui.Name = "FelipeAscension"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Toggle Button (Always Visible)
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 160, 0, 30)
toggleBtn.Position = UDim2.new(0, 20, 0, 20)
toggleBtn.Text = "Open Control Panel"
toggleBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Font = Enum.Font.SourceSansBold
toggleBtn.TextSize = 16
toggleBtn.Parent = gui

-- Red Panel (Main GUI)
local frame = Instance.new("Frame")
frame.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
frame.Size = UDim2.new(0, 280, 0, 150)
frame.Position = UDim2.new(0.02, 0, 0.3, 0)
frame.Visible = false
frame.Parent = gui

-- Title Label
local title = Instance.new("TextLabel")
title.Text = "Ascension"
title.Size = UDim2.new(1, 0, 0, 60)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.TextWrapped = true
title.Parent = frame

-- Description Line (Teleport)
local function addLine(text, order)
	local label = Instance.new("TextLabel")
	label.Text = text
	label.Size = UDim2.new(1, -20, 0, 25)
	label.Position = UDim2.new(0, 10, 0, 60 + (order * 25))
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.new(1, 1, 1)
	label.Font = Enum.Font.SourceSans
	label.TextSize = 16
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.TextWrapped = true
	label.Parent = frame
end

addLine("E - Teleport (click to move)", 1)

-- Toggle GUI Button
toggleBtn.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
	toggleBtn.Text = frame.Visible and "Close Control Panel" or "Open Control Panel"
end)

-- TELEPORT MODE
local teleportMode = false

-- Press E to toggle teleport mode
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.E then
		teleportMode = not teleportMode
		if teleportMode then
			print("[Teleport Mode: ON] Click to teleport")
		else
			print("[Teleport Mode: OFF]")
		end
	end
end)

-- Click to teleport
mouse.Button1Down:Connect(function()
	if teleportMode then
		local pos = mouse.Hit.Position
		player.Character:MoveTo(pos)
	end
end)
