private ["_CurSel", "_PlayerName", "_PlayerList","_PlayerInfo","_isFound", "_SearchByID"];
_CurSel  = _this select 0;
        _SearchByID = if (_CurSel == -1) then {
false} else {
true
};

  _PlayerName = _this select 1;
        _PlayerList = + Public_PlayerList;
_PlayerInfo = [];
_isFound = false;
{
    hint format ["iD: %1 - %2\n Name: %3 - %4", _CurSel, _x select 0, _PlayerName, _x select 1];
    if ((_CurSel == _x select 0) || (str(_PlayerName) == str(_x select 1))) then  {
   _selectedPlayerName = _x select 1;
         _isFound = true;
               _PlayerInfo = [_x select 0, _x select 1, _x select 2, _x select 3, _x select 4, _x select 5, _x select 6, _x select 7, _x select 8, _x select 9 ];
   if (_isFound) exitwith{

};

  
};

 } forEach _PlayerList;
_result = _PlayerInfo;
_result