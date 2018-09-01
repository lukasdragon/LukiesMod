net.Receive("play_Roundvictory", function()
	surface.PlaySound( "roundWin.wav" )
end)

net.Receive("play_Roundlost", function()
	surface.PlaySound("roundLose.wav")
end)

net.Receive("play_startRound", function()
	surface.PlaySound("roundBegin.wav")
end)
