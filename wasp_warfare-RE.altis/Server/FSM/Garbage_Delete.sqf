//_Vehicles = (Public_VehMarkers select 0)+(Public_VehMarkers select 1);
_AllVehForMark = Public_VehMarkers;
{
	private ['_sideNum','_SideVehicle'];
	_sideNum = _foreachindex;
	_SideVehicle = _x;
	{
		private ['_vehicle', '_expTime'];
		_vehicle = _x select 0;
		_expTime = _x getVariable "TimeMarker";
		if not (_vehicle in [Public_MHQ_BF, Public_MHQ_OF]) then {
			if (!isNil "_expTime") then {
				if ((time - _expTime) > Garbage_TimeDelete) then {
					private ['_VehMarker'];
					_VehMarker  = format["%1VehicleMarker", _Vehicle];
					_SideVehicle set [ _foreachindex, -1];
					_SideVehicle = _SideVehicle - [-1];
					_AllVehForMark  set [_SideNum, _SideVehicle];
					["Public_VehMarkers", _SideNum, _SideVehicle] call Send_All_Array;
					["All", [_MHQ, {deleteMarkerLocal _VehMarker}], ObjNull] call Send_Run; // Markus - Delete markers upon collection
				};
			};
		};
	} foreach _SideVehicle;/*_Vehicles;*/
} foreach _AllVehForMark;

// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

private["__VehAndWep", "_DelVehCount", "_Delete"];
_VehAndWep  = vehicles + (allMissionObjects "GroundWeaponHolder") + (allMissionObjects "Ship");
_DelVehCount = 0;
_Delete   = false;
{
	private["_TimeMarker"];
	_TimeMarker = _x getVariable "TimeMarker";
	if not (_x in [Public_MHQ_BF, Public_MHQ_OF]) then {
		if (!isNil "_TimeMarker") then   {
			if ((time - _TimeMarker) > Garbage_TimeDelete) then {
				_VehMarker = format["%1VehicleMarker", _x];
				["All", [_MHQ, {deleteMarkerLocal _VehMarker}], ObjNull] call Send_Run; // Markus - Delete markers upon collection
				deleteVehicle _x;
				_DelVehCount = _DelVehCount + 1;
				_Delete = true   
			};
		};
	};
} forEach _VehAndWep;
if (_Delete) then {
	["GARBAGE", format["DELETE: Vehicles and Weapons: %1", _DelVehCount]] call Fun_AddToLog
};
