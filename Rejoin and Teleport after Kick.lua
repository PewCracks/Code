-- // This script will spawn you back on the same position you've been kicked at, put this into your Auto-Execute.

local TeleportService = game:GetService("TeleportService")
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")

GuiService.ErrorMessageChanged:Connect(function()
    local CFrame = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RootPart.CFrame;
   
    queue_on_teleport(string.format([[
        game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()
        
        local Player, CharacterAdded = game:GetService("Players").LocalPlayer;
        CharacterAdded = Player.CharacterAdded:Connect(function(Character)
            Character:WaitForChild("Humanoid").RootPart.CFrame = CFrame.new(%f, %f, %f)
            CharacterAdded:Disconnect()
        end)

    ]], CFrame.x, CFrame.y, CFrame.z))

    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
end)
