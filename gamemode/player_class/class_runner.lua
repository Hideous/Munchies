local CLASS = {}

CLASS.DisplayName			= "Runner"
CLASS.WalkSpeed 			= 400
CLASS.CrouchedWalkSpeed 	= 0.2
CLASS.RunSpeed				= 400
CLASS.DuckSpeed				= 0.2
CLASS.JumpPower				= 200
CLASS.PlayerModel			= "models/player/breen.mdl"
CLASS.DrawTeamRing			= false
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
	pl.Trail = util.SpriteTrail(pl, 0, Color(255,0,0), false, 15, 1, 4, 1/(15+1)*0.5, "trails/plasma.vmt")
	
	pl.Spotlight = ents.Create("point_spotlight");
	pl.Spotlight:SetPos(pl:GetPos() + Vector(0, 0, 256));
	pl.Spotlight:SetAngles(Angle(-90, 0, 0))
	pl.Spotlight:SetParent(pl)
	pl.Spotlight:SetKeyValue("spotlightlength", 512);
	pl.Spotlight:SetKeyValue("spotlightwidth", 64);
	pl.Spotlight:SetKeyValue("rendercolor", "255 0 0");
	pl.Spotlight:Fire("LightOn", "", 0);
	pl.Spotlight:Activate()
end
 
function CLASS:OnDeath( pl, attacker, dmginfo )
	if (IsValid(pl.Spotlight)) then
		pl.Spotlight:Remove()
	end
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
end
 
player_class.Register( "Runner", CLASS )