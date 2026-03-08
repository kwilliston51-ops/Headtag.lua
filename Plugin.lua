local HeadTagPlugin = {
    ["Name"] = "HeadTag System",
    ["Description"] = "Adds a custom profile tag above your head."
}

-- The 'Library' is passed by the Hub automatically when you hit Import
function HeadTagPlugin:Init(Library)
    -- This creates the section/button in the Plugins tab you see in your photo
    local NewPluginTab = Library:CreateSection("HeadTag Settings")

    NewPluginTab:CreateButton({
        Name = "Activate Tag",
        Callback = function()
            -- This is where the actual HeadTag code goes
            local Player = game.Players.LocalPlayer
            local Char = Player.Character or Player.CharacterAdded:Wait()
            
            local Head = Char:WaitForChild("Head")
            if Head:FindFirstChild("OverdriveTag") then Head.OverdriveTag:Destroy() end

            local Billboard = Instance.new("BillboardGui")
            Billboard.Name = "OverdriveTag"
            Billboard.Size = UDim2.new(4, 0, 2, 0)
            Billboard.Adornee = Head
            Billboard.AlwaysOnTop = true
            Billboard.Parent = Head

            local Main = Instance.new("Frame")
            Main.Size = UDim2.new(1, 0, 1, 0)
            Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
            Main.BackgroundTransparency = 0.2
            Main.Parent = Billboard
            Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 8)

            local Info = Instance.new("TextLabel")
            Info.Size = UDim2.new(1, 0, 1, 0)
            Info.BackgroundTransparency = 1
            Info.TextColor3 = Color3.fromRGB(255, 255, 255)
            Info.Text = Player.Name .. "\nExec: Ronix"
            Info.Parent = Main
            
            print("HeadTag Activated!")
        end
    })
end

return HeadTagPlugin
