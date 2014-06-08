 private["_SaveGroupToTownData", "_SortVehToUseInTown", "_CreateRespawnedUnit"];
_SaveGroupToTownData ={
    private["_Group", "_Town", "_TownGroups"];
 _Group  = _this select 0;
 _Town = _this select 1;
 _TownGroups = _Town select 10;
 _TownGroups set [count(_TownGroups),_Group];
 _Town set[10,_TownGroups];
   _Town
};

_CreateRespawnedUnit ={
    private["_Unit", "_Group", "_UnitType", "_RandomRespawnPoint", "_TownSide", "_j", "_Type"];
 _Group    = _this select 0;
 _UnitType   = _this select 1;
 _RandomRespawnPoint = _this select 2;
 _TownSide   = _this select 3;
 _j     = _this select 4;
 _Type    = _this select 5;
  _Unit = _Group createUnit [_UnitType select _j, _RandomRespawnPoint, [], 10, "CAN_COLLIDE"] ;
   _Unit setPosASL _RandomRespawnPoint;
 _script = [_TownSide,_Unit,_Type,_j,_Group] spawn ServerAI_Init;
  waitUntil {
scriptDone _script
};

    _Unit
};

_SortVehToUseInTown ={
 private["_VehicleArray", "_NewArray"];
 _VehicleArray = _this;
 _NewArray  = [];
 {
  private["_AiUse"];
  _AiUse = _x select 9;
  if (_AiUse) then {
_NewArray set[count(_NewArray), _x]
};

 } forEach _VehicleArray;
 _NewArray
};

_CreateVehicleCrew ={
     private["_Vehicle", "_Crew", "_script"];
 _Vehicle = _this;
    _script = _Vehicle spawn {
createVehicleCrew _this
};

 waitUntil {
scriptDone _script
};

 _Crew = crew _Vehicle;
     _Group = group (_Crew select 0);
    {
  _script = [side _Group, _x,"Random", -1,_Group] spawn ServerAI_Init;
 waitUntil {
scriptDone _script
};

 } forEach _Crew;
  _Group
};

private["_WWCamps", "_WWTowns", "_Enemy", "_Town", "_Id", "_TownPos", "_TownSide", "_TownSize", "_TownRange", "_TownsCamps",  "_Camp", "_ManGroups", "_MansInGroup", "_UnitTypeScript", "_MaxVehicles", "_MaxHeavy", "_LFType", "_HFType",  "_TownMaxPiont", "_TownPoint", "_ParamKoef", "_PointKoef", "_RespawnKoef"];
_WWCamps   = Public_CampsArray;
_WWTowns  = Public_TownsArray;
_Enemy   = _this select 1;
_Town    = _this select 0;
_Id    = _Town select 0;
_TownPos  = getPosATL (_Town select 1);
_TownMaxPiont = _Town select 6;
_TownSide  = _Town select 7;
_TownPoint  = _Town select 8;
_TownSize  = _Town select 3;
_TownRange   = 150 + (20 * _TownSize);
_TownsCamps  = _Town select 9;
_Camp    = _WWCamps select (_TownsCamps select 0);
_RespawnSlow = 1;
            _ParamKoef  = if (_TownSide == resistance) then {
paramsArray select 6} else {
paramsArray select 5
};

_PointKoef   = _TownPoint / _TownMaxPiont;
_RespawnKoef  = round (_TownSize * _PointKoef + _ParamKoef);
_ManGroups  =  1 + _RespawnKoef;
  _MansInGroup =  4 + _RespawnKoef;
  _MaxVehicles =  0 + _RespawnKoef;
  _MaxHeavy  = -1 + _RespawnKoef;
  _Town set[12, time];
 _LFType   = _TownSide call compile preprocessFileLineNumbers "Data\Data_LVehicles.sqf";
_HFType   = _TownSide call compile preprocessFileLineNumbers "Data\Data_HVehicles.sqf";
_LFType   = _LFType call _SortVehToUseInTown;
  _HFType   = _HFType call _SortVehToUseInTown;
  _UnitTypeScript = switch (_TownSide) do{
 case resistance : {
Compile preprocessFileLineNumbers "Server\AI\RESIS\Resis_Groups.sqf"
};

 case West  : {
Compile preprocessFileLineNumbers "Server\AI\WEST\West_Groups.sqf"
};

 case East  : {
Compile preprocessFileLineNumbers "Server\AI\EAST\East_Groups.sqf"
};


};

{
 private[];
 _Camp   = Public_CampsArray select _x;
 _CampPos = getPosASL  (_Camp select 1);
 _CampSide = _Camp select 3;
 _GuardResP = if (_CampSide == _TownSide) then {
_CampPos} else {
_TownPos
};

 _Group  = createGroup _TownSide;
 _Group setFormation "COLUMN";
 _Group setBehaviour "COMBAT";
 _Group setCombatMode "RED";
 _MGAT = nearestObjects [_TownPos, ["B_HMG_01_high_F","I_static_AT_F"], _TownRange + 100];
    {
  _Unit = _Group createUnit ["I_crew_F", _CampPos, [], 10, "FORM"];
  _Unit moveInGunner _x;
  _script = [_TownSide,_Unit,"Recon",1,_Group] spawn ServerAI_Init;
 waitUntil {
scriptDone _script
};

 } ForEach _MGAT;
   _Town = [_Group,_Town] call _SaveGroupToTownData;
 sleep _RespawnSlow;
} forEach _TownsCamps;
private["_RoadList", "_RoadExist"];
_RoadList  = _TownPos nearRoads (_TownRange + 50);
_RoadExist = false;
if (count (_RoadList) > 0) then {
_RoadExist = true}else {
_ManGroups = _ManGroups + _MaxVehicles + _MaxHeavy
};

