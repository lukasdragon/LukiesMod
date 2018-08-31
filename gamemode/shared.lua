GM.Name = "Lukies Mod"
GM.Author = "AquaDark"

DeriveGamemode( "base" )

function GM:Initialize()
	self.BaseClass.Initialize( self )
end

util.PrecacheModel("models/player/p2_chell.mdl")

CreateConVar( "lm_maxscore", 1000, FCVAR_REPLICATED, "The maxiumum number of points before a map reset")
