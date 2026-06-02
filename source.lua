getgenv().AutoF = false
getgenv().AntiAFK = false

getgenv().AutoCooldown = false
getgenv().AutoMultiplier = false
getgenv().AutoWalkspeed = false
getgenv().AutoDuration = false

getgenv().AutoWood = false
getgenv().AutoSilver = false
getgenv().AutoGolden = false
getgenv().AutoDiamond = false

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Sonion Hub v3",
   LoadingTitle = "Sonion Hub",
   LoadingSubtitle = "Amethyst Edition",
   ConfigurationSaving = { Enabled = false },
   Discord = { Enabled = false },
   KeySystem = false,
   Theme = "Amethyst",
   ToggleUIKeybind = Enum.KeyCode.RightShift
})

local FarmShopTab = Window:CreateTab("Farm-Shop", 4483362458)

FarmShopTab:CreateSection("Main")

FarmShopTab:CreateToggle({
   Name = "Auto Click 'F' Buttons",
   CurrentValue = false,
   Flag = "AutoFClicker",
   Callback = function(Value) getgenv().AutoF = Value end,
})

FarmShopTab:CreateToggle({
   Name = "Enable Anti-AFK",
   CurrentValue = false,
   Flag = "AntiAFKClicker",
   Callback = function(Value) getgenv().AntiAFK = Value end,
})

FarmShopTab:CreateSection("Upgrades")

FarmShopTab:CreateToggle({
   Name = "Auto Upgrade Cooldown",
   CurrentValue = false,
   Flag = "AutoCooldown",
   Callback = function(Value) getgenv().AutoCooldown = Value end,
})

FarmShopTab:CreateToggle({
   Name = "Auto Upgrade Multiplier",
   CurrentValue = false,
   Flag = "AutoMultiplier",
   Callback = function(Value) getgenv().AutoMultiplier = Value end,
})

FarmShopTab:CreateToggle({
   Name = "Auto Upgrade Walkspeed",
   CurrentValue = false,
   Flag = "AutoWalkspeed",
   Callback = function(Value) getgenv().AutoWalkspeed = Value end,
})

FarmShopTab:CreateToggle({
   Name = "Auto Upgrade Duration",
   CurrentValue = false,
   Flag = "AutoDuration",
   Callback = function(Value) getgenv().AutoDuration = Value end,
})

FarmShopTab:CreateSection("Crates")

FarmShopTab:CreateToggle({
   Name = "Auto Open Wood Crates",
   CurrentValue = false,
   Flag = "AutoWood",
   Callback = function(Value) getgenv().AutoWood = Value end,
})

FarmShopTab:CreateToggle({
   Name = "Auto Open Silver Crates",
   CurrentValue = false,
   Flag = "AutoSilver",
   Callback = function(Value) getgenv().AutoSilver = Value end,
})

FarmShopTab:CreateToggle({
   Name = "Auto Open Golden Crates",
   CurrentValue = false,
   Flag = "AutoGolden",
   Callback = function(Value) getgenv().AutoGolden = Value end,
})

FarmShopTab:CreateToggle({
   Name = "Auto Open Diamond Crates",
   CurrentValue = false,
   Flag = "AutoDiamond",
   Callback = function(Value) getgenv().AutoDiamond = Value end,
})

local function interactWithFrameButton(parentFrame, buttonTextKeyword)
    if not parentFrame then return end
    for _, child in ipairs(parentFrame:GetChildren()) do
        if child:IsA("GuiButton") and (not buttonTextKeyword or string.find(string.lower(child.Text), buttonTextKeyword) or string.find(string.lower(child.Name), buttonTextKeyword)) then
            for _, conn in ipairs(getconnections(child.MouseButton1Click)) do conn:Fire() end
            for _, conn in ipairs(getconnections(child.MouseButton1Down)) do conn:Fire() end
            for _, conn in ipairs(getconnections(child.Activated)) do conn:Fire() end
        end
    end
end

task.spawn(function()
    while true do
        local player = game:GetService("Players").LocalPlayer
        if player and player:FindFirstChild("PlayerGui") then
            for _, obj in ipairs(player.PlayerGui:GetDescendants()) do
                if obj:IsA("TextLabel") or obj:IsA("TextButton") then
                    local text = string.lower(obj.Text)
                    
                    if getgenv().AutoCooldown and string.find(text, "cooldown") then
                        interactWithFrameButton(obj.Parent, "buy")
                    elseif getgenv().AutoMultiplier and string.find(text, "multiplier") then
                        interactWithFrameButton(obj.Parent, "buy")
                    elseif getgenv().AutoWalkspeed and string.find(text, "walkspeed") then
                        interactWithFrameButton(obj.Parent, "buy")
                    elseif getgenv().AutoDuration and string.find(text, "duration") then
                        interactWithFrameButton(obj.Parent, "buy")
                    elseif getgenv().AutoWood and string.find(text, "wood") then
                        interactWithFrameButton(obj.Parent, nil)
                    elseif getgenv().AutoSilver and string.find(text, "silver") then
                        interactWithFrameButton(obj.Parent, nil)
                    elseif getgenv().AutoGolden and (string.find(text, "golden") or string.find(text, "gold")) then
                        interactWithFrameButton(obj.Parent, nil)
                    elseif getgenv().AutoDiamond and string.find(text, "diamond") then
                        interactWithFrameButton(obj.Parent, nil)
                    end
                end
            end
        end
        task.wait(0.7)
    end
end)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    if getgenv().AntiAFK then
        vu:CaptureController()
        vu:ClickButton2(Vector2.new(0,0))
    end
end)

task.spawn(function()
    while true do
        if getgenv().AutoF then
            local player = game:GetService("Players").LocalPlayer
            if player and player:FindFirstChild("PlayerGui") then
                for _, obj in ipairs(player.PlayerGui:GetDescendants()) do
                    if obj:IsA("GuiButton") then
                        local isFButton = false
                        
                        if obj:IsA("TextButton") and string.lower(obj.Text) == "f" then
                            isFButton = true
                        elseif obj:FindFirstChildOfClass("TextLabel") and string.lower(obj:FindFirstChildOfClass("TextLabel").Text) == "f" then
                            isFButton = true
                        elseif string.lower(obj.Name) == "f" then
                            isFButton = true
                        end
                        
                        if isFButton then
                            for _, conn in ipairs(getconnections(obj.MouseButton1Click)) do conn:Fire() end
                            for _, conn in ipairs(getconnections(obj.MouseButton1Down)) do conn:Fire() end
                            for _, conn in ipairs(getconnections(obj.Activated)) do conn:Fire() end
                        end
                    end
                end
            end
        end
        task.wait(0.5)
    end
end)

Rayfield:LoadConfiguration()
