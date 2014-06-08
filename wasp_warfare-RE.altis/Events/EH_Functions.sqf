private["_DeleteDeadBody", "_ManKiller", "_VehicleKiller", "_UnitPriceFromData", "_KillerManOrVehicleCrew",  "_VehiclePriceFromData", "_KillerIsPlayer"];
_DeleteDeadBody = {
	sleep 180;
	deleteVehicle _this;
};
_GetDeadBodySide ={
	private["_this", "_Script", "_Sides", "_UnitType", "_result"];
	_Script   = compile preprocessFileLineNumbers "Data\Data_Units.sqf";
	_Sides  = [West, East, Resistance];
	_UnitType = typeOf _this;
	_result  = civilian;
	{
		private["_Side", "_UnitsBySide"];
		_Side   = _x;
		_UnitsBySide = _Side call _Script;
		{
			private["_x", "_forEachIndex"];
			if (_UnitType == (_x select 1)) exitWith {
				_result = _Side
			};
		} forEach _UnitsBySide;
		if (_result != civilian) exitWith {};
	} forEach _Sides;
	_result
};
_UnitPriceFromData ={
	private["_this", "_Script", "_AllUnits", "_UnitType", "_result"];
	_Script   = compile preprocessFileLineNumbers "Data\Data_Units.sqf";
	_AllUnits = (West call _Script) + (East call _Script) + (Resistance call _Script);
	_UnitType = typeof _this;
	_result  = [];
	{
		if (_UnitType == (_x select 1)) exitWith  {
			_result = [(_x select 3) / 2, (_x select 4) / 2];
		};
	} forEach _AllUnits;
	_result
};
_VehiclePriceFromData ={
	private["_this", "_ScriptLF", "_ScriptHF", "_ScriptAF", "_ScriptBF", "_ScriptTC", "_AllUnits", "_VehicleType",   "_result", "_Sides", "_AllVehicles"];
	_Sides   = [west, east, resistance, civilian];
	_ScriptLF  = compile preprocessFileLineNumbers "Data\Data_LVehicles.sqf";
	_ScriptHF  = compile preprocessFileLineNumbers "Data\Data_HVehicles.sqf";
	_ScriptAF  = compile preprocessFileLineNumbers "Data\Data_AVehicles.sqf";
	_ScriptBF  = compile preprocessFileLineNumbers "Data\Data_BVehicles.sqf";
	_VehicleType = typeof _this;
	_result   = [];
	_AllVehicles = [];
	{
		_AllVehicles = _AllVehicles + (_x call _ScriptLF) + (_x call _ScriptHF) + (_x call _ScriptAF) + (_x call _ScriptBF);
	} forEach _Sides;
	{
		if (_VehicleType == (_x select 1)) exitWith  {
			_result = [(_x select 3) / 2, (_x select 4) / 2];
		};
	} forEach _AllVehicles;
	_result
};
_KillerManOrVehicleCrew ={
	private["_this", "_Killer", "_result"];
	_Killer = _this;
	_result = [];
	if (_Killer isKindOf "man") then {
		private["_GroupLider"];
		_GroupLider = leader (Group _Killer);
		if (isPlayer _GroupLider) then {
			_result = [_GroupLider];
		};
	} else {
		private["_Crew"];
		_Crew = [assignedDriver _Killer, assignedGunner _Killer, assignedCommander _Killer];
		{
			if (!isNull _x) then {
				private["_GroupLider"];
				_GroupLider = leader (Group _x);
				if ((isPlayer _GroupLider) && !(_GroupLider in _result)) then {
					_result set [count _result, _GroupLider];
				};
			};
		} ForEach _Crew;
	};
	_result
};
_KillerIsPlayer ={
	private["_Killer", "_Player", "_result"];
	_Killer = _this select 0;
	_Player = _this select 1;
	_result = false;
	if (_Killer isKindOf "man") then {
		_result = if (_Killer == _Player) then {
			true} else {
			false
		};
	} else {
		private["_Guner"];
		_Guner = assignedGunner _Killer;
		if (!isNull _Guner) then {
			_result = if (_Guner == _Player) then {
				true} else {
				false
			};
		};
	};
	_result
};
