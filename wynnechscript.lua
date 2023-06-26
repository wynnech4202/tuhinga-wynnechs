local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local username = game.Players.LocalPlayer.Name

local UI = Material.Load({
     Title = "wynnech (beta) private   ",
     Style = 5,
     SizeX = 500,
     SizeY = 600,
     Theme = "Dark"
})

local Page = UI.New({
    Title = "Main"
})

Page.Button({
    Text = "test (this dose nothing)",
    Callback = function()
       
    end,
})


Page.Button({
    Text = "antiCrash",
    Callback = function()
function AntiCrash()
    local RunService = game:GetService("RunService")
    local user = game:GetService("Players").LocalPlayer

    function Part1()
        RunService.RenderStepped:Connect(function() 
            local success, error = pcall(function()  -- Protect the function with pcall
                for _, item in ipairs(user.Backpack:GetChildren()) do
                    if item.Name == "-" then 
                        item:Destroy() 
                    end 
                end
            end)

            if not success then
                warn("Error occurred: " .. tostring(error))  -- Print the error if something went wrong
            end
        end)
    end

    function nou()
        -- If the user already has a character model, destroy it before creating a new one
        if user.Character then 
            user.Character:Destroy() 
        end

        local newModel = Instance.new("Model", workspace)
        newModel.Name = user.Name

        local humanoid = Instance.new("Humanoid", newModel)
        local torso = Instance.new("Part", newModel)
        torso.Name = "Torso"
        torso.CanCollide = false
        torso.Transparency = 1

        user.Character = newModel
    end

    function aaa()
        local connection = RunService.RenderStepped:Connect(function()  -- Store the connection
            local success, error = pcall(function()  -- Protect the function with pcall
                for _, item in ipairs(user.Backpack:GetChildren()) do
                    if item.Name == "-" then 
                        nou()
                    end 
                end
            end)

            if not success then
                warn("Error occurred: " .. tostring(error))  -- Print the error if something went wrong
            end
        end)

        -- Disconnect the connection when it's no longer needed (for example, when the game ends)
        -- game:GetService("Players").PlayerRemoving:Connect(function(plr)
        --     if plr == user then
        --         connection:Disconnect()
        --     end
        -- end)
    end

    local connection = RunService.RenderStepped:Connect(function()  -- Store the connection
        local success, error = pcall(function()  -- Protect the function with pcall
            for _, item in ipairs(user.Backpack:GetChildren()) do
                if item.Name == "-" then 
                    user.Backpack:ClearAllChildren() 
                end 
            end
        end)

        if not success then
            warn("Error occurred: " .. tostring(error))  -- Print the error if something went wrong
        end
    end)

    -- Disconnect the connection when it's no longer needed (for example, when the game ends)
    -- game:GetService("Players").PlayerRemoving:Connect(function(plr)
    --     if plr == user then
    --         connection:Disconnect()
    --     end
    -- end)

    if Part1 and typeof(Part1) == "function" then  -- Check if the function exists before calling it
        Part1()
    end

    if aaa and typeof(aaa) == "function" then  -- Check if the function exists before calling it
        aaa()
    end
end

    end,
})


