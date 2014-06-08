private["_Side", "_FType", "_Level", "_Vehicles", "_NVehicles", "_result", "_Upgrades", "_PublicArray",  "_PublicIndex"];
_Side   = _this select 0;
  _FType   = _this select 1;
  _Upgrades  = if (side Player == west) then {
Public_UpgradesBF} else {
Public_UpgradesOF
};

 _PublicArray = _Upgrades select 1;
         _PublicIndex = [];
             {
 _PublicIndex set [count(_PublicIndex), _x select 0];
} forEach _PublicArray;
_NVehicles = [];
_Vehicles = switch (_FType) do {
  case "B" : {
_Side call Data_B
};

  case "LF" : {
_Side call Data_LF
};

  case "HF" : {
_Side call Data_HF
};

  case "AF" : {
_Side call Data_AF
};

  case "BF" : {
_Side call Data_BF
};

  case "TC" : {
_Side call Data_TC
};

 
};

{
 private["_Vehicle", "_VehLevel", "_VehName"];
   _Vehicle = _x;
       _VehLevel = _Vehicle select 0;
   _VehName = getText (configFile >> 'CfgVehicles' >> (_Vehicle select 1) >> "displayName");
 _Index  = _PublicIndex find _VehLevel;
     _Upgraded = (_PublicArray select _Index) select 1;
   if (_VehName != "") then {
  if (_Upgraded || (paramsArray select 1  == 0)) then    {
            _NVehicles set [count(_NVehicles), _Vehicle];
    
};

 
};

} foreach _Vehicles;
_result = _NVehicles;
_result