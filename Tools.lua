local DevTools = {}

DevTools.ToObject = function(Object, Filter, Offset)
    if not Offset.Distance then
        Offset.Distance = 3
    end
    if not Offset.OffSetFacing then 
        Offset.OffSetFacing = "Front"
    end
    if Offset.OffSetFacing == "Front" then 
        Offset.Distance = -Offset.Distance 
    end
    if Filter.ObjectTypeFilter == "None" and Filter.ObjectNameFilter == "None" then 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Object.CFrame * CFrame.new(0, 0, Offset.Distance)
    elseif Filter.ObjectTypeFilter ~= "None" and Filter.ObjectNameFilter == "None" then 
        if Object:IsA(Filter.ObjectTypeFilter) then 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Object.CFrame * CFrame.new(0, 0, Offset.Distance)
        end
    elseif Filter.ObjectTypeFilter == "None" and Filter.ObjectNameFilter ~= "None" then 
        if Object.Name == Filter.ObjectNameFilter then 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Object.CFrame * CFrame.new(0, 0, Offset.Distance)
        end
    elseif Filter.ObjectNameFilter ~= "None" and Filter.ObjectTypeFilter ~= "None" then  
        if Object:IsA(Filter.ObjectTypeFilter) and Object.Name == Filter.ObjectNameFilter then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Object.CFrame * CFrame.new(0, 0, Offset.Distance)
        end
    end
end

DevTools.ToPlayer = function(Player)
    if game.Players:FindFirstChild(Player.Name) then 
        local HRP = Player.Character.HumanoidRootPart
        DevTools.ToObject(HRP, {ObjectNameFilter = "HumanoidRootPart", ObjectTypeFilter = "Part"}, {Distance = 4, OffSetFacing = "Back"})
    end
end

DevTools.Contains = function(Object, Name)
    for i,v in pairs(Object:GetChildren()) do 
        if v.Name == Name then 
            return true 
        else
            return false 
        end
    end
end
