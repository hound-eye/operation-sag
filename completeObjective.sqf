[missionNamespace, "MY_allowedReinforcements", false] call BIS_fnc_getServerVariable;
if (!MY_allowedReinforcements) exitWith {};

params ["_thisTrigger"];
private ["_toPos", "_deployMessage"];

switch (_thisTrigger) do
{
	case antiair_trigger:
	{
		_toPos = spawn_antiair;
		_deployMessage = "Friendly reinforcements inbound, north of Lumber Yard.";
		["TSK_Antiair", "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
	case intel_trigger:
	{
		_toPos = spawn_intel;
		_deployMessage = "Friendly reinforcements inbound, at the gates of enemy HQ.";
		["TSK_Intel", "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
	case mortar_trigger:
	{
		_toPos = spawn_mortar;
		_deployMessage = "Friendly reinforcements inbound, east of mortar position.";
		["TSK_Mortar", "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
	case recon_trigger:
	{
		_toPos = spawn_recon;
		_deployMessage = "Friendly reinforcements inbound, west of resort.";
		["TSK_Recon", "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
	case signal_trigger:
	{
		_toPos = spawn_signal;
		_deployMessage = "Friendly reinforcements inbound, east of hamlet.";
		["TSK_Signal", "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
	case support_trigger:
	{
		_toPos = spawn_support;
		_deployMessage = "Friendly reinforcements inbound, south-east of farm.";
		["TSK_Support", "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
};
if (!isNil "_deployMessage") then {
	_objectiveScript = call compile preprocessFileLineNumbers "deployReinforcements.sqf";
	[[blufor, "BLU"], _deployMessage] remoteExec ["sideChat"];
	[_toPos, _deployMessage] call _objectiveScript;
}
