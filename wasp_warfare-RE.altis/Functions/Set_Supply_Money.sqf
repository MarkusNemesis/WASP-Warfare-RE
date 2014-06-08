 private ["_AllSupply","_Supply","_Money","_this","_PlayerUID","_PlayerSide", "_PlayerInfo", "_PlrMoney"];
 _AllSupply  = Public_Supply;
_Supply   = _this select 1;
_Money  = _this select 2;
_PlayerUID  = getPlayerUID (_this select 0);
_PlayerSide = side (_this select 0);
 if (_PlayerSide == west) then {
 ["Public_Supply", 0, (_AllSupply select 0) + _Supply] call Send_All_Array;
} else {
 ["Public_Supply", 1, (_AllSupply select 1) + _Supply] call Send_All_Array;

};

 _PlayerInfo = ["UID", _PlayerUID] call GetPlayerInfo;
if (count(_PlayerInfo) > 0) then {
 _PlrMoney = _PlayerInfo select 5;
 _PlrMoney = _PlrMoney + _Money;
 _PlayerInfo set [5, _PlrMoney];

};

  _PlayerInfo call SetPlayerInfo;
