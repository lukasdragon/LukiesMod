local ScoreboardDerma = nil
local PlayerList = nil


function GM:ScoreboardShow()
  if !IsValid(ScoreboardDerma) then
    ScoreboardDerma = vgui.Create("DFrame")
    --ScoreboardDerma:SetSize( ScrW() * 800 / 1920 , ScrH() * 1000 / 1200)
    ScoreboardDerma:SetSize( ScrW() * 0.42 , ScrH() * 0.83)
    ScoreboardDerma:Center()
    ScoreboardDerma:SetTitle("")
    ScoreboardDerma:SetDraggable(false)
    ScoreboardDerma:ShowCloseButton(false)
    ScoreboardDerma.Paint = function()
    end



    --Draws gamemode logo
    local logo = vgui.Create( "DImage", ScoreboardDerma )	-- Add image to Frame
    logo:SetPos( ScoreboardDerma:GetWide() / 3 * 1, 0 )	-- Move it into frame
    logo:SetSize( 230, 128 )	-- Size it to 150x150
    logo:SetImage( "ui/LM_logo.png" )

    --draws stuff related to the player info
    local PlayerScrollPanel = vgui.Create("DScrollPanel", ScoreboardDerma)
    PlayerScrollPanel:SetSize(ScoreboardDerma:GetWide(),ScoreboardDerma:GetTall() - 20)
    PlayerScrollPanel:SetPos(0, 150)
    PlayerList = vgui.Create("DListLayout",PlayerScrollPanel)
    PlayerList:SetSize(PlayerScrollPanel:GetWide(),PlayerScrollPanel:GetTall())
    PlayerList:SetPos(0,0)
  end

  if IsValid(ScoreboardDerma) then
    PlayerList:Clear()


    -- draws description text for the scoreboard info
    local PlayerPanel = vgui.Create("DPanel", PlayerList)
    PlayerPanel:SetSize(PlayerList:GetWide(),25)
    PlayerPanel:SetPos(0,0)
    PlayerPanel.Paint = function()
      draw.RoundedBox(0,0,0,PlayerPanel:GetWide(),PlayerPanel:GetTall(),Color(50,50,50,255))
      draw.SimpleText("Player", "DermaDefault", 5, 5, Color(255,255,255))
      draw.SimpleText("Score", "DermaDefault", PlayerList:GetWide() - 200, 5, Color(255,255,255), TEXT_ALIGN_RIGHT)
      draw.SimpleText("Frags", "DermaDefault", PlayerList:GetWide() - 140, 5, Color(255,255,255), TEXT_ALIGN_RIGHT)
      draw.SimpleText("Deaths", "DermaDefault", PlayerList:GetWide() - 80, 5, Color(255,255,255), TEXT_ALIGN_RIGHT)
      draw.SimpleText("Ping", "DermaDefault", PlayerList:GetWide() - 20, 5, Color(255,255,255), TEXT_ALIGN_RIGHT)
  end

    for k, v in pairs(player.GetAll()) do
      local PlayerPanel = vgui.Create("DPanel", PlayerList)
      PlayerPanel:SetSize(PlayerList:GetWide(),25)
      PlayerPanel:SetPos(0,0)
      PlayerPanel.Paint = function()
        draw.RoundedBox(0,0,0,PlayerPanel:GetWide(),PlayerPanel:GetTall(),Color(50,50,50,196))
        draw.RoundedBox(0,0,24,PlayerPanel:GetWide(),1,Color(50,50,50,196))

        draw.SimpleText(v:Name(), "DermaDefault", 5, 5, Color(255,255,255))
        draw.SimpleText(v:Ping(), "DermaDefault", PlayerList:GetWide() - 20, 5, Color(255,255,255), TEXT_ALIGN_RIGHT)
        draw.SimpleText(v:Deaths(), "DermaDefault", PlayerList:GetWide() - 80, 5, Color(255,255,255), TEXT_ALIGN_RIGHT)
        draw.SimpleText(v:Frags(), "DermaDefault", PlayerList:GetWide() - 140, 5, Color(255,255,255), TEXT_ALIGN_RIGHT)
        draw.SimpleText(v:getPoints(), "DermaDefault", PlayerList:GetWide() - 200, 5, Color(255,255,255), TEXT_ALIGN_RIGHT)
      end
    end


    ScoreboardDerma:Show()
    ScoreboardDerma:MakePopup()
    ScoreboardDerma:SetKeyBoardInputEnabled(false)
  end
end

function GM:ScoreboardHide()
  if IsValid(ScoreboardDerma) then
    ScoreboardDerma:Hide()
  end
end
