_SkillFunc ={
	private["_this", "_result"];
	_result = switch (_this) do {
	case "PRIVATE"  : {
			0.3
		};
	case "CORPORAL"  : {
			0.4
		};
	case "SERGEANT"  : {
			0.5
		};
	case "LIEUTENANT" : {
			0.7
		};
	case "CAPTAIN"  : {
			0.8
		};
	case "MAJOR"  : {
			0.9
		};
	};
	_result
};
private["_SideN", "_Unit", "_Vehicle", "_Skill", "_FactoryObj", "_VehType", "_VehRank", "_Group", "_RespawnPos",   "_Driver", "_Guner", "_Commander", "_Lock", "_Owner"];
_FactoryObj  = _this select 0;
_VehType  = _this select 1;
_VehRank  = _this select 2;
_Group   = _this select 3;
_RespawnPos  = _this select 4;
_Driver   = _this select 5;
_Guner   = _this select 6;
_Commander  = _this select 7;
_Lock   = _this select 8;
_Owner   = (units _Group) select 0;
_Vehicle  = _VehType createVehicle _RespawnPos;
_Vehicle  setDir ((getDir _FactoryObj) - 180);
_VclPos  = getPos _vehicle;
_Vehicle setPosASL [_VclPos select 0, _VclPos select 1, getTerrainHeightASL [_VclPos select 0, _VclPos select 1]];
_Vehicle setVectorUp (surfaceNormal _VclPos);
_Vehicle addEventHandler ["Killed",{_this call EH_KilledVehicle}];
private ["_AllVehForMark", "_SideNum", "_SideVehicle"];
_AllVehForMark = Public_VehMarkers;
_SideNum  = switch (Side _Group) do{
case west : {
		0
	};
case east : {
		1
	};
};
_AccessArray = switch (Side _Group) do{
case west : {
		[true,false,false]
	};
case east : {
		[false,true,false]
	};
};
_SideVehicle = _AllVehForMark select _SideNum;
_SideVehicle  set [ count(_SideVehicle), [ _Vehicle, str(_Vehicle), _Group]];
_AllVehForMark  set [_SideNum, _SideVehicle];
["Public_VehMarkers", _SideNum, count(_SideVehicle), _AccessArray, [ _Vehicle, str(_Vehicle), _Group]] call Send_ArrayRowCol;
_Skill =  _VehRank call _SkillFunc;
_SideN  = switch (Side _Group) do{
case west  : {
		"B_"
	};
case east  : {
		"O_"
	};
};
if (_Driver) then{
	_Unit = _Group createUnit [_SideN + "crew_F", _RespawnPos, [], 0, ""];
	_Unit setskill _Skill;
	_Unit setRank _VehRank;
	_Unit moveInDriver _Vehicle;
	_Unit call DeleteNVG;
};
if (_Guner) then{
	_Unit = _Group createUnit [_SideN + "crew_F", _RespawnPos, [], 0, ""];
	_Unit setskill _Skill;
	_Unit setRank _VehRank;
	_Unit moveInGunner _Vehicle;
	_Unit call DeleteNVG;
};
if (_Commander) then{
	_Unit = _Group createUnit [_SideN + "crew_F", _RespawnPos, [], 0, ""];
	_Unit setskill _Skill;
	_Unit setRank _VehRank;
	_Unit moveInCommander _Vehicle;
	_Unit call DeleteNVG;
};
if (!isNil "_Lock") then {
	_Vehicle lock (if (_Lock) then {
		2} else {
		0});
};
[_Vehicle,_Lock] call Compile preprocessFileLineNumbers "Client\Action\Action_Lock.sqf";
_VehName = getText (configFile >> 'CfgVehicles' >> (_VehType) >> "displayName");
hint parseText format ["<t align='center' color='#00addd'>%1</t><br /><t align='center'>created</t>", toUpper _VehName];