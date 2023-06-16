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
    Text = "hub",
    Callback = function()
       local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

local TextLabel = Instance.new("TextLabel")
TextLabel.Parent = ScreenGui
TextLabel.Text = "wynnech\nprivate"
TextLabel.BackgroundTransparency = 0.4
TextLabel.Size = UDim2.new(0, 200, 0, 100)
TextLabel.Position = UDim2.new(0, 10, 1, -110)
TextLabel.AnchorPoint = Vector2.new(0, 1)
TextLabel.TextSize = 20
TextLabel.TextWrapped = true
TextLabel.TextColor3 = Color3.new(0.6, 0.2, 0.8)
TextLabel.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel.BorderColor3 = Color3.new(0.6, 0.2, 0.8)
TextLabel.BorderSizePixel = 4
TextLabel.Rounded = true
TextLabel.ClipsDescendants = true

local Box = Instance.new("Frame")
Box.Parent = TextLabel
Box.Size = UDim2.new(1, 0, 1, 0)
Box.BackgroundColor3 = Color3.new(0, 0, 0)
Box.BackgroundTransparency = 0.6
Box.BorderColor3 = Color3.new(0.6, 0.2, 0.8)
Box.BorderSizePixel = 4
Box.Rounded = true

TextLabel.MouseButton1Down:Connect(function()
    local mouse = game.Players.LocalPlayer:GetMouse()
    local dragStart = mouse.Hit.p
    local dragStartPos = TextLabel.Position
    local function update(input)
        local delta = input.p - dragStart
        TextLabel.Position = UDim2.new(0, dragStartPos.X.Offset + delta.X, 1, dragStartPos.Y.Offset - delta.Y)
    end
    mouse.Move:Connect(update)
    mouse.Button1Up:Connect(function()
        mouse.Move:Disconnect()
    end)
end)

local animation = TweenService:Create(TextLabel, TweenInfo.new(2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -100, 0.5, -50)})
animation:Play()


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
    Text = "hitbox expander",
    Callback = function()
    _G.HeadSize = 6
_G.Disabled = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
    for i,v in next, game:GetService('Players'):GetPlayers() do
        if v.Name ~= game:GetService('Players').LocalPlayer.Name then
            pcall(function()
                v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                v.Character.HumanoidRootPart.Transparency = 0.2
                v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Royal purple")  -- or "Electric purple"
                v.Character.HumanoidRootPart.Material = "Neon"
                v.Character.HumanoidRootPart.CanCollide = false
            end)
        end
    end
end
end)

end,
})

Page.Button({
    Text = "fps checker",
    Callback = function()
while wait(3)do
    setfpscap(150)
end
    end,
})


Page.Button({
    Text = "flying lucky block notification",
    Callback = function()
    local Workspace = game:GetService("Workspace")

-- Function to send a message to all players
local function sendMessageToAllPlayers(message)
    local Players = game:GetService("Players")

    for i, player in pairs(Players:GetPlayers()) do
        local playerGui = player:FindFirstChild("PlayerGui")
        if playerGui then
            local ScreenGui = Instance.new("ScreenGui")
            local TextLabel = Instance.new("TextLabel")

            TextLabel.Size = UDim2.new(0, 200, 0, 50)
            TextLabel.Position = UDim2.new(1, -210, 1, -60) -- Position changed to bottom right
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

-- Function to check if the flying_lucky_block with its Root has spawned
local function checkFlyingLuckyBlock()
    if Workspace:FindFirstChild("flying_lucky_block") then
        local flying_lucky_block = Workspace.flying_lucky_block
        if flying_lucky_block:FindFirstChild("Root") then
            sendMessageToAllPlayers("A flying Lucky Block has spawned!")
        end
    end
end

-- Run the checkFlyingLuckyBlock function every second
while wait(1) do
    checkFlyingLuckyBlock()
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
    Text = "inf fly tracking",
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
    Text = "jug map destroyer (requires jug rage blade)",
    Callback = function()
       
while wait()do
local ohTable1 = {
	["swordType"] = "juggernaut_rage_blade",
	["player"] = game:GetService("Players").LocalPlayer
}

game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.SwordSwingMiss:FireServer(ohTable1)
end
    end,
})

