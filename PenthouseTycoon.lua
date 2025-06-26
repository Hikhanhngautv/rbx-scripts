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

-- Biến kiểm soát Auto Collect
local AutoCollect = false
local AutoCollectConnection

AutoFarm:CreateToggle({
	Name = "💸 Auto Collect Cash",
	CurrentValue = false,
	Flag = "AutoCashCollect",
	Callback = function(Value)
		AutoCollect = Value

		if AutoCollect then
			-- Tạo vòng lặp riêng không gây treo
			AutoCollectConnection = task.spawn(function()
				while AutoCollect do
					for _, v in pairs(workspace:GetDescendants()) do
						if v:IsA("TouchTransmitter") and v.Parent and v.Parent.Name == "Cash" then
							local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
							if hrp then
								firetouchinterest(hrp, v.Parent, 0)
								task.wait(0.05)
								firetouchinterest(hrp, v.Parent, 1)
							end
						end
					end
					task.wait(1)
				end
			end)
		else
			if AutoCollectConnection then
				task.cancel(AutoCollectConnection)
			end
		end
	end,
})
