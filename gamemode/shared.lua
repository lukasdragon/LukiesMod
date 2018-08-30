GM.Name = "Lukies Mod"
GM.Author = "AquaDark"

DeriveGamemode( "base" )

function GM:Initialize()
	self.BaseClass.Initialize( self )
end

util.PrecacheModel("models/player/p2_chell.mdl")
