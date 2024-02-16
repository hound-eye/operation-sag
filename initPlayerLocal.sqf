// add actions for briefing board slides
execVM "configureBriefingBoard.sqf";
// enable diary entries
execVM "configureDiary.sqf";
// configure teleport actions for transport
execVM "configureTransport.sqf";

// configure spectator action at main base
_spectatorScript = compile preprocessFileLineNumbers "spectator.sqf";
spectator_table addAction ["<t color='#00FF00'>Spectator</t>", _spectatorScript, [], 1, true, true, "", "_this distance _target < 3"];

// configure respawn action for ammo boxes
base_supply_box_1 addAction ["<t color='#FF0000'>Reset loadout (RESPAWN)</t>", "forceRespawn player;", [], -4, false, true, "", "_this distance _target < 2"];
base_supply_box_2 addAction ["<t color='#FF0000'>Reset loadout (RESPAWN)</t>", "forceRespawn player;", [], -4, false, true, "", "_this distance _target < 2"];
