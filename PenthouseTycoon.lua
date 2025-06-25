-- Tải Rayfield UI
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Tạo cửa sổ UI chính
local Window = Rayfield:CreateWindow({
	Name = "🍌 Banana Cat Hub - Penthouse Tycoon",
	LoadingTitle = "Banana Cat GUI",
	LoadingSubtitle = "by Hikhanhngautv",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "BananaCatHub", -- đổi tên nếu muốn
		FileName = "PenthouseConfig"
	},
        Discord = {
           Enabled = false
        },
        KeySystem = false
})

-- Tạo Tab chính
local MainTab = Window:CreateTab("🏠 Auto Farm", 4483362458) -- iconID Roblox
local TeleportTab = Window:CreateTab("🚀 Teleport", 4483345998)
local SettingTab = Window:CreateTab("⚙️ Settings", 4483345998)

-- Bạn sẽ thêm các Section, Toggle, Button sau
