GM.Name = "Lukies Mod"
GM.Author = "AquaDark"

DeriveGamemode( "base" )

function GM:Initialize()
	self.BaseClass.Initialize( self )
end

local TEAM_SPEC, TEAM_PLAYER = 0, 1

team.SetUp( 0, "Spectators", Color( 250, 250, 0))
team.SetUp( 1, "Players", Color( 0, 180, 255))

util.PrecacheModel("models/player/p2_chell.mdl")
