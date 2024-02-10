// add actions for briefing board slides
execVM "configureBriefingBoard.sqf";
// enable diary entries
execVM "configureDiary.sqf";
// configure pick-able intel actions and content
execVM "configureIntel.sqf";
// configure teleport actions for transport
execVM "configureTransport.sqf";
// init objective intel
spectator_table addAction ["<t color='#00FF00'>Spectator</t>", "spectator.sqf", [], 1, true, true, "", "spectator_table distance _target < 3"];