private["_TeamSide","_WWTowns","_WESTMoney","_EASTMoney"];
_Money = 0;
_WESTMoney = 0;
_EASTMoney = 0;
_WWTowns  = Public_TownsArray;
{
 private["_Town","_TownSupply","_TownMoney","_TownSide","_TownPoints","_TownMaxP","_Percent"];
   _Town   = _x;
 _TownSupply = _Town select 4;
 _TownMoney = _Town select 5;
 _TownSide = _Town select 7;
 _TownPoints = _Town select 8;
 _TownMaxP = _Town select 6;
   _Percent  = _TownPoints / _TownMaxP;
     if (_TownSide == west) then {
_WESTMoney = _WESTMoney + _TownMoney * _Percent;
_Money = _WESTMoney;

};

 if (_TownSide == east) then {
_EASTMoney = _EASTMoney + _TownMoney * _Percent;
_Money = _EASTMoney;

};

  } forEach _WWTowns;
_result = round(_Money);
_result