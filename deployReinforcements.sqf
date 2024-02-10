params ["_fromTrigger", "_toPos", "_includeAI"];
// script that teleports players with a 10 second delay,
// applying fade-to-black effect 2 seconds before the teleport
//
//_fromTrigger - trigger object, from which we get list of players(units) to teleport
//_toPos - position to teleport reinforcements to
// spawnees is a reference-type var

_spawnees = list spawn_area;
// if includeAI is not set, then we only want to select players from the trigger
private "_playerSpawnees";
if (!isNil "_includeAI") then {
	_playerSpawnees = _spawnees select { isPlayer _x };
} else {
	_playerSpawnees = _spawnees
};
// hint players in the trigger, that they are about to be deployed
{
	for [{_i=10},{_i>=2},{_i=_i-1}] do 
    {
        [format ["Deploying in %1 seconds", _i]] remoteExec ["hintSilent"]; 
        sleep 1;
    };
	["Deploying now!"] remoteExec ["hint", owner _x];
} forEach _playerSpawnees;
[blufor, "BLU"] sideChat format ["Deploying reinforcements: %1", _playerSpawnees];
// get new list of players again
if (!isNil "_includeAI") then {
	_playerSpawnees = _spawnees select { isPlayer _x };
} else {
	_playerSpawnees = _spawnees
};

if (count _playerSpawnees > 0) then
{
	{
		// perform teleport
		[0,"BLACK",2,0] remoteExec ["BIS_fnc_fadeEffect", owner _x];
		sleep 2;
		// TODO DISABLE SPECTATOR CAMERA VIEW
		_x setPosATL getPos _toPos;
		[""] remoteExec ["hintSilent", owner _x];
		[1,"BLACK",1,0] remoteExec ["BIS_fnc_fadeEffect", owner _x];

	} forEach _playerSpawnees;
	[[blufor, "BLU"], "Reinforcements have arrived!"] remoteExec ["sideChat"];
}