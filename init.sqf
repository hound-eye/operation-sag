execVM "uav.sqf";

// init intel 
if (isServer) then
{
	// Clear empty picture
	obj_intel_hq setVariable ["RscAttributeDiaryRecord_texture","a3\ui_f\data\igui\cfg\actions\clear_empty_ca.paa", true];
	[
		obj_intel_hq,
		"RscAttributeDiaryRecord",
		["Battalion personnel placement","...<br/>1st Infantry Company - West part of Vasylivka<br/>2nd Infantry Company - Vasylivka main street<br/>3rd Infantry Company - on recovery<br/>Signal Platoon - Hamlet<br/>Mortar Battery - North-East of cemetery<br/>Air reconnaissance Platoon - Resort<br/>...",""]
	] call BIS_fnc_setServerVariable;
};

