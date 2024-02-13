// add actions for briefing board slides
execVM "configureBriefingBoard.sqf";
// enable diary entries
execVM "configureDiary.sqf";
// configure pick-able intel actions and content
execVM "configureIntel.sqf";
// configure teleport actions for transport
execVM "configureTransport.sqf";
// init objective intel
spectator_table addAction ["<t color='#00FF00'>Spectator</t>", "spectator.sqf", [], 1, true, true, "", "_this distance _target < 3"];

base_supply_box_1 addAction ["<t color='#FF0000'>Change initial loadout (respawn)</t>", "forceRespawn player;", [], -4, false, true, "", "_this distance _target < 2"];

base_supply_box_2 addAction ["<t color='#FF0000'>Change initial loadout (respawn)</t>", "forceRespawn player;", [], -4, false, true, "", "_this distance _target < 2"];