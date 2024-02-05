execVM "briefingBoard.sqf";
// prepare text briefingName

// TODO prepare tasks

execVM "diary.sqf";

// init objective intel
if (hasInterface) then
{
	obj_intel_hq addAction [
		"Collect documents", // custom addAction title
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