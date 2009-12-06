GM.Name 	= "Munchies"
GM.Author 	= "Hideous & Don Andy"
GM.Email 	= ""
GM.Website 	= ""
GM.Help		= "As the runner, grab steroids to score.\n As a Muncher, eat the runner to become the runner!"
 
GM.Data = {}
 
DeriveGamemode( "fretta" )
IncludePlayerClasses()					// Automatically includes files in "gamemode/player_class"
 
GM.TeamBased = true					// Team based game or a Free For All game?
GM.AllowAutoTeam = true
GM.AllowSpectating = true
GM.SecondsBetweenTeamSwitches = 10
GM.GameLength = 15
GM.RoundLimit = 10					// Maximum amount of rounds to be played in round based games
GM.VotingDelay = 5					// Delay between end of game, and vote. if you want to display any extra screens before the vote pops up
 
GM.NoPlayerSuicide = true
GM.NoPlayerDamage = true
GM.NoPlayerSelfDamage = true		// Allow players to hurt themselves?
GM.NoPlayerTeamDamage = true		// Allow team-members to hurt each other?
GM.NoPlayerPlayerDamage = true 	// Allow players to hurt each other?
GM.NoNonPlayerPlayerDamage = true 	// Allow damage from non players (physics, fire etc)
GM.NoPlayerFootsteps = false		// When true, all players have silent footsteps
GM.PlayerCanNoClip = false			// When true, players can use noclip without sv_cheats
GM.TakeFragOnSuicide = false			// -1 frag on suicide
 
GM.MaximumDeathLength = 10			// Player will respawn if death length > this (can be 0 to disable)
GM.MinimumDeathLength = 5			// Player has to be dead for at least this long
GM.AutomaticTeamBalance = false     // Teams will be periodically balanced 
GM.ForceJoinBalancedTeams = false	// Players won't be allowed to join a team if it has more players than another team
GM.RealisticFallDamage = false
GM.AddFragsToTeamScore = false		// Adds player's individual kills to team score (must be team based)
 
GM.NoAutomaticSpawning = false		// Players don't spawn automatically when they die, some other system spawns them
GM.RoundBased = true				// Round based, like CS
GM.RoundLength = 60 * 2					// Round length, in seconds
GM.RoundPreStartTime = 5			// Preperation time before a round starts
GM.RoundPostLength = 5				// Seconds to show the 'x team won!' screen at the end of a round
GM.RoundEndsWhenOneTeamAlive = false	// CS Style rules
 
GM.EnableFreezeCam = true			// TF2 Style Freezecam
GM.DeathLingerTime = 3				// The time between you dying and it going into spectator mode, 0 disables
 
GM.SelectModel = false               // Can players use the playermodel picker in the F1 menu?
GM.SelectColor = false				// Can players modify the colour of their name? (ie.. no teams)
 
GM.PlayerRingSize = 48              // How big are the colored rings under the player's feet (if they are enabled) ?
GM.HudSkin = "SimpleSkin"
 
GM.ValidSpectatorModes = { OBS_MODE_CHASE }
GM.ValidSpectatorEntities = { "player" }	// Entities we can spectate
GM.CanOnlySpectateOwnTeam = false // you can only spectate players on your own team*/

TEAM_MUNCHERS = 3
TEAM_RUNNER = 4

function GM:CreateTeams()

	if ( !GAMEMODE.TeamBased ) then return end

	team.SetUp(TEAM_MUNCHERS, "Munchers", Color(230, 40, 40), true);
	team.SetSpawnPoint( TEAM_MUNCHERS, { "info_player_rebel" } )
	team.SetClass( TEAM_MUNCHERS, { "Muncher" } )
	
	team.SetUp(TEAM_RUNNER, "Runner", Color( 40, 40, 230), false)
	team.SetSpawnPoint(TEAM_RUNNER, { "info_player_combine" } )
	team.SetClass( TEAM_RUNNER, { "Runner" } )
	
	team.SetUp(TEAM_SPECTATOR, "Spectators", Color(128,128,128), true)
	team.SetSpawnPoint(TEAM_SPECTATOR, {"info_player_rebel", "info_player_combine"} )
end