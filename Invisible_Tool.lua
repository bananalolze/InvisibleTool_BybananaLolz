-- INVISIBLE TOOL BY BananaLolz

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Track toggle state
local invisibleEnabled = false

-- Function to toggle invisibility
local function setInvisible(invisible)
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Transparency = invisible and 1 or 0
            part.CanCollide = not invisible
        elseif part:IsA("Decal") or part:IsA("Texture") then
            part.Transparency = invisible and 1 or 0
        end
    end
end

-- Create Tool
local tool = Instance.new("Tool")
tool.Name = "Invisible"
tool.RequiresHandle = false
tool.CanBeDropped = false
tool.Parent = player:WaitForChild("Backpack")

-- Toggle invisibility on tool activation
tool.Activated:Connect(function()
    invisibleEnabled = not invisibleEnabled
    setInvisible(invisibleEnabled)
end)
