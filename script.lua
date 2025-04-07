-- Felipe's Ascension GUI (Teleport, Kill Aura, and Skybox Edition)

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
frame.Size = UDim2.new(0, 280, 0, 200)
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
addLine("R - Activate Kill Aura", 2)
addLine("T - Teleport to All Players", 3)
addLine("F - Change Skybox", 4)

-- Toggle GUI Button
toggleBtn.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
    toggleBtn.Text = frame.Visible and "Close Control Panel" or "Open Control Panel"
end)

-- TELEPORT MODE
local teleportMode = false

-- Kill Aura Mode
local killAuraMode = false

-- Skybox Change Mode
local skyboxMode = false

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
    -- Press R to toggle Kill Aura mode
    if input.KeyCode == Enum.KeyCode.R then
        killAuraMode = not killAuraMode
        if killAuraMode then
            print("[Kill Aura: ON] Nearby players will be eliminated")
        else
            print("[Kill Aura: OFF]")
        end
    end
    -- Press F to change the skybox
    if input.KeyCode == Enum.KeyCode.F then
        skyboxMode = not skyboxMode
        if skyboxMode then
            print("[Skybox Change: ON] Choose a skybox")
        else
            print("[Skybox Change: OFF]")
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

-- Kill Aura Function
local function killAura()
    for _, targetPlayer in pairs(Players:GetPlayers()) do
        if targetPlayer ~= player and targetPlayer.Character then
            local targetCharacter = targetPlayer.Character
            local targetHumanoid = targetCharacter:FindFirstChild("Humanoid")
            if targetHumanoid then
                local distance = (player.Character.HumanoidRootPart.Position - targetCharacter.HumanoidRootPart.Position).Magnitude
                if distance < 10 then -- Kill aura range
                    targetHumanoid.Health = 0
                end
            end
        end
    end
end

-- Teleport to all players
local function teleportToAllPlayers()
    for _, targetPlayer in pairs(Players:GetPlayers()) do
        if targetPlayer.Character then
            local targetCharacter = targetPlayer.Character
            if targetCharacter:FindFirstChild("HumanoidRootPart") then
                player.Character:SetPrimaryPartCFrame(targetCharacter.HumanoidRootPart.CFrame)
                wait(0.5) -- Time between teleporting to each player
            end
        end
    end
end

-- Change Skybox (Server-Sided)
local function changeSkybox(skyboxId)
    -- Create a RemoteEvent to communicate with the server to change skybox
    local remote = Instance.new("RemoteEvent")
    remote.Name = "ChangeSkybox"
    remote.Parent = game.ReplicatedStorage

    -- Fire the event from the client to the server
    remote:FireServer(skyboxId)
end

-- Teleport to all players when pressed T (or another key of your choice)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.T then
        teleportToAllPlayers()
        print("[Teleported to All Players]")
    end
end)

-- Server-Sided Script (In ServerScriptService)
game.ReplicatedStorage:WaitForChild("ChangeSkybox").OnServerEvent:Connect(function(player, skyboxId)
    -- Change the skybox for all players in the game
    local lighting = game:GetService("Lighting")
    lighting.Skybox = game:GetService("Assets"):FindFirstChild(skyboxId)
end)

