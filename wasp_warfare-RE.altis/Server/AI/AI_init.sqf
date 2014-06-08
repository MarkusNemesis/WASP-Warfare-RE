private ["_this","_Side","_Unit","_GroupType","_UnitNum","_Group"];
_Side  = _this select 0;
_Unit   = _this select 1;
_GroupType  = _this select 2;
_UnitNum = _this select 3;
_Group  = _this select 4;
switch (_UnitNum) do {
	case -1 : {
		};
	case  0 : {
			_Unit setSkill 0.7;
			_Unit setRank "LIEUTENANT"
		};
	case  1 : {
			_Unit setSkill 0.6;
			_Unit setRank "SERGEANT"
		};
	case  2 : {
			_Unit setSkill 0.5;
			_Unit setRank "CORPORAL"
		};
		default   {
			_Unit setSkill 0.4;
			_Unit setRank "PRIVATE"
		};
};
_Unit setCombatMode "RED";
_Unit setBehaviour "COMBAT";
/* Markus - Not needed
if ((side _Unit) == west)   then {
	_Unit unassignItem "NVGoggles";
	_Unit removeItem "NVGoggles";
};
if ((side _Unit) == east)   then {
	_Unit unassignItem "NVGoggles_OPFOR";
	_Unit removeItem "NVGoggles_OPFOR";
};
if ((side _Unit) == resistance) then {
	_Unit unassignItem "NVGoggles_INDEP";
	_Unit removeItem "NVGoggles_INDEP";
};

if (_Side == resistance) then{
};
if (_Side == resistance) then{
};
*/

if (_Side == resistance) then{
		_unit setSkill ["aimingSpeed", 0.5];
		_unit setSkill ["endurance", 100];
		_unit setSkill ["spotDistance", 100];
		_unit setSkill ["spotTime", 100];
		_unit setSkill ["courage", 100];
		_unit setSkill ["commanding", 100];
		if (vehicle _unit != _unit) then { // Markus - Unit is a crewman. Make them more accurate so that they engage.
			_unit setSkill ["aimingShake", 0.6];
		} else {
			_unit setSkill ["aimingShake", 0.115];
		};
};

_Unit addEventHandler ["Killed",{_this call EH_KilledUnit}];