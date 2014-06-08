  private["_this", "_Name", "_Side", "_SideNum", "_Upgrades", "_UpgradesRun", "_PublicArray", "_Found"];
_Name   = _this select 0;
               _Side   = _this select 1;
               _Upgrades  = if (_Side == west) then {
Public_UpgradesBF} else {
Public_UpgradesOF
};

  _UpgradesRun = _Upgrades select 0;
              _PublicArray = _Upgrades select 1;
              _Found   = [];
                  {
 private["_UpgradeName"];
 _UpgradeName = _x select 0;
 if (_Name == _UpgradeName) exitWith {
_Found = _x
};

} forEach _PublicArray;
_Found