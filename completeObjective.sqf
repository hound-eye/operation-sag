params ["_objective"];

//send message that reinforcements will be sent soon.
[[blufor, "BLU"], format ["Target eliminated: %1", (name _unit)]] remoteExec ["sideChat"];
// this section of code must be executed in scheduled environment
switch (_objective) do
{
	case "signal": { _destPos = getPos spawn1 };
	case "antiair": { _destPos = getPos spawn2 };
	case obj3: { _destPos = getPos spawn3 };
	case obj4: { _destPos = getPos spawn4 };
	case obj5: { _destPos = getPos spawn5 };
	case obj6: { _destPos = getPos spawn6 };
};

[_unit] spawn {
	params ["_unit"];
	_playerRole = roleDescription _unit;
	// spawnees is a reference-type var
	_spawnees = list spawnTrigger;
	// filter spawnees for non-AI players, since we only want to teleport them
	_playerSpawnees = _spawnees select { isPlayer _x };
	// hint players in the trigger, that they are about to be deployed
	{
		["Prepare for deployment in 10 seconds"] remoteExec ["hint", owner _x];
	} forEach _playerSpawnees;
	// pause for 10 seconds
	sleep 8;

	// get new list of players again
	_playerSpawnees = _spawnees select { isPlayer _x };
	if (count _playerSpawnees > 0) then
	{
		{
			_destPos = "";
			switch (_unit) do
			{
				case enemy_mortar_obj: { _destPos = [10619.3,5898.51,0] };
				case enemy_mobile_hq: { _destPos = [10703.3,5417.86,0] };
				case obj3: { _destPos = [11465.8,5872.49,0] };
				case obj4: { _destPos = getPos spawn4 };
				case obj5: { _destPos = getPos spawn5 };
				case obj6: { _destPos = getPos spawn6 };
			};
			// perform teleport
			[0,"BLACK",2,0] remoteExec ["BIS_fnc_fadeEffect", owner _x];
			sleep 2;
			_x setPosATL _destPos;
			[""] remoteExec ["hintSilent", owner _x];
			[1,"BLACK",1,0] remoteExec ["BIS_fnc_fadeEffect", owner _x];

		} forEach _playerSpawnees;
		[[blufor, "BLU"], "Reinforcements have arrived!"] remoteExec ["sideChat"];
	}
};