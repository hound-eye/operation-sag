params ["_trigger", "_toPos", "_includeAI"];

[blufor, "BLU"] sideChat format ["Deploying reinforcements: %1", _trigger];
_objectiveScript = call compile preprocessFileLineNumbers "deployReinforcements.sqf";
//send message that reinforcements will be sent soon.
//[_trigger, _toPos, _includeAI] call _objectiveScript;