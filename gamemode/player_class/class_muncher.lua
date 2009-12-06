local CLASS = {}

CLASS.DisplayName			= "Muncher"
CLASS.WalkSpeed 			= 400
CLASS.CrouchedWalkSpeed 	= 0.2
CLASS.RunSpeed				= 400
CLASS.DuckSpeed				= 0.2
CLASS.JumpPower				= 200
CLASS.PlayerModel			= "models/player/Kleiner.mdl"
CLASS.DrawTeamRing			= true
CLASS.DrawViewModel			= false
CLASS.CanUseFlashlight      = false
CLASS.MaxHealth				= 100
CLASS.StartHealth			= 100
CLASS.StartArmor			= 0
CLASS.RespawnTime           = 0 // 0 means use the default spawn time chosen by gamemode
CLASS.DropWeaponOnDie		= false
CLASS.TeammateNoCollide 	= true
CLASS.AvoidPlayers			= true // Automatically avoid players that we're no colliding
CLASS.Selectable			= true // When false, this disables all the team checking
CLASS.FullRotation			= false // Allow the player's model to rotate upwards, etc etc

function CLASS:Loadout( pl )
 
	//pl:Give( "weapon_357" )
 
end
 
function CLASS:OnSpawn( pl )
	if (IsValid(pl.Trail)) then
		pl.Trail:Remove()
	end
	
	if (IsValid(pl.Spotlight)) then
		pl.Spotlight:Remove()
	end
end
 
function CLASS:OnDeath( pl, attacker, dmginfo )
end
 
function CLASS:Think( pl )
end
 
function CLASS:Move( pl, mv )
end
 
function CLASS:OnKeyPress( pl, key )
end
 
function CLASS:OnKeyRelease( pl, key )
end
 
function CLASS:ShouldDrawLocalPlayer( pl )
	return false
end


function CLASS:CalcView( ply, origin, angles, fov )
	local View = {}
	View.origin = Origin
	View.angles = Angles
	View.fov = 110 
	return View
end
 
player_class.Register( "Muncher", CLASS )