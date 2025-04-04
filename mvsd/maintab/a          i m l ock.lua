-- Variables
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local followDistance = 10  -- Distance at which the mouse will start following the player

-- Function to make the mouse follow the player if within distance
local function updateMousePosition()
    local character = player.Character
    if character then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            -- Get the position of the mouse and the player's humanoid root part
            local mousePos = mouse.Hit.p
            local playerPos = humanoidRootPart.Position
            local distance = (mousePos - playerPos).Magnitude

            -- If within the follow distance, make the mouse 'follow' the player
            if distance <= followDistance then
                -- Simulate the mouse following the player by doing something like clicking near the player
                -- In this case, we can print the position where the mouse "should be" or perform other actions
                print("Mouse is following the player at position:", playerPos)
            else
                -- Do nothing if the player is out of range
                -- You could reset or trigger different behavior here if needed
                print("Mouse is not following (out of range).")
            end
        end
    end
end

-- Continuously check the mouse position and make it follow the player
game:GetService("RunService").Heartbeat:Connect(updateMousePosition)
