function endMatch( ply )
  PrintMessage(HUD_PRINTCENTER, ply:GetName().. " wins! Restarting...")
  ply:SendLua([[chat.AddText(Color( 70, 70, 200), "[Lukies Mod] ", Color( 255, 255, 255), "]]..ply:GetName().. [[ won.. Congrats!!")]])

  for k, v in pairs(player.GetAll()) do
        v:StripWeapons()
        v:Freeze( true )
    		v:SendLua( "GAMEMODE:ScoreboardShow()" )

        if (v:GetName() == ply:GetName()) then
          net.Start("PlayerRoundWon")
          net.Send(v)
        else
          net.Start("PlayerRoundLost")
          net.Send(v)
        end
  end

  timer.Create( "cleanupTimer", 14, 1, function()


    for k, v in pairs(player.GetAll()) do
          v:SendLua( "GAMEMODE:ScoreboardHide()" )
          v:setPoints(0)
          v:SetFrags(0)
          v:SetDeaths(0)
  				v:Spawn()
  	end
    game.CleanUpMap()
    net.Start("PlayerRoundStart")
    net.Broadcast(v)
   end )
end
