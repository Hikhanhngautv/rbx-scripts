-- Tải Rayfield UI
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Tạo cửa sổ giao diện
local Window = Rayfield:CreateWindow({
	Name = "🍌 Banana Cat Hub - Penthouse Tycoon",
	LoadingTitle = "Banana Cat GUI",
	LoadingSubtitle = "by Hikhanhngautv",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "BananaCatHub",
		FileName = "PenthouseTycoon"
	},
	KeySystem = false,
})

-- Tab Auto Farm
local AutoFarm = Window:CreateTab("🏠 Auto Farm", 4483362458)

-- Thêm Toggle Auto Collect Cash
local AutoCollect = false

AutoFarm:CreateToggle({
	Name = "💸 Auto Collect Cash",
	CurrentValue = false,
	Flag = "AutoCashCollect",
	Callback = function(Value)
		AutoCollect = Value
		while AutoCollect do
			task.wait(1)

			for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
				if v:IsA("TouchTransmitter") and v.Parent and v.Parent.Name == "Cash" then
					firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
					task.wait()
					firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
				end
			end
		end
	end,
})
