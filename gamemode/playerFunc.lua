function GM:PlayerInitialSpawn ( ply )
	ply:SetModel("models/player/p2_chell.mdl")
	ply:SetGravity(1)
	ply:SetWalkSpeed(350)
	ply:SetRunSpeed(420)
	ply:SetCrouchedWalkSpeed(0.3)
	ply:SetDuckSpeed(0.5)
	ply:SetBloodColor( 3 ) -- makes player blood look like sparks
	ply:SetMaxHealth( 200 )

	ply:SetNoCollideWithTeammates(false)
	ply:SetWeaponColor( Vector( 1, 0, 0 ) )
	ply:SendLua([[chat.AddText(Color( 70, 70, 200), "[Lukies Mod] ", Color( 255, 255, 255), "Welcome to the server!")]])
end

function GM:PlayerSpawn ( ply )
		ply:SetArmor( 100 )
		ply:Give ("weapon_physcannon")

		ply:SetupHands()
end

function GM:PlayerDeath(ply,inf,att)
	ply:EmitSound("vo/npc/male01/pain07.wav", 100, 100)

if ( ply == att) then
		ply:addPoints(-150)
		PrintMessage( HUD_PRINTTALK, ply:Name() .. " committed suicide." )
	else
		ply:addPoints(-50)
		att:addPoints(100)
		PrintMessage( HUD_PRINTTALK, ply:Name() .. " was killed by " .. att:Name() .. "." )
	end

--	att:AddFrags(1)
end

function GM:GetFallDamage (ply, flFallSpeed)
	return 0
end

function GM:CanPlayerSuicide()
	return true
end

function GM:PlayerCanPickupWeapon(ply,wep)
    return ( wep:GetClass() == "weapon_physcannon" )
end

local function DisableNoclip( ply )
	return false
end

hook.Add( "PlayerNoClip", "DisableNoclip", DisableNoclip )
