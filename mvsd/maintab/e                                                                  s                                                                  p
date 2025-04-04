-- Function to highlight the player's character
local function highlightCharacter(player)
    local character = player.Character
    if character then
        -- Remove previous highlights if any
        for _, child in ipairs(character:GetChildren()) do
            if child:IsA("Highlight") then
                child:Destroy()
            end
        end
        
        -- Create a new Highlight for the character
        local highlight = Instance.new("Highlight")
        highlight.Parent = character
        highlight.Adornee = character
        highlight.FillColor = Color3.fromRGB(255, 255, 255)  -- White color for highlighting
        highlight.FillTransparency = 0.5  -- Semi-transparent for visibility
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)  -- White outline
        highlight.OutlineTransparency = 0.5  -- Semi-transparent outline
    end
end

-- Function to create a skeleton (wireframe) for the player
local function createSkeleton(character)
    -- Remove previous skeleton parts if any
    for _, child in ipairs(character:GetChildren()) do
        if child:IsA("Model") and child.Name == "Skeleton" then
            child:Destroy()
        end
    end

    -- Create a model to hold the skeleton parts
    local skeletonModel = Instance.new("Model")
    skeletonModel.Name = "Skeleton"
    skeletonModel.Parent = character
    
    -- List of body parts that are part of the skeleton
    local bodyParts = {
        character:WaitForChild("HumanoidRootPart"),
        character:WaitForChild("LowerTorso"),
        character:WaitForChild("UpperTorso"),
        character:WaitForChild("LeftLeg"),
        character:WaitForChild("RightLeg"),
        character:WaitForChild("LeftArm"),
        character:WaitForChild("RightArm"),
        character:WaitForChild("Head")
    }

    -- Create wireframe parts and connect them with WeldConstraints
    for i, part in ipairs(bodyParts) do
        if part then
            local skeletonPart = Instance.new("Part")
            skeletonPart.Size = Vector3.new(0.2, 0.2, 0.2)  -- Small size to represent joints
            skeletonPart.Shape = Enum.PartType.Ball
            skeletonPart.Color = Color3.fromRGB(255, 255, 255)  -- White color
            skeletonPart.Material = Enum.Material.SmoothPlastic
            skeletonPart.Anchored = false
            skeletonPart.CanCollide = false
            skeletonPart.Parent = skeletonModel
            
            -- Position the skeleton part at the body part's position
            skeletonPart.Position = part.Position

            -- Create a weld constraint between the body part and skeleton part
            local weld = Instance.new("WeldConstraint")
            weld.Part0 = part
            weld.Part1 = skeletonPart
            weld.Parent = skeletonPart
        end
    end
end

-- Function to highlight and create skeleton for the local player's character
local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        -- Highlight the character
        highlightCharacter(player)
        
        -- Create the skeleton
        createSkeleton(character)
    end)
end

-- Connect the player added event
game.Players.PlayerAdded:Connect(onPlayerAdded)

-- If the player is already in the game, apply the effect
for _, player in ipairs(game.Players:GetPlayers()) do
    if player.Character then
        highlightCharacter(player)
        createSkeleton(player.Character)
    end
end
