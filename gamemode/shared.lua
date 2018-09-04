GM.Name = "Lukies Mod"
GM.Author = "AquaDark"

DeriveGamemode( "base" )

function GM:Initialize()
	self.BaseClass.Initialize( self )
end

util.PrecacheModel("models/player/p2_chell.mdl")

local function FindPlayerByName(name)
	for _,v in ipairs(player.GetAll()) do
		if string.match(v:Name(),name) then return v end
	end
end


CreateConVar( "lm_maxscore", 1000, FCVAR_REPLICATED, "The maxiumum number of points before a map reset")

concommand.Add( "killyourself", function( ply, cmd, args )
	ply:Kill()
	print( "You killed yourself!" )
end )

concommand.Add( "lm_addpoints", function( ply, cmd, args )
	local nick = args[1]
	nick = string.lower( nick )

	for k, v in pairs( player.GetAll() ) do
		if string.find( string.lower( v:Nick() ), nick ) then
			v:addPoints(args[2])
			return
		end
	end

	MsgN( "Couldn't find player." )

end, function(cmd, stringargs)
	print( cmd, stringargs )
		stringargs = string.Trim( stringargs ) -- Remove any spaces before or after.
		stringargs = string.lower( stringargs )
		local tbl = {}
		for k, v in pairs( player.GetAll() ) do
			local nick = v:Nick()
			if string.find( string.lower( nick ), stringargs ) then
				nick = "\"" .. nick .. "\"" -- We put quotes around it in case players have spaces in their names.
				nick = "lm_addpoints " .. nick -- We also need to put the cmd before for it to work properly.

				table.insert( tbl, nick )
			end
		end

		return tbl


end,"Adds points to the named player.", FCVAR_CHEAT)
