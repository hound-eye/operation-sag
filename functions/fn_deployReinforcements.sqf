/*
	Author: Houndeye
	Description:
		Gather playes at spawn_area trigger, and send them to the toPos object's location.
	Parameter(s):
		0: OBJECT - objective trigger.
		1: OBJECT - object, whose position.
		2: STRING - message that will be sent upon arrival
	Returns:
		BOOLEAN
	Examples:
		[kill_obj_trigger] call HNDM_fnc_onObjectiveCompletion.
*/
if (!isServer) exitWith {};

// script does nothing, if reinforcements are already being deployed
[missionNamespace, "HNDM_deployingInProgress", false] call BIS_fnc_getServerVariable;
if (HNDM_deployingInProgress) exitWith {};
[missionNamespace, "HNDM_deployingInProgress", true] call BIS_fnc_setServerVariable;

params ["_objTrigger"];

//_toPos - object, whose position is used to deploy reinforcements to
//_deployMessage - message that is sent upon reinforcements arrival
private ["_toPos", "_deployMessage"];

switch (_objTrigger) do
{
	case antiair_trigger:
	{
		_toPos = spawn_antiair;
		_deployMessage = "Friendly reinforcements inbound, north of Lumber Yard.";
	};
	case intel_trigger:
	{
		_toPos = spawn_intel;
		_deployMessage = "Friendly reinforcements inbound, north of the enemy HQ.";
	};
	case mortar_trigger:
	{
		_toPos = spawn_mortar;
		_deployMessage = "Friendly reinforcements inbound, east of enemy mortar positions.";
	};
	case recon_trigger:
	{
		_toPos = spawn_recon;
		_deployMessage = "Friendly reinforcements inbound, west of resort.";
	};
	case signal_trigger:
	{
		_toPos = spawn_signal;
		_deployMessage = "Friendly reinforcements inbound, south of hamlet.";
	};
	case support_trigger:
	{
		_toPos = spawn_support;
		_deployMessage = "Friendly reinforcements inbound, south-east of farm.";
	};
};

_spawnees = list spawn_area;

if (count _spawnees > 0) then 
{
	[zeus, "Objective complete! Sending available reinforcements to your location."] remoteExec ["sideChat"]; 
};

// hint players in the trigger, that they are about to be deployed

for [{_i=10},{_i>=2},{_i=_i-1}] do 
{
	{
		if (isPlayer _x ) then {
			[format ["Deploying friendly reinforcements in %1 seconds", _i]] remoteExec ["hint", owner _x]; 
		};
	} forEach _spawnees;
	sleep 1;
	{
		if (isPlayer _x ) then {
			["Deploying now!"] remoteExec ["hint", owner _x];
		};
	} forEach _spawnees;
};

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
			[] remoteExec ["HNDM_fnc_stopSpectate", owner _x];
			[""] remoteExec ["hintSilent", owner _x];
			[1,"BLACK",1,0] remoteExec ["BIS_fnc_fadeEffect", owner _x];
		};
	} forEach _spawnees;
	[zeus, _deployMessage] remoteExec ["sideChat"];
};

[missionNamespace, "HNDM_deployingInProgress", false] call BIS_fnc_setServerVariable;

true;

