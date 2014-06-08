 private["_Side", "_Question", "_SideNum", "_Upgrades", "_PublicArray", "_PublicArray", "_PublicIndex",  "_NewGearData", "_result"];
_Side   = _this select 0;
  _Question  = _this select 1;
  _Upgrades  = if (side Player == west) then {
Public_UpgradesBF} else {
Public_UpgradesOF
};

 _PublicArray = _Upgrades select 1;
         _PublicIndex = [];
             _NewGearData = [];
             {
 _PublicIndex set [count(_PublicIndex), _x select 0];
} forEach _PublicArray;
_GearDataByType = [_Side, _Question] call compile preprocessFileLineNumbers "Data\Data_Gear.sqf";
if ((typeName _Side) == "SIDE") then{
  {
  private["_GearLevel", "_Index", "_Upgraded"];
  _GearLevel = _x select 0;
          _Index  = _PublicIndex find _GearLevel;
      _Upgraded = (_PublicArray select _Index) select 1;
       if (_Upgraded) then {
_NewGearData set[ count(_NewGearData), [_x select 1, _x select 2]]
};

  } forEach _GearDataByType;
}else{
  {
  _NewGearData set[ count(_NewGearData), [_x select 1, _x select 2]];
 } forEach _GearDataByType;

};

_result = _NewGearData;
_result