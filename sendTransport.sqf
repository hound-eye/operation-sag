_teleportMode = _this select 0;

// workaround - to avoid collisions, teleport to flat ground
// on these coordinates first, then rotate to desired direction,
// and then teleport to final coordinates
_taxi_van_teleport_temp_pos = [11406.9,13640.5,0.2];
_taxi_truck_teleport_temp_pos = [11414.4,13629.2,0.2];

_taxi_van_teleport_alpha_pos = [10220.6,6422.7,0.2];
_taxi_van_teleport_alpha_dir = 195;
_taxi_truck_teleport_alpha_pos = [10227.8,6424.35,0.2];
_taxi_truck_teleport_alpha_dir = 167;

_taxi_van_teleport_bravo_pos = [12295.3,5026.58,0.2];
_taxi_van_teleport_bravo_dir = 64;
_taxi_truck_teleport_alpha_pos = [12293.9,5019.98,0.2];
_taxi_truck_teleport_alpha_dir = 92;

_taxi_van_teleport_charlie_pos = [11474.9,13632.6,0.2];
_taxi_van_teleport_charlie_dir = 235;
_taxi_truck_teleport_alpha_pos = [10223.7,6428.46,0.2];
_taxi_truck_teleport_alpha_dir = 211;

//taxi_van_location_tmp = [3798.66,6091.56,0.2]
if (!isEngineOn taxi_van) then { taxi_van engineOn true; };
if (!isEngineOn taxi_van) then { taxi_van engineOn true; };



switch (_teleportMode) do
{
	case 1:
	{
		[[blufor, "BLU"], "Transport arriving at ALPHA!"] remoteExec ["sideChat"];
		taxi_van_teleport_pos = taxi_van_teleport_alpha_pos;
		taxi_van_teleport_dir = taxi_van_teleport_alpha_dir;
	};
	case 2:
	{
		[[blufor, "BLU"], "Transport arriving at BRAVO!"] remoteExec ["sideChat"];
		taxi_van_teleport_pos = taxi_van_teleport_bravo_pos;
		taxi_van_teleport_dir = taxi_van_teleport_bravo_dir;
	};
	case 3:
	{
		taxi_van_teleport_pos = taxi_van_teleport_charlie_pos;
		taxi_van_teleport_dir = taxi_van_teleport_charlie_dir;
	};
	default
	{
		taxi_van_teleport_pos = taxi_van_teleport_charlie_pos;
		taxi_van_teleport_dir = taxi_van_teleport_charlie_dir;
	};
};


//begin teleport
[3, 0] remoteExec ["fadeSound", -2];
3 fadeSound 0;
taxi_van setVehicleLock "LOCKED";
taxi_truck setVehicleLock "LOCKED";
[0,"BLACK",2,1] call BIS_fnc_fadeEffect;
sleep 3;

skipTime 0.5;
//perform teleport
taxi_van setPosATL taxi_van_teleport_temp_pos;
taxi_van setDir taxi_van_teleport_dir;
taxi_van setPosATL taxi_van_teleport_pos;

//WAKE UP
2 fadeSound 1;
if (isEngineOn taxi_van) then { taxi_van engineOn false; };
sleep 2;
taxi_van setVehicleLock "UNLOCKED";
[1,"BLACK",3,1] call BIS_fnc_fadeEffect;
