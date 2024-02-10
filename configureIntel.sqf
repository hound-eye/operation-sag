// init intel
_intelText = loadFile "texts\intel.html";

if (isServer) then
{
	// Clear empty picture
	obj_intel_hq setVariable ["RscAttributeDiaryRecord_texture","a3\ui_f\data\igui\cfg\actions\clear_empty_ca.paa", true];
	[
		obj_intel_hq,
		"RscAttributeDiaryRecord",
		["Battalion personnel placement",_intelText,""]
	] call BIS_fnc_setServerVariable;
};

if (hasInterface) then
{
	obj_intel_hq addAction [
		"Collect intel", // custom addAction title
		{ [_this, "action"] spawn BIS_fnc_initIntelObject },
		[],
		10,
		true,
		true,
		"",
		"isPlayer _this && { _this distance _target < 2 } &&
		{ (side group _this) in (_target getVariable ['RscAttributeOwners', [west, east, resistance, civilian]]) }"
	];
};
