local Plugin = {
    ["Name"] = "Headtag",
    ["Description"] = "Custom Headtag for Ronix"
}

function Plugin:Init(Library)
    -- This 'Library' variable is passed by Overdrive to create the UI
    local Section = Library:CreateSection("Headtag Settings")

    Section:CreateButton({
        Name = "Activate Tag",
        Callback = function()
            local Player = game.Players.LocalPlayer
            local Character = Player.Character or Player.CharacterAdded:Wait()
            local Head = Character:WaitForChild("Head")

            -- Clean up any old tags
            if Head:FindFirstChild("OverdriveTag") then 
                Head.OverdriveTag:Destroy() 
            end

            -- Create the Tag UI
            local Billboard = Instance.new("BillboardGui", Head)
            Billboard.Name = "OverdriveTag"
            Billboard.Size = UDim2.new(4, 0, 2, 0)
            Billboard.AlwaysOnTop = true
            Billboard.ExtentsOffset = Vector3.new(0, 3, 0)

            local Main = Instance.new("Frame", Billboard)
            Main.Size = UDim2.new(1, 0, 1, 0)
            Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
            Main.BackgroundTransparency = 0.2
            local Corner = Instance.new("UICorner", Main)
            Corner.CornerRadius = UDim.new(0, 8)

            local Info = Instance.new("TextLabel", Main)
            Info.Size = UDim2.new(1, 0, 1, 0)
            Info.BackgroundTransparency = 1
            Info.TextColor3 = Color3.fromRGB(255, 255, 255)
            Info.Text = Player.Name .. "\nExec: Ronix"
            Info.Font = Enum.Font.GothamBold
            Info.TextSize = 14
        end
    })
end

return Plugin
