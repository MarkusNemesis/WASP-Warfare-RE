  private["_GetPercentByUpgrade"];
_GetPercentByUpgrade ={
 private["_this", "_Side", "_Upgrades", "_Percent"];
 _Side  = _this;
         _Upgrades = ["SP3", "SP2", "SP1", "SP0"];
    _Percent = 2.5;
            {
  _Upgraded = ([_x, _Side] call Compile preprocessFileLineNumbers "Functions\Get_Upgrade_Public.sqf") select 1;
  if (_Upgraded) exitWith  {
   _Percent = _Percent - (0.5 * _forEachIndex);
  
};

 } forEach _Upgrades;
   _Percent
};

private["_Side", "_Supply", "_Money", "_UpPercent"];
_Side  = _this;
        _Supply  = 0;
         _Money  = 0;
         _UpPercent  = _Side call _GetPercentByUpgrade;
  {
 private["_Town","_TownSupply","_TownMoney","_TownSide","_TownPoints","_TownMaxP","_Percent"];
   _Town   = _x;
      _TownSupply = _Town select 4;
   _TownMoney = _Town select 5;
   _TownSide = _Town select 7;
   _TownPoints = _Town select 8;
   _TownMaxP = _Town select 6;
     _Percent  = _TownPoints / _TownMaxP;
      if (_TownSide == _Side) then  {
  _Supply = _Supply + _TownSupply * _Percent * _UpPercent;
   _Money  = _Money + _TownMoney * _Percent * _UpPercent;
 
};

  } forEach ( + Public_TownsArray);
[_Supply, _Money]