Page.Button({
    Text = "MutiAura V2 makes aura better old  (made by wynnech)",
    Callback = function()
       -- Create a new ScreenGui instance
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SliderGui"

-- Create a Frame to hold the GUI elements
local frame = Instance.new("Frame")
frame.Position = UDim2.new(0.8, 0, 0.2, 0) -- Position adjusted to top-right
frame.Size = UDim2.new(0, 100, 0, 50)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.Parent = screenGui
frame.Draggable = true

-- Create a label
local label = Instance.new("TextLabel")
label.Position = UDim2.new(0, 0, 0, 0)
label.Size = UDim2.new(1, 0, 0, 25)
label.TextColor3 = Color3.new(1, 1, 1)
label.BackgroundTransparency = 1
label.Text = "MultiAura"
label.Parent = frame

-- Create a button
local button = Instance.new("TextButton")
button.Position = UDim2.new(0, 0, 0.5, 0)
button.Size = UDim2.new(0, 10, 0, 20)
button.BackgroundColor3 = Color3.new(1, 0, 0)
button.Text = ""
button.Parent = frame

-- Utility Function
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
local on = false -- Start with the toggle off

-- When the player taps the button
button.MouseButton1Click:Connect(function()
    on = not on -- Toggle the state
    
    local newPos
    if on then
        newPos = UDim2.new(1, -button.AbsoluteSize.X, 0.5, 0)
        button.BackgroundColor3 = Color3.new(0, 1, 0)
        
        -- Start the heartbeat function when turned on
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
    else
        newPos = UDim2.new(0, 0, 0.5, 0)
        button.BackgroundColor3 = Color3.new(1, 0, 0)
    end

    -- Tween the button to the new position
    button:TweenPosition(newPos, "Out", "Quad", 0.5, true)
end)

-- Add the screenGui to the player's playerGui
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    end,
})


local Page = UI.New({
    Title = "fix's"
})


Page.Button({
    Text = "hit fix V2 and hit prediction",
    Callback = function()
       
local function performServerHitVerification(attacker, target)
   
end


local function calculatePredictiveAim(attacker, target)

end


local originalSwingSwordAtMouse = bedwars.SwordController.swingSwordAtMouse


debug.setconstant(bedwars.SwordController.swingSwordAtMouse, 27, "raycast")


debug.setupvalue(bedwars.SwordController.swingSwordAtMouse, 4, bedwars.QueryUtil)

bedwars.SwordController.swingSwordAtMouse = function(attacker, mousePosition)

    local predictedAimPosition = calculatePredictiveAim(attacker, mousePosition)


    local hitTarget = bedwars.QueryUtil.Raycast(predictedAimPosition)


    local isValidHit = performServerHitVerification(attacker, hitTarget)


    if isValidHit then
        originalSwingSwordAtMouse(attacker, mousePosition)
    end
end


bedwars.SwordController.swingSwordAtMouse(attacker, mousePosition)


    end,
})


Page.Button({
    Text = "lag back fix  still in progress (its not flawless wont fix all lag backs)",
    Callback = function()
     

               
    end,
})

Page.Button({
    Text = "Tracking system fix (not flawless)",
    Callback = function()
      local WEAPON_RANGE = 18

local function handleHit(target)
    print("Hit target: " .. target.Name)
end

local function performHitDetection()
    local character = game.Players.LocalPlayer.Character
    local rootPart = character:WaitForChild("HumanoidRootPart")

    local direction = (rootPart.CFrame.LookVector).unit
    local destination = rootPart.Position + direction * WEAPON_RANGE

    local result = workspace:Raycast(rootPart.Position, direction * WEAPON_RANGE)

    if result then
        local hitPart = result.Instance
        local humanoid = hitPart.Parent:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid.Parent ~= character then
            handleHit(hitPart.Parent)
        end
    end

    local predictedHitPosition = destination + (direction * (result and result.Distance or WEAPON_RANGE))

    local predictedResult = workspace:Raycast(rootPart.Position, (predictedHitPosition - rootPart.Position).unit * WEAPON_RANGE)

    if predictedResult then
        local predictedHitPart = predictedResult.Instance
        local predictedHumanoid = predictedHitPart.Parent:FindFirstChildOfClass("Humanoid")
        if predictedHumanoid and predictedHumanoid.Parent ~= character then
            handleHit(predictedHitPart.Parent)
        end
    end
end

game.Players.LocalPlayer:GetMouse().Button1Down:Connect(performHitDetection)


    end,
})
