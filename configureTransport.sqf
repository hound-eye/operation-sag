if (hasInterface) then
{
	// teleporting and changing direction can cause 
	// vehicle damage, if it rotates into some object.
	// as a workaround, we need coordinates for
	// transitional position (some flat groud), where rotation will occur
	// also add 0.2 meters in heigh JUST IN CASE
	_taxi_van_teleport_temp_pos = [11406.9,13640.5,0.2];
	_taxi_truck_teleport_temp_pos = [11414.4,13629.2,0.2];

	_taxi_van_teleport_north_pos = [10220.6,6422.7,0.2];
	_taxi_van_teleport_north_dir = 195;
	_taxi_truck_teleport_north_pos = [10227.8,6424.35,0.2];
	_taxi_truck_teleport_north_dir = 167;

	_taxi_van_teleport_south_pos = [12295.3,5026.58,0.2];
	_taxi_van_teleport_south_dir = 64;
	_taxi_truck_teleport_south_pos = [12293.9,5019.98,0.2];
	_taxi_truck_teleport_south_dir = 92;

	_taxi_van_teleport_base_pos = [11474.9,13632.6,0.2];
	_taxi_van_teleport_base_dir = 235;
	_taxi_truck_teleport_base_pos = [10223.7,6428.46,0.2];
	_taxi_truck_teleport_base_dir = 211;

	// VAN
	taxi_van addAction [
			"Teleport to North",
			{
				params ["_target", "_caller", "_actionId", "_arguments"]; // script
				[_target, _caller, _actionId, _arguments]execVM "sendTransport.sqf";
			},
			[_taxi_van_teleport_temp_pos, _taxi_van_teleport_north_pos, _taxi_van_teleport_north_dir],
			-4,
			false,
			true,
			"",
			"driver vehicle _target == _this"
		];
	taxi_van addAction [
			"Teleport to South",
			{
				params ["_target", "_caller", "_actionId", "_arguments"]; // script
				[_target, _caller, _actionId, _arguments]execVM "sendTransport.sqf";
			},
			[_taxi_van_teleport_temp_pos, _taxi_van_teleport_south_pos, _taxi_van_teleport_south_dir],
			-4,
			false,
			true,
			"",
			"driver vehicle _target == _this"
		];
	taxi_van addAction [
			"Teleport to Base",
			{
				params ["_target", "_caller", "_actionId", "_arguments"]; // script
				[_target, _caller, _actionId, _arguments]execVM "sendTransport.sqf";
			},
			[_taxi_van_teleport_temp_pos, _taxi_van_teleport_base_pos, _taxi_van_teleport_base_dir],
			-4,
			false,
			true,
			"",
			"driver vehicle _target == _this"
		];

	// PICKUP TRUCK
	taxi_truck addAction [
			"Teleport to North",
			{
				params ["_target", "_caller", "_actionId", "_arguments"]; // script
				[_target, _caller, _actionId, _arguments]execVM "sendTransport.sqf";
			},
			[_taxi_truck_teleport_temp_pos, _taxi_truck_teleport_north_pos, _taxi_truck_teleport_north_dir],
			-4,
			false,
			true,
			"",
			"driver vehicle _target == _this"
		];
	taxi_truck addAction [
			"Teleport to South",
			{
				params ["_target", "_caller", "_actionId", "_arguments"]; // script
				[_target, _caller, _actionId, _arguments]execVM "sendTransport.sqf";
			},
			[_taxi_truck_teleport_temp_pos, _taxi_truck_teleport_south_pos, _taxi_truck_teleport_south_dir],
			-4,
			false,
			true,
			"",
			"driver vehicle _target == _this"
		];
	taxi_truck addAction [
			"Teleport to Base",
			{
				params ["_target", "_caller", "_actionId", "_arguments"]; // script
				[_target, _caller, _actionId, _arguments]execVM "sendTransport.sqf";
			},
			[_taxi_truck_teleport_temp_pos, _taxi_truck_teleport_base_pos, _taxi_truck_teleport_base_dir],
			-4,
			false,
			true,
			"",
			"driver vehicle _target == _this"
		];

	
};