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

 _Unit addEventHandler ["Killed",{
_this call EH_KilledUnit}];
  if (_Side == resistance) then{

};

  if (_Side == resistance) then{

};

  if (_Side == resistance) then{

};

