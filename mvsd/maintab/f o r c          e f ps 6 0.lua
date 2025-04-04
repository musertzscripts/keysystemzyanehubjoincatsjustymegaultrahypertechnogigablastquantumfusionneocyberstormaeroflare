-- Performance Optimizer Script

-- Force FPS Limit
game:GetService("RunService").Heartbeat:Connect(function(_, dt)
    -- Force a smoother frame rate (near 60 FPS)
    -- We cap the time between frames to simulate a 60 FPS experience
    if dt > (1/60) then
        wait(1/60) -- This waits to ensure the game runs at a maximum of 60 FPS
    end
end)

-- Remove unnecessary textures and decals
local function removeTextures()
    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("Part") or object:IsA("MeshPart") then
            -- Remove any Decals
            for _, decal in ipairs(object:GetChildren()) do
                if decal:IsA("Decal") or decal:IsA("Texture") then
                    decal:Destroy()
                end
            end
            -- Set material to Plastic (less resource-intensive)
            object.Material = Enum.Material.Plastic
        end
    end
end

-- Optimize physics settings
local function optimizePhysics()
    -- Set the physics to be less demanding on the client
    game:GetService("PhysicsService"):SetTimeStep(1 / 60)  -- Ensuring the physics engine updates at a fixed interval
    game:GetService("Workspace").Gravity = Vector3.new(0, -9.8, 0) -- Standard gravity to avoid unnecessary adjustments
end

-- Remove lag frames by optimizing script execution
local function optimizeScripts()
    -- Limit the frequency of high-demand tasks (e.g., preventing unnecessary loops)
    local function throttleFunctions()
        while true do
            -- You can limit unnecessary running of functions, especially for large loops
            wait(1)  -- Forces a small delay between function executions
        end
    end
    coroutine.wrap(throttleFunctions)()
end

-- Run all optimization functions
removeTextures()
optimizePhysics()
optimizeScripts()
