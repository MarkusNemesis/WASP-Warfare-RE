   private["_PlayerFrom", "_PlayerTo", "_Money"];
_PlayerFrom = _this select 0;
  _PlayerTo = _this select 1;
  _Money  = _this select 2;
  [_PlayerFrom, 0, - _Money] call SetPlayerSupplyMoney;
 [_PlayerTo , 0, + _Money] call SetPlayerSupplyMoney;
 [_PlayerTo, [[_PlayerFrom,_Money], {
 ["Payment", format["%1 sent you money",name (_this select 0)], _this select 1] spawn HintMSG_Pay}], objNull] call Send_Run;
