-- GUI Auto Collect Không Dùng HttpGet
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame", ScreenGui)
local Toggle = Instance.new("TextButton", Frame)
local UICorner = Instance.new("UICorner", Frame)

-- Giao diện
ScreenGui.Name = "AutoCollectGUI"
Frame.Size = UDim2.new(0, 150, 0, 50)
Frame.Position = UDim2.new(0, 20, 0, 200)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

UICorner.CornerRadius = UDim.new(0, 12)

Toggle.Size = UDim2.new(1, 0, 1, 0)
Toggle.Text = "🔴 Auto Collect: OFF"
Toggle.TextColor3 = Color3.new(1, 1, 1)
Toggle.BackgroundTransparency = 1

-- Biến kiểm soát
local running = false

-- Hàm auto collect
local function autoCollect()
    while running do
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("ProximityPrompt") and v.ActionText == "Collect" then
                pcall(function()
                    fireproximityprompt(v)
                end)
            end
        end
        wait(1)
    end
end

-- Khi bấm nút
Toggle.MouseButton1Click:Connect(function()
    running = not running
    Toggle.Text = running and "🟢 Auto Collect: ON" or "🔴 Auto Collect: OFF"
    if running then
        autoCollect()
    end
end)
