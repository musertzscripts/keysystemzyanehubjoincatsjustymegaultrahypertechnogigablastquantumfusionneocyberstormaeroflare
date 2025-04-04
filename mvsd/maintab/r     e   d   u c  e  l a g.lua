-- Script to remove decals and reduce texture usage in the map
local function removeTextures()
    -- Loop through all parts in the game
    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("Part") or object:IsA("MeshPart") then
            -- Remove any Decals
            for _, decal in ipairs(object:GetChildren()) do
                if decal:IsA("Decal") or decal:IsA("Texture") then
                    decal:Destroy()
                end
            end

            -- Set material to SmoothPlastic (or Plastic)
            object.Material = Enum.Material.Plastic
        end
    end
end

-- Run the function to remove textures
removeTextures()
