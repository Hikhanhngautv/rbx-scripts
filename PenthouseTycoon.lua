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

					local playerTycoon = nil
					-- Tìm tycoon của người chơi
					for _, tycoon in pairs(workspace.Tycoons:GetChildren()) do
						if tycoon:FindFirstChild("Owner") and tycoon.Owner.Value == game.Players.LocalPlayer then
							playerTycoon = tycoon
							break
						end
					end

					if playerTycoon then
						local mailbox = playerTycoon:FindFirstChild("Mailbox", true)
						if mailbox then
							-- Ưu tiên ClickDetector
							local click = mailbox:FindFirstChildOfClass("ClickDetector")
							if click then
								fireclickdetector(click)
							end

							-- Hoặc dùng ProximityPrompt nếu không có ClickDetector
							local prompt = mailbox:FindFirstChildOfClass("ProximityPrompt")
							if prompt then
								fireproximityprompt(prompt)
							end
						end
					end
				end
			end)
		end
	end,
})
