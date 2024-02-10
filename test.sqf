removeAllActions taxi_van;

	_taxi_van_teleport_temp_pos = [11406.9,13640.5,0.2];
	_taxi_truck_teleport_temp_pos = [11414.4,13629.2,0.2];

	_taxi_van_teleport_north_pos = [10220.6,6422.7,0.2];
	_taxi_van_teleport_north_dir = 195;
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


taxi_van addAction [
			"Send to North",
			"remoteExec ["skipTime", 2, false];",
			nil,
			-4,
			false,
			true,
			"",
			"driver vehicle _target == _this"
		];