for "_i" from 1 to (_ManGroups) do{
 private["_RandomRespawnPoint"];
  _random = floor(random (2));
 _Type = switch (_random) do {
  case 0 : {
"Patrol"
};

  case 1 : {
"Recon"
};

  case 2 : {
"Patrol"
};

 
};

 _RandomRespawnPoint =  [  (_TownPos select 0) - _TownRange + random (_TownRange * 2),    (_TownPos select 1) - _TownRange + random (_TownRange * 2),    _TownPos select 2             ];
 _RandomRespawnPoint set [ 2, getTerrainHeightASL _RandomRespawnPoint];
   _Group = createGroup _TownSide;
 _Group setFormation "COLUMN";
 _Group setBehaviour "CARELESS";
 _Group setCombatMode "YELLOW";
 _UnitType = "Random" call _UnitTypeScript;
 for "_j" from 0 to (count(_UnitType)-1) do {
  _Unit = [_Group, _UnitType, _RandomRespawnPoint, _TownSide, _j, _Type] spawn _CreateRespawnedUnit;
  waitUntil {
scriptDone _Unit
};

 
};

  if (surfaceIsWater _RandomRespawnPoint) then {
  private["_Boat", "_UnitsInGroup"];
  _Boat    = "I_Boat_Armed_01_minigun_F" createVehicle _RandomRespawnPoint;
  _UnitsInGroup = Units _Group;
      {
   switch _forEachIndex do   {
    case 0 : {
_x moveInCommander _Boat
};

    case 1 : {
_x moveInGunner _Boat
};

    case 2 : {
_x moveInDriver _Boat
};

    default   {
deleteVehicle _x
};

   
};

  } forEach _UnitsInGroup;
    _Type = "WaterPatrol";
 
};

    _script = [_Group,_Type,_Camp,_TownPos,_TownRange,_WWCamps,_TownsCamps] spawn ServerAI_Waypoints;
  waitUntil {
scriptDone _script
};

  _Town = [_Group,_Town] call _SaveGroupToTownData;
 sleep _RespawnSlow;

};

if (_RoadExist) then{
   for "_i" from 1 to (_MaxVehicles) do {
  private["_Random", "_Type", "_Group", "_Driver", "_Guner", "_Com", "_Unit", "_Road"];
  _Type  = "";
    waitUntil  {
   _Random = floor(random (count(_LFType)));
   _Type  = (_LFType select _Random) select 1;
   getText (configFile >> 'CfgVehicles' >> (_Type) >> "displayName") != ""  
};

  _Driver = (_LFType select _Random) select 6;
  _Guner = (_LFType select _Random) select 7;
  _Com = (_LFType select _Random) select 8;
  _Road = _RoadList select random(count(_RoadList));
  _Vehicle = _Type createVehicle (getPosATL(_Road));
    _Vehicle addEventHandler ["Killed",{
_this call EH_KilledVehicle}];
                        _Group = _Vehicle call _CreateVehicleCrew;
    _script = [_Group,"Patrol",_Camp,_TownPos,_TownRange,_WWCamps,_TownsCamps] spawn ServerAI_Waypoints;
  waitUntil {
scriptDone _script
};

    _Town = [_Group,_Town] call _SaveGroupToTownData;
    sleep _RespawnSlow;
 
};

   for "_i" from 1 to (_MaxHeavy) do {
  private["_Random", "_Type", "_Group", "_Driver", "_Guner", "_Com", "_Unit", "_Road"];
  _Type  = "";
    waitUntil  {
   _Random = floor(random (count(_HFType)));
   _Type  = (_HFType select _Random) select 1;
   getText (configFile >> 'CfgVehicles' >> (_Type) >> "displayName") != ""  
};

  _Driver = (_HFType select _Random) select 6;
  _Guner = (_HFType select _Random) select 7;
  _Com = (_HFType select _Random) select 8;
  _Road = _RoadList select random(count(_RoadList));
  _Vehicle = _Type createVehicle (getPosATL(_Road));
    _Vehicle addEventHandler ["Killed",{
_this call EH_KilledVehicle}];
                          _Group = _Vehicle call _CreateVehicleCrew;
    _script = [_Group,"Patrol",_Camp,_TownPos,_TownRange,_WWCamps,_TownsCamps] spawn ServerAI_Waypoints;
  waitUntil {
scriptDone _script
};

    _Town = [_Group,_Town] call _SaveGroupToTownData;
  sleep _RespawnSlow;
 
};


};

_Town set[12, time];
 _Town set[11, true];
 ["Public_TownsArray", _Id, 10, [false, false, false], _Town select 10] call Send_ArrayRowCol;
