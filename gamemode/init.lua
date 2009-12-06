AddCSLuaFile('cl_init.lua')
AddCSLuaFile('shared.lua')
AddCSLuaFile('cl_hud')

include('shared.lua')

// This is called every second to see if we can end the round
/*function GM:CheckRoundEnd()
 
	if ( !GAMEMODE:InRound() ) then return end 
 
	for k,v in pairs( team.GetPlayers( TEAM_HUMAN ) ) do
 
		if v:Frags() >= 10 then
 
		      GAMEMODE:RoundEndWithResult( v )
 
                end
 
        end
 
end*/
 
 framecounter = 0
 
 function GM:Think()
	
	framecounter = framecounter + 1
	if (framecounter == 5) then
		local runner = table.Random(team.GetPlayers(TEAM_RUNNER))
	 
		for k, v in pairs(team.GetPlayers( TEAM_MUNCHERS)) do
			if (v:GetPos():Distance(runner:GetPos()) < 32) then
				v:SetTeam(TEAM_RUNNER)
				runner:SetTeam(TEAM_MUNCHERS)
				v:SetRandomClass()
				runner:SetRandomClass()
				v:KillSilent()
				
				local dmginfo = DamageInfo()
				dmginfo:SetDamage(100)
				dmginfo:SetDamageType(DMG_GENERIC)
				dmginfo:SetAttacker(v)
				dmginfo:SetDamageForce(Vector(0, 0, 1000))
				runner:TakeDamageInfo(dmginfo)
				
				break
			end
		end
		framecounter = 0
	end
	
 end
 
// This is called after a player wins in a free for all
function GM:OnRoundWinner( ply, resulttext )
 
	//ply:AddScore( 1 ) // Let's pretend we have AddScore for brevity's sake
 
end
 
// Called when the round ends
function GM:OnRoundEnd( num )
 
       /*for k,v in pairs( team.GetPlayers( TEAM_MUNCHERS ) ) do
             v:SetFrags( 0 ) // Reset their frags for next round
       end
	   
	   for k,v in pairs( team.GetPlayers( TEAM_RUNNER ) ) do
             v:SetFrags( 0 ) // Reset their frags for next round
       end*/
 
end

function GM:PlayerSpawn( ply )
	self.BaseClass:PlayerSpawn( ply )
	
	if team.NumPlayers( TEAM_MUNCHERS ) > 1 and team.NumPlayers( TEAM_RUNNER ) < 1 then
	
		local randomguy = table.Random( team.GetPlayers( TEAM_MUNCHERS ) )
		randomguy:SetTeam( TEAM_RUNNER )
		randomguy:SetRandomClass()
		randomguy:KillSilent()
		
	end
	
	if (ply:Team() == TEAM_MUNCHERS && team.NumPlayers(TEAM_MUNCHERS) < 8) then
		GAMEMODE:SetPlayerSpeed(ply, 500, 500)
	end
	
end