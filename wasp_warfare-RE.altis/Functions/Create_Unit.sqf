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
private ["_VehType", "_VehRank", "_Group", "_RespawnPos", "_Skill", "_Unit"];
_VehType = _this select 0;
_VehRank = _this select 1;
_Group  = _this select 2;
_RespawnPos = _this select 3;
_Skill = _VehRank call _SkillFunc;
_Unit = _Group createUnit [_VehType, _RespawnPos, [], 0, ""];
_Unit setskill _Skill;
_Unit setRank _VehRank;
_Unit call DeleteNVG;
_Unit addEventHandler ["Killed",{_this call EH_KilledUnit}];
_VehName = getText (configFile >> 'CfgVehicles' >> (_VehType) >> "displayName");
hint parseText format ["<t align='center' color='#00addd'>%1</t><br /><t align='center'>created</t>", toUpper  _VehName];
