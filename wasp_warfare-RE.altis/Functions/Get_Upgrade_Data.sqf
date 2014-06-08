 private["_this", "_Name", "_result", "_UpgradesData", "_Upgrade"];
_Name   = _this;
                 _UpgradesData = "All" call Compile preprocessFileLineNumbers "Data\Data_Upgrades.sqf";
 _Upgrade  = [];
                  {
 if (_Name == (_x select 0)) then {
_Upgrade = _UpgradesData select _forEachIndex
};

} forEach _UpgradesData;
_result = _Upgrade;
_result