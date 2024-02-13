// configure pick-able intel (server side)
execVM "configureIntel.sqf";

[missionNamespace, "MY_allowedReinforcements", true] call BIS_fnc_setServerVariable;