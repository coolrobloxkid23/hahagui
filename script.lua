        end
    end
end)

BackdoorScanButton.MouseButton1Click:Connect(function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            print("Potential Remote: " .. v:GetFullName())
        end
    end
end)


local scarySkyboxes = {
    "rbxassetid://123456789", -- Replace with real scary IDs
    "rbxassetid://987654321",
    "rbxassetid://456789123"
}

function changeSkybox()
    local skyId = scarySkyboxes[math.random(1, #scarySkyboxes)]
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") then
            v:FireServer("Skybox", skyId)
        end
    end
end

function autoBackdoorExploit()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            print("[+] Found exploitable Remote: " .. v:GetFullName())
            pcall(function()
                v:FireServer("HACKED_BY_C00LKIDD_X_TUBERS93")
                v:FireServer("Skybox", scarySkyboxes[math.random(1, #scarySkyboxes)])
            end)
        end
    end
end

SkyboxButton.MouseButton1Click:Connect(changeSkybox)

BackdoorScanButton.MouseButton1Click:Connect(autoBackdoorExploit)
