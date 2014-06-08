private ["_AllSupply","_PlayerList","_Supply","_Money", "_result", "_Side", "_PlayerName"];
_Side  = side _this;
_PlayerName = name _this;
_AllSupply  = + Public_Supply;
_PlayerList = + Public_PlayerList;
_Supply   = 0;
_Money   = 0;
 if (_Side == west) then {
_Supply = _AllSupply select 0;
} else {
_Supply = _AllSupply select 1;

};

 {
 private ["_Player","_PlayerM","_PlayerN"];
   _Player     = _x;
 _PlayerN = _Player select 1;
 _PlayerM = _Player select 5;
 If (_PlayerName == _PlayerN) then {
_Money = _PlayerM
};

} forEach _PlayerList;
_result = [_Supply, _Money];
_result