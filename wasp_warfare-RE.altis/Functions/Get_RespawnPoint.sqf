private["_DeadBodyPos", "_Side", "_Towns", "_Camps", "_RespawnPoins", "_NearestTown", "_TownCamps", "_AmbulanceClasses",  "_NearestAmbulance"];
_DeadBodyPos = _this select 0;
_Side   = _this select 1;
_Towns   = +Public_TownsArray;
_Camps   = +Public_CampsArray;
_RespawnPoins = [];
_NearestTown = [];
for "_t" from 0 to ((count _Towns) - 1) step 1 do{
	private["_Town", "_TownRange"];
	_Town  = _Towns select _t;
	_TownObject = _Town select 1;
	_TownRange  = 150 + (20 * (_Town select 3));
	_Distance = _TownObject distance _DeadBodyPos;
	if (_Distance < _TownRange) exitWith {
		_NearestTown = + _Town
	};
};
if (count _NearestTown > 0) then{
	_TownCamps = _NearestTown select 9;
	for "_c" from 0 to ((count _TownCamps) - 1) step 1 do {
		private["_CampID", "_Camp", "_CampSide"];
		_CampID  = _TownCamps select _c;
		_Camp  = + (_Camps select _CampID);
		_CampSide = _Camp select 3;
		if (_CampSide == _Side) then {
			private["_EnemySide", "_Enemy"];
			_EnemySide = if (_Side == west) then {
				[east, resistance]} else {
				[west, resistance]
			};
			_Enemy  = ["Tank", _Camp select 1, 10, _EnemySide] call Calculate_EnemyNear;
			if (_Enemy == 0) then {
				private["_CampPos", "_TownPos", "_Description"];
				_CampPos  = getPosASL (_Camp select 1);
				_TownPos  = getPosASL (_NearestTown select 1);
				_Direction  = [_CampPos, _TownPos] call Fun_CalcDirection;
				_Description = format["%1: %2 Camp", _NearestTown select 2, _Direction select 1];
				_RespawnPoins set [count _RespawnPoins, [_Camp select 1, _Description]];
			};
		};
	};
};
_AmbulanceClasses = _Side call Data_Ambulance;
_NearestAmbulance = [];
if (count _AmbulanceClasses > 0) then {
	_NearestAmbulance = nearestObjects [_DeadBodyPos, _AmbulanceClasses, 200];
};
if (count _NearestAmbulance > 0) then {
	for "_a" from 0 to (count(_NearestAmbulance)-1) do {
		private["_AmbuObj", "_Description"];
		_AmbuObj  = _NearestAmbulance select _a;
		_Description = getText (configFile >> 'CfgVehicles' >> (typeOf _AmbuObj) >> "displayName");
		_RespawnPoins set [count _RespawnPoins, [_AmbuObj, _Description]];
	};
};
private["_AllAreaBld", "_Areas"];
_AllAreaBld = [side Player] call Fun_GetAllAreaAndBld;
_Areas  = _AllAreaBld select 0;
if (((_Areas select 0) select 0) != -1) then{
	for "_ar" from 0 to (count(_Areas)-1) do  {
		private["_Area", "_AreaId", "_Bld"];
		_Area  = _Areas select _ar;
		_AreaId = _ar;
		_Bld = _Area select 3;
		if (count(_Bld) > 0) then {
			private["_Distance", "_AreaName"];
			_Distance  = 100000;
			_AreaName = "";
			for "_t" from 0 to ((count _Towns) - 1) do   {
				private["_TownObj", "_AreaObj", "_Dist"];
				_TownObj = (_Towns select _t) select 1;
				_AreaObj = _Area select 1;
				_Dist  = _TownObj distance _AreaObj;
				if (_Dist < _Distance) then {
					_Distance = _Dist;
					_AreaName = (_Towns select _t) select 2;
				};
			};
			for "_b" from 0 to (count(_Bld)-1) do    {
				private["_BldArray", "_BldObj", "_BldAbr", "_Description"];
				_BldArray  = _Bld select _b;
				_BldObj   = _BldArray select 1;
				_BldAbr   = _BldArray select 4;
				_BldName  = (_BldAbr call Fun_GetBldInf) select 2;
				_Description = format["%1 Base: %2", _AreaName, _BldName];
				_RespawnPoins set [count _RespawnPoins, [_BldObj, _Description]];
			};
		};
	};
};
private["_MHQObject"];
_MHQObject = if (_Side == west) then {
	Public_MHQ_BF} else {
	Public_MHQ_OF
};
if (alive _MHQObject) then {
	_RespawnPoins set [count _RespawnPoins, [_MHQObject, "MHQ"]];
};
_RespawnPoins 