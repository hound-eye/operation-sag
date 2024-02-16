/*
	Author: Houndeye
	Description:
		Handle objective completion logic. Server-side only script.

	Parameter(s):
		0: OBJECT - trigger that is linked to the objective completion
	Returns:

	Examples:
		[thisTrigger] call HNDM_fnc_onObjectiveCompletion.
*/
if (!isServer) exitWith {};

params ["_objTrigger"];

// mark the task associated with the trigger as completed
switch (_objTrigger) do
{
	case antiair_trigger:
	{
		["TSK_Antiair", "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
	case intel_trigger:
	{
		["TSK_Intel", "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
	case mortar_trigger:
	{
		["TSK_Mortar", "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
	case recon_trigger:
	{
		["TSK_Recon", "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
	case signal_trigger:
	{
		["TSK_Signal", "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
	case support_trigger:
	{
		["TSK_Support", "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
};

// send reinforcements, if they are allowed by the server property
[missionNamespace, "HNDM_allowedReinforcements", false] call BIS_fnc_getServerVariable;
if (HNDM_allowedReinforcements) then
{
	[_objTrigger] call HNDM_fnc_deployReinforcements;
};
true;