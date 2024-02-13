//params ["_tempDestPos", "_finalDestPos", "_finalDestDir", "_skipTime"];
private _transportUnit = _this select 0;
_this select 3 params ["_tempDestPos", "_finalDestPos", "_finalDestDir", "_skipTime"];

// workaround - to avoid collisions, teleport to flat ground
// on these coordinates first, then rotate to desired direction,
// and then teleport to final coordinates

//lock and start the vehicle
if (!isEngineOn _transportUnit) then { _transportUnit engineOn true; };
_transportUnit setVehicleLock "LOCKED";

//fade screen and sound
{
	[{ 2 fadeSound 0; }] remoteExec ["call", _x];
	[{ [0,"BLACK",2,1] call BIS_fnc_fadeEffect; }] remoteExec ["call", _x];
} forEach crew _transportUnit;
sleep 3;
if (!isNil "_skipTime") then {
	skipTime _skipTime;
};
//perform teleport
_transportUnit setPosATL _tempDestPos;
_transportUnit setDir _finalDestDir;
_transportUnit setPosATL _finalDestPos;

//WAKE UP
{
	[{2 fadeSound 1; }] remoteExec ["call", _x];
	[{ [1,"BLACK",3,1] call BIS_fnc_fadeEffect; }] remoteExec ["call", _x];
} forEach crew _transportUnit;

// unlock and turn off the vehicle
if (isEngineOn _transportUnit) then { _transportUnit engineOn false; };
sleep 2;
_transportUnit setVehicleLock "UNLOCKED";
