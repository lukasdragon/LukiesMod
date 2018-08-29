--adds font thats used

function HUD()
local client = LocalPlayer()



local healthTextX = ScrW() * 0.05
local healthTextY = ScrW() * 0.6
local healthCounterX = ScrW() * 0.09
local healthCounterY = ScrW() * 0.6

local ammoTextX = ScrW() * 0.86
local ammoTextY = ScrW() * 0.6
local ammoCounterX = ScrW() * 0.9
local ammoCounterY = ScrW() * 0.6
local guiColor = Color(0,229,255)


  if !client:Alive() then return end
  draw.SimpleText("HEALTH","HudSelectionText", healthTextX, healthTextY, guiColor)
  draw.SimpleText(client:Health(),"HudNumbers", healthCounterX, healthCounterY, guiColor)

  if client:Armor() > 0 then
    draw.SimpleText("ARMOR","HudSelectionText", ammoTextX, ammoTextY, guiColor)
    draw.SimpleText(client:Armor(),"HudNumbers", ammoCounterX, ammoCounterY, guiColor)
  end
end

hook.Add("HUDPaint", "CustomHud", HUD)


function HideHud(name)
  for k, v in pairs({"CHudHealth", "CHudAmmo", "CHudZoom", "CHudWeaponSelection", "CHudSecondaryAmmo", "CHudBattery" }) do
    if name == v then
      return false
    end
  end
end
hook.Add("HUDShouldDraw", "HideDefaultHud", HideHud)
