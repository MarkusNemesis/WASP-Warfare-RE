private ["_AllVehForMark", "_SideNum", "_SideVehicle"];
_AllVehForMark = Public_VehMarkers;
_SideNum  = switch (Side Player) do {
case west : {
		0
	};
case east : {
		1
	};
};
_SideVehicle = _AllVehForMark select _SideNum;
{
	private["_VehMarkerN", "_VehNumber", "_Vehicle", "_VehicleId", "_x", "_forEachIndex"];
	if (!isnil ("_x")) then  {
		if (typeName _x == "ARRAY") then   {
			_Vehicle  = _x select 0;
			_VehicleId  = _x select 1;
			_Group   = _x select 2;
			_VehNumber  = _forEachIndex;
			if not (isNull _Vehicle) then   {
				private ["_VehMarker", "_VehMarkerPos", "_Color"];
				_VehMarker  = format["%1VehicleMarker", _Vehicle];
				_VehMarkerPos = getMarkerPos _VehMarker;
				if (format["%1",_VehMarkerPos] == "[0,0,0]") then     {
					_Color = if ((group Player) == _Group) then {
						"ColorOrange"} else {
						"ColorGreen"
					};
					createMarkerLocal [_VehMarker, getPosATL  (_Vehicle)];
					_VehMarker setMarkerTypeLocal "mil_dot";
					_VehMArker setMarkerSizeLocal [1.2,1.2];
					_VehMarker setMarkerColorLocal _Color;
				}    else    {
					_VehMarker setMarkerPosLocal getPosATL  (_Vehicle);
					if (!(alive _Vehicle)) then     {
						deleteMarkerLocal _VehMarker;
						_SideVehicle set [ _VehNumber, -1];
						_SideVehicle = _SideVehicle - [-1];
						_AllVehForMark  set [_SideNum, _SideVehicle];
						["Public_VehMarkers", _SideNum, _SideVehicle] call Send_All_Array;
					};
				};
			};
		};
	};
} forEach _SideVehicle;