Page.Button({
    Text = "anti lag",
    Callback = function()
-- Anti-Lag Script for Roblox

-- Define the delay time for anti-lag
local delayTime = 0.1

-- Store the current time
local currentTime = tick()

-- Get workspace descendants only once for optimization
local workspaceDescendants = workspace:GetDescendants()

-- Disable parts not in use
local function disableParts()
    for _, part in ipairs(workspaceDescendants) do
        if part:IsA("BasePart") and not part:IsA("Terrain") and not part.Anchored then
            part.CanCollide = false
        end
    end
end

-- Limit particle effects
local function limitParticleEffects()
    for _, emitter in ipairs(workspaceDescendants) do
        if emitter:IsA("ParticleEmitter") then
            emitter.Rate = math.min(emitter.Rate, 50)
            emitter.Lifetime = NumberRange.new(math.min(emitter.Lifetime.Min, 2), math.min(emitter.Lifetime.Max, 5))
        end
    end
end

-- Optimize sounds
local function optimizeSounds()
    for _, sound in ipairs(workspaceDescendants) do
        if sound:IsA("Sound") then
            sound.MaxDistance = math.min(sound.MaxDistance, 100)
        end
    end
end

-- Toggle certain objects when player dies
local function onPlayerDeath(objectsToToggle)
    for _, obj in pairs(objectsToToggle) do
        obj.Enabled = false
    end
    wait(delayTime)
    for _, obj in pairs(objectsToToggle) do
        obj.Enabled = true
    end
end

-- Check if the player is moving fast
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        character.Humanoid.Died:Connect(function()
            onPlayerDeath(workspaceDescendants)
        end)
    end)
end)

-- Run optimization functions
disableParts()
limitParticleEffects()
optimizeSounds()

print("Anti-Lag Script has been executed.")


    end,
})

Page.Button({
    Text = "instant kill (requires sky scythe)",
    Callback = function()
       local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local proximity = 30 -- Set your preferred proximity range here

while wait() do
    local myPlayer = Players.LocalPlayer
    local myCharacter = myPlayer.Character
    local myTeam = myPlayer.Team

    if myCharacter and myCharacter:FindFirstChild("HumanoidRootPart") then
        local myPosition = myCharacter.HumanoidRootPart.Position

        for _, player in pairs(Players:GetPlayers()) do
            if player.Team ~= myTeam and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") then
                local theirPosition = player.Character.HumanoidRootPart.Position
                local distance = (myPosition - theirPosition).Magnitude

                if distance < proximity and player.Character.Humanoid.Health > 0 then
                    local SkyScytheSpin = ReplicatedStorage:WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("SkyScytheSpin")
                    SkyScytheSpin:FireServer()
                    SkyScytheSpin:FireServer()
                    SkyScytheSpin:FireServer()
                end
            end
        end
    end
end

    end,
})

Page.Button({
    Text = "vape",
    Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()

    end,
})

Page.Button({
    Text = "inf yeild",
    Callback = function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()

     end,
})

Page.Button({
    Text = "inf fly tracking (see where inf fly hackers are gonna land)",
    Callback = function()
local thresholdHeight = 1000  -- Define your height limit here
local partSize = Vector3.new(1, 2000, 1)  -- Define the size of the part
local parts = {}  -- Table to store player parts
local isTracking = {} -- Table to store tracking flags for each player
local RunService = game:GetService("RunService")

local function sendMessageToAllPlayers(message)
    local Players = game:GetService("Players")

    for i, player in pairs(Players:GetPlayers()) do
        local playerGui = player:FindFirstChild("PlayerGui")
        if playerGui then
            local ScreenGui = Instance.new("ScreenGui")
            local TextLabel = Instance.new("TextLabel")

            TextLabel.Size = UDim2.new(0, 200, 0, 50)
            TextLabel.Position = UDim2.new(1, -210, 1, -120) -- Position changed to bottom right
            TextLabel.BackgroundTransparency = 0.5
            TextLabel.BackgroundColor3 = Color3.new(0, 0, 0)
            TextLabel.TextColor3 = Color3.new(1, 1, 1)
            TextLabel.Text = message
            TextLabel.Parent = ScreenGui

            ScreenGui.Parent = playerGui

            wait(5)
            ScreenGui:Destroy()
        end
    end
end

local function updateParts()
    for i, player in pairs(game.Players:GetPlayers()) do
        local character = player.Character
        if character and character:IsDescendantOf(workspace) then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                if humanoidRootPart.Position.Y > thresholdHeight then
                    -- If we're not currently tracking this player, start tracking them and send a message
                    if not isTracking[player.UserId] then
                        local part = Instance.new("Part")
                        part.Anchored = true
                        part.BrickColor = BrickColor.new("Royal purple")  -- Changed to Royal Purple
                        part.Material = "Neon"  -- Added Neon material
                        part.CanCollide = false  -- Set collision off
                        part.Size = partSize
                        part.Parent = workspace
                        parts[player.UserId] = part
                        isTracking[player.UserId] = true

                        sendMessageToAllPlayers(player.Name .. " might be using inf fly")
                    end
                    -- Update part position to follow player without delay
                    parts[player.UserId].Position = Vector3.new(humanoidRootPart.Position.X, 0, humanoidRootPart.Position.Z)
                elseif isTracking[player.UserId] then
                    -- If player's height is under the limit and we're currently tracking them, stop tracking and remove their part
                    parts[player.UserId]:Remove()
                    parts[player.UserId] = nil
                    isTracking[player.UserId] = false
                end
            end
        end
    end
end

RunService.Heartbeat:Connect(updateParts)

end,
})


