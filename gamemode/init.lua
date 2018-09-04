AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile("cl_networkhooks.lua")
AddCSLuaFile("cl_scoreboard.lua")
AddCSLuaFile("cl_hud.lua")
AddCSLuaFile("player.lua")


include( "shared.lua" )
include("sv_networkhooks.lua")
include("sv_playerfunc.lua")
include("player.lua")
include("sv_gamemanager.lua")
include("sv_forcedownload.lua")
