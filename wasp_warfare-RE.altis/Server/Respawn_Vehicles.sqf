private["_this", "_Side", "_MHQ", "_Vehicles", "_Ambulances", "_Transport", "_VehiclesClasses", "_Vehicle", "_Ambulance"];
_Side  = _this;
_MHQ  = switch _Side do {
case west : {
		Public_MHQ_BF
	};
case east : {
		Public_MHQ_OF
	};
};
_Vehicles = (_Side call Data_LF) + (_Side call Data_HF);
_Ambulances = _Side call Data_Ambulance;
_Transport = switch _Side do {
case west : {
		"B_Truck_01_transport_F"
	};
case east : {
		"O_Truck_03_transport_F"
	};
};
/* Markus - Removed armed vehicle at start, as starting with a T100 is bad
_VehiclesClasses = [];
for "_i" from 0 to (count(_Vehicles)-1) do{
	_WithGun = (_Vehicles select _i) select 7;
	if (_WithGun) then {
		_VehiclesClasses set[count _VehiclesClasses, (_Vehicles select _i) select 1];
	};
};
*/
//_Vehicle = _VehiclesClasses select (floor (random (count _VehiclesClasses)));
_Ambulance = _Ambulances select (floor (random (count _Ambulances)));
_Classes = [_Transport, /*_Vehicle,*/ _Ambulance];
for "_c" from 0 to (count(_Classes)-1) do{
	private["_RespawnPos", "_Veh"];
	_RespawnPos = [getPosATL _MHQ, 40, 15] call Fun_CalcRandomRespawn;
	_Veh = (_Classes select _c) createVehicle _RespawnPos;
	_Veh setPosATL _RespawnPos;
};
