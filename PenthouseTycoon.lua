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

-- Auto Collect Cash Toggle
local AutoCollect = false

AutoFarm:CreateToggle({
	Name = "💸 Auto Collect Cash",
	CurrentValue = false,
	Flag = "AutoCashCollect",
	Callback = function(Value)
		AutoCollect = Value

		if AutoCollect then
			task.spawn(function()
				while AutoCollect do
					task.wait(1)

					for _, v in pairs(workspace:GetDescendants()) do
						-- Tìm ProximityPrompt gắn với Mailbox
						if v:IsA("ProximityPrompt") and v.Parent and tostring(v.Parent):lower():find("mailbox") then
							fireproximityprompt(v)

						-- Tìm ClickDetector gắn với Mailbox
						elseif v:IsA("ClickDetector") and v.Parent and tostring(v.Parent):lower():find("mailbox") then
							fireclickdetector(v)
						end
					end
				end
			end)
		end
	end,
})
