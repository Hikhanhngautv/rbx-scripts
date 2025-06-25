while task.wait(0.5) do
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("ProximityPrompt") and v.ActionText == "Collect"
then
            fireproximityprompt(v)
        end
    end
end
