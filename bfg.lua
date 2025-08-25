local FindFirstChildOfClass = game.FindFirstChildOfClass
local FindFirstChild = game.FindFirstChild
local GetService = game.GetService
local FTable = table.find

local Players = cloneref(GetService(game,'Players'));
local LocalPlayer = Players.LocalPlayer;
local Backpack = FindFirstChild(LocalPlayer, 'Backpack');
local UserInputService = cloneref(GetService(game,'UserInputService'))

getgenv().Key = Enum.KeyCode.F

local Guns = { 'Glock', 'Shotty', 'Sawed Off' };

local Character = LocalPlayer.Character


local function CheckGuns()
    for Index, Value in next, Backpack:GetChildren() do
        if Value:IsA("Tool") and FTable(Guns, Value.Name) then
            Value.Parent = Character
        end
    end
end


UserInputService.InputBegan:Connect(function(Key, GP)
    if Key.KeyCode == getgenv().Key and not GP then 
         CheckGuns()

        for i, v in pairs(Character:GetChildren()) do
            if v:IsA("Tool") and table.find(Guns, v.Name) then
                v:Activate()


local Players = game:GetService("Players")

local Client = Players.LocalPlayer
local Character = Client.Character
local Humanoid = Character ~= nil and Character:FindFirstChildOfClass("Humanoid")

if Humanoid then
    local Animation = Instance.new("Animation")
    Animation.AnimationId = "rbxassetid://15309223710"

    local Track = Humanoid:LoadAnimation(Animation)
    Track.Priority = Enum.AnimationPriority.Action4
    Track:Play()
    Track:AdjustSpeed(0)
end
            end
        end
    end
end)
