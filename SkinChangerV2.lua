local SkinChanger = {}
local Viewmodels = game.ReplicatedStorage.Viewmodels

function SkinChanger:ChangeViewmodels(vwm1)
local wep,wep2,name,name2
   for i,v in pairs(Viewmodels:GetChildren()) do
      if v.Name == "v_"..game.Players.LocalPlayer.Character.Gun:GetAttribute("Weapon") and not v.Name:match("RLV") then
         name = v.Name
         wep = v
      end
   end
   for i2,v2 in pairs(Viewmodels:GetChildren()) do
      if v2.Name == vwm1 and not v2.Name:match("RLV") then
         name2 = v2.Name
         wep2 = v2
      end
   end
   wep:SetAttribute("ViewmodelChanged", name)
   wep2:SetAttribute("ViewmodelChanged", name2)
   wep.Name = name2
   wep2.Name = name
end

function SkinChanger:RevertViewmodels()
   for i,v in pairs(Viewmodels:GetChildren()) do
      if v:GetAttribute("ViewmodelChanged") then
         v.Name = tostring(v:GetAttribute("ViewmodelChanged"))
         v:SetAttribute("ViewmodelChanged", nil)
      end
   end
end

return SkinChanger
