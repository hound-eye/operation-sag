//zeusplayer setcaptive true;
//zeusplayer allowDamage false;
laptop setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt,1)"];
laptop_ir setObjectTexture [0, "#(argb,512,512,1)r2t(uavrttir,1)"];

cam = "camera" camCreate [0,0,0];
cam cameraEffect ["Internal", "Back", "uavrtt"];
cam attachTo [uav, [0,0,0], "PiP0_pos"];
cam camSetFov 0.05;

cam_ir = "camera" camCreate [0,0,0];
cam_ir cameraEffect ["Internal", "Back", "uavrttir"];
cam_ir attachTo [uav, [0,0,0], "PiP0_pos"];
cam_ir camSetFov 0.05;
"uavrttir" setPiPEffect [2];

addMissionEventHandler ["Draw3D", {
    _dir = 
        (uav selectionPosition "PiP0_pos") 
            vectorFromTo 
        (uav selectionPosition "PiP0_dir");
    cam setVectorDirAndUp [
        _dir, 
        _dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]
    ];
	cam_ir setVectorDirAndUp [
        _dir, 
        _dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]
    ];
}];

cam_ir camSetFov 0.02;
cam camSetFov 0.02;
uav setCaptive true;
uav flyInHeight 100;
