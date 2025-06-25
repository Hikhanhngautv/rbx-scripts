while true do
    task.wait(1)
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("ProximityPrompt") and v.ActionText == "Collect"
then
            pcall(function()
                fireproximityprompt(v)
            end)
        end
    end
end
