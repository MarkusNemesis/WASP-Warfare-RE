private["_VehAndWep", "_VehMarked", "_Marked", "_NotNeedDel", "_DelOnlyDead"];
_NotNeedDel  = [Public_MHQ_BF, Public_MHQ_OF];
_DelOnlyDead = ["B_HMG_01_high_F"];
_VehAndWep  = vehicles + (allMissionObjects "GroundWeaponHolder") + (allMissionObjects "Ship");
_VehMarked = 0;
_Marked  = false;
{
	private["_TimeMarker"];
	_TimeMarker = _x getVariable "TimeMarker";
	if not (_x in _NotNeedDel) then {
		private["_Type"];
		_Type = typeOf _x;
		if (((_Type in _DelOnlyDead) && (!Alive _x)) || !(_Type in _DelOnlyDead)) then  {
			if (isNil "_TimeMarker") then   {
				_x setVariable ["TimeMarker", time, false];
				_VehMarked  = _VehMarked + 1;
				_Marked  = true;
			}  else  {
				if (count (crew _x) > 0) then {
					_x setVariable ["TimeMarker", time, false]
				};
			};
		};
	};
} forEach _VehAndWep;
if (_Marked) then {
	["GARBAGE", format["Marked: %1", _VehMarked]] call Fun_AddToLog
};
