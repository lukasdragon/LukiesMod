function endMatch( ply )
  PrintMessage(HUD_PRINTCENTER, ply:GetName().. " wins! Restarting...")
  ply:SendLua([[chat.AddText(Color( 70, 70, 200), "[Lukies Mod] ", Color( 255, 255, 255), "]]..ply:GetName().. [[ won.. Congrats!!")]])

  for k, v in pairs(player.GetAll()) do
        v:StripWeapons()
        v:Freeze( true )
    		v:SendLua( "GAMEMODE:ScoreboardShow()" )
  end

  timer.Create( "cleanupTimer", 5, 1, function()
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
