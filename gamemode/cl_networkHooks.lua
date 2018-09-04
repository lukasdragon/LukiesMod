net.Receive("PlayerRoundWon", function()
	surface.PlaySound( "sfx/roundwin.wav" )
end)

net.Receive("PlayerRoundLost", function()
	surface.PlaySound("sfx/roundlose.wav")
end)

net.Receive("PlayerRoundStart", function()
	surface.PlaySound("sfx/roundbegin.wav")
end)
