function endMatch( ply )
  PrintMessage(HUD_PRINTCENTER, ply:GetName().. " wins! Restarting...")
  ply:SendLua([[chat.AddText(Color( 70, 70, 200), "[Lukies Mod] ", Color( 255, 255, 255), "]]..ply:GetName().. [[ won.. Congrats!!")]])

  for k, v in pairs(player.GetAll()) do
        v:StripWeapons()
        v:Freeze( true )
    		v:SendLua( "GAMEMODE:ScoreboardShow()" )

        if (v:GetName() == ply:GetName()) then
          net.Start("play_roundvictory")
          net.Send(v)
        else
          net.Start("play_roundlost")
          net.Send(v)
        end
  end

  timer.Create( "cleanupTimer", 14, 1, function()
    net.Start("play_startround")
    net.Broadcast(v)

    for k, v in pairs(player.GetAll()) do
          v:SendLua( "GAMEMODE:ScoreboardHide()" )
          v:setPoints(0)
          v:SetFrags(0)
          v:SetDeaths(0)
  				v:Spawn()
  	end
    game.CleanUpMap()
   end )
end