Page.Button({
    Text = "MutiAura V2 old  (made by wynnech)",
    Callback = function()
     function createGui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "SliderGui"

    local frame = Instance.new("Frame")
    frame.Position = UDim2.new(0.8, 0, 0.2, 0)
    frame.Size = UDim2.new(0, 100, 0, 50)
    frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    frame.Parent = screenGui
    frame.Draggable = true

    local label = Instance.new("TextLabel")
    label.Position = UDim2.new(0, 0, 0, 0)
    label.Size = UDim2.new(1, 0, 0, 25)
    label.TextColor3 = Color3.new(1, 1, 1)
    label.BackgroundTransparency = 1
    label.Text = "MultiAura"
    label.Parent = frame

    local button = Instance.new("TextButton")
    button.Position = UDim2.new(0, 0, 0.5, 0)
    button.Size = UDim2.new(0, 10, 0, 20)
    button.BackgroundColor3 = Color3.new(1, 0, 0)
    button.Text = ""
    button.Parent = frame

    function findRemoteEvent(instance)
        if instance:IsA("RemoteEvent") then
            return instance
        end

        for _, child in ipairs(instance:GetChildren()) do
            local remoteEvent = findRemoteEvent(child)
            if remoteEvent then
                return remoteEvent
            end
        end

        return nil
    end

    local remoteEvent = findRemoteEvent(game)

    if not remoteEvent then
        print("Could not find RemoteEvent")
        return
    end

    local rs = game:GetService("RunService")
    local on = false

    function executeHeartbeat()
        rs.Heartbeat:Connect(function()
            if on then
                for i = 1, 4 do
                    local args = {
                        [1] = {
                            [1] = {
                                [1] = "\19",
                                [2] = "wood_sword"
                            }
                        }
                    }
                    remoteEvent:FireServer(unpack(args))
                end
            end
        end)
    end

    button.MouseButton1Click:Connect(function()
        on = not on

        local newPos
        if on then
            newPos = UDim2.new(1, -button.AbsoluteSize.X, 0.5, 0)
            button.BackgroundColor3 = Color3.new(0, 1, 0)
            executeHeartbeat()
        else
            newPos = UDim2.new(0, 0, 0.5, 0)
            button.BackgroundColor3 = Color3.new(1, 0, 0)
        end

        button:TweenPosition(newPos, "Out", "Quad", 0.5, true)
    end)

    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
end

-- Run the function once at the start
createGui()

-- Connect the function to the CharacterAdded event
game.Players.LocalPlayer.CharacterAdded:Connect(createGui)


    end,
})




