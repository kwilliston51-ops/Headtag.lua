-- Force-adds the Headtag button to your open Overdrive Hub
local Player = game.Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- This finds the Hub you already have open
local HubUI = CoreGui:FindFirstChild("Overdrive H") or CoreGui:FindFirstChild("Overdrive")

if HubUI then
    -- This script manually creates the Tag above your head
    local function CreateTag()
        local Char = Player.Character or Player.CharacterAdded:Wait()
        local Head = Char:WaitForChild("Head")
        if Head:FindFirstChild("OverdriveTag") then Head.OverdriveTag:Destroy() end

        local Billboard = Instance.new("BillboardGui", Head)
        Billboard.Name = "OverdriveTag"
        Billboard.Size = UDim2.new(4, 0, 2, 0)
        Billboard.AlwaysOnTop = true

        local Main = Instance.new("Frame", Billboard)
        Main.Size = UDim2.new(1, 0, 1, 0)
        Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        Main.BackgroundTransparency = 0.2
        Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 8)

        local Info = Instance.new("TextLabel", Main)
        Info.Size = UDim2.new(1, 0, 1, 0)
        Info.BackgroundTransparency = 1
        Info.TextColor3 = Color3.fromRGB(255, 255, 255)
        Info.Text = Player.Name .. "\nExec: Ronix"
        print("Tag Activated!")
    end

    -- Run it immediately so you don't have to wait for a button
    CreateTag()
    print("Headtag Forced Successfully!")
else
    print("Hub not found - please make sure Overdrive is open first!")
end
