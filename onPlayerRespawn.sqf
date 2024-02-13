params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];
if (_oldUnit distance base_supply_box_2 < 3 || _oldUnit distance base_supply_box_1 < 3) then {
	deleteVehicle _oldUnit;
};