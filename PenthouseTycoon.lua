task.spawn(function()
    while task.wait(1) do
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("ProximityPrompt") and v.ActionText == "Collect" then
                pcall(function()
                    fireproximityprompt(v)
                end)
            end
        end
    end
end)
