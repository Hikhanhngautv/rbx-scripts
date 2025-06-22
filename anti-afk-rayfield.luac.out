-- 🛡️ Anti-AFK + Rayfield UI
-- Lưu ý: chạy trong executor (Synapse, KRNL, Fluxus...)

-- Load Rayfield Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Khởi tạo cửa sổ chính
local Window = Rayfield:CreateWindow({
   Name = "🛡️ Anti-AFK Menu",
   LoadingTitle = "Đang tải...",
   LoadingSubtitle = "by ChatGPT",
   ConfigurationSaving = {
      Enabled = false,
   },
   Discord = {
      Enabled = false,
   },
   KeySystem = false
})

-- Biến xử lý logic
local VirtualUser = game:GetService("VirtualUser")
local player = game:GetService("Players").LocalPlayer
local antiAFKEnabled = false
local delayTime = 60

-- Hàm bật Anti-AFK
local function StartAntiAFK()
    if antiAFKEnabled then return end
    antiAFKEnabled = true

    player.Idled:Connect(function()
        if antiAFKEnabled then
            VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            wait(1)
            VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end
    end)

    coroutine.wrap(function()
        while antiAFKEnabled do
            wait(delayTime)
            VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            wait(1)
            VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end
    end)()
end

-- Hàm tắt
local function StopAntiAFK()
    antiAFKEnabled = false
end

-- Tab chính
local MainTab = Window:CreateTab("Chống AFK", 4483362458) -- Icon Roblox

-- Toggle Bật/Tắt
MainTab:CreateToggle({
   Name = "Bật / Tắt Anti-AFK",
   CurrentValue = false,
   Flag = "AntiAFKToggle",
   Callback = function(Value)
        if Value then
            StartAntiAFK()
            Rayfield:Notify({
                Title = "Anti-AFK",
                Content = "✅ Đã bật!",
                Duration = 3,
            })
        else
            StopAntiAFK()
            Rayfield:Notify({
                Title = "Anti-AFK",
                Content = "⛔ Đã tắt!",
                Duration = 3,
            })
        end
   end,
})

-- Nhập thời gian delay
MainTab:CreateInput({
   Name = "Thời gian delay (giây)",
   PlaceholderText = "Nhập số giây (ví dụ: 60)",
   RemoveTextAfterFocusLost = false,
   Callback = function(Value)
        local num = tonumber(Value)
        if num then
            delayTime = num
            Rayfield:Notify({
                Title = "Delay",
                Content = "Delay đặt thành " .. num .. " giây.",
                Duration = 3,
            })
        else
            Rayfield:Notify({
                Title = "Lỗi",
                Content = "Vui lòng nhập số!",
                Duration = 3,
            })
        end
   end,
})
