net.Receive("play_Roundvictory", function()
	surface.PlaySound( "sfx/roundwin.wav" )
end)

net.Receive("play_Roundlost", function()
	surface.PlaySound("sfx/roundlose.wav")
end)

net.Receive("play_startRound", function()
	surface.PlaySound("sfx/roundbegin.wav")
end)