Page.Button({
    Text = "LifeSaver (when the next hit is a death hit it will tp you up)",
    Callback = function()
       local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character
local humanoid = character and character:FindFirstChild("Humanoid")


local minimumHealth = 10
local teleportHeight = 300
local damageBufferDuration = 2 


local damageBuffer = {}
local lastHealth = humanoid and humanoid.Health or 0
local totalDamage = 0


local function checkHealth()
    if not character or not humanoid then 
        character = player.Character
        humanoid = character and character:FindFirstChild("Humanoid")
        if not character or not humanoid then return end
    end

    local healthDiff = lastHealth - humanoid.Health
    lastHealth = humanoid.Health

    if healthDiff > 0 then
        
        totalDamage = totalDamage + healthDiff
        table.insert(damageBuffer, {time = tick(), damage = healthDiff})

        
        while damageBuffer[1] and tick() - damageBuffer[1].time > damageBufferDuration do
            totalDamage = totalDamage - damageBuffer[1].damage
            table.remove(damageBuffer, 1)
        end

        
        local averageDamage = #damageBuffer > 0 and totalDamage / #damageBuffer or 0

        
        if humanoid.Health - averageDamage <= minimumHealth then
            local currentPos = character.HumanoidRootPart.Position
            local teleportPos = Vector3.new(currentPos.X, currentPos.Y + teleportHeight, currentPos.Z)

            
            character.HumanoidRootPart.CFrame = CFrame.new(teleportPos)

            
            repeat
                RunService.Heartbeat:Wait()
            until humanoid.Health >= humanoid.MaxHealth

           
            if workspace:FindPartOnRay(Ray.new(currentPos, Vector3.new(0, -1, 0))) then
                
                character.HumanoidRootPart.CFrame = CFrame.new(currentPos)
            end
        end
    end
end


RunService.Heartbeat:Connect(checkHealth)


player.CharacterAdded:Connect(function()
    character = player.Character
    humanoid = character:FindFirstChild("Humanoid")
    lastHealth = humanoid and humanoid.Health or 0
    totalDamage = 0
    damageBuffer = {}
end)

    end,
})

Page.Button({
    Text = "Disabler + semi god mode.",
    Callback = function()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SpiritBridgeEnter = ReplicatedStorage:WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("SpiritBridgeEnter")
local Player = Players.LocalPlayer
local Character = Player.Character
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local RootPartCFrame = HumanoidRootPart.CFrame

local args = {
    {
        ["partPositions"] = {},
        ["partSize"] = HumanoidRootPart.Size
    }
}

local cooldown = 0.1 -- Lower cooldown
local lastTeleportTime = 0

while wait() do
    if (tick() - lastTeleportTime) > cooldown then
        -- Update partPositions to a far away location and partSize to match the character's current state
        args[1]["partPositions"] = { HumanoidRootPart.Position + Vector3.new(1000, 1000, 1000) }
        args[1]["partSize"] = HumanoidRootPart.Size

        -- Try teleportation and handle possible error
        local status, err = pcall(function()
            SpiritBridgeEnter:InvokeServer(unpack(args))
        end)

        if not status then
            warn("Teleportation failed: " .. err)
            wait() -- Shorter wait if there was an error
        end

        wait() -- Shorter wait between teleportations

        -- Update partPositions back to the character's current position
        args[1]["partPositions"] = { HumanoidRootPart.Position }

        -- Try teleportation and handle possible error
        local status, err = pcall(function()
            SpiritBridgeEnter:InvokeServer(unpack(args))
        end)

        if not status then
            warn("Teleportation failed: " .. err)
            wait() -- Shorter wait if there was an error
        end

        lastTeleportTime = tick() -- Reset the last teleportation time
    end
end

    end,
})

Page.Button({
    Text = "a true instant kill V3",
    Callback = function()
  task.spawn(function()
    while wait() do
        game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("SwordSwingMiss"):FireServer({
            ["weapon"] = game:GetService("ReplicatedStorage").Items.diamond_great_hammer,
            ["chargeRatio"] = 1
        })
        game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("SwordSwingMiss"):FireServer({
            ["weapon"] = game:GetService("ReplicatedStorage").Items.diamond_great_hammer,
            ["chargeRatio"] = 1
        })
        game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("SwordSwingMiss"):FireServer({
            ["weapon"] = game:GetService("ReplicatedStorage").Items.diamond_great_hammer,
            ["chargeRatio"] = 1
        })
    end
end)

    end,
})
