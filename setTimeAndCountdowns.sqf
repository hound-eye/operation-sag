if (!isServer) then exitWith {};

[{ 2 fadeSound 0; }] remoteExec ["call", -2];
[{ [0,"BLACK",2,1] call BIS_fnc_fadeEffect; }] remoteExec ["call", -2];

[2025, 4, 30, 5, 30] remoteExec ["setDate"];

[{2 fadeSound 1; }] remoteExec ["call", -2];
[{ [1,"BLACK",3,1] call BIS_fnc_fadeEffect; }] remoteExec ["call", -2];

sleep 60*90; // wait 90 minutes
[[blufor, "BLU"], _deployMessage] remoteExec ["We can't send any more reinforcements!"];
[nil, "MY_allowedReinforcements", false] call BIS_fnc_setServerVariable;