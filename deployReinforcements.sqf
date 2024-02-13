//server side-only script
if (!isServer) exitWith {};

params ["_toPos", "_deployMessage"];
// script that teleports players with a 10 second delay,
// applying fade-to-black effect 2 seconds before the teleport
//
//_toPos - position to teleport reinforcements to
// spawnees is a reference-type var

[[blufor, "BLU"], "begin test"] remoteExec ["sideChat"];

_spawnees = list spawn_area;
private "_playerSpawnees";
_playerSpawnees = _spawnees select { isPlayer _x };
// hint players in the trigger, that they are about to be deployed
{
	for [{_i=10},{_i>=2},{_i=_i-1}] do 
    {
        [format ["Deploying in %1 seconds", _i]] remoteExec ["hintSilent"]; 
        sleep 1;
    };
	["Deploying now!"] remoteExec ["hint", owner _x];
} forEach _playerSpawnees;

if (count _spawnees > 0) then
{
	// 2 second before teleport, apply screen blackout (for players)
	{
		
		if (isPlayer _x ) then {
			[0,"BLACK",2,0] remoteExec ["BIS_fnc_fadeEffect", owner _x];
		};
	} forEach _spawnees;
	sleep 2;
	// at 0 seconds, teleport units and clear the screen (for players)
	{
		_x setPosATL getPos _toPos;
		if (isPlayer _x) then {
			[""] remoteExec ["hintSilent", owner _x];
			[1,"BLACK",1,0] remoteExec ["BIS_fnc_fadeEffect", owner _x];
		};
	} forEach _spawnees;

	[[blufor, "BLU"], _deployMessage] remoteExec ["sideChat"];
}