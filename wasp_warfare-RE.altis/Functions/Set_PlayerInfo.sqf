 private["_SendChangedData"];
_SendChangedData =   {
    private["_Index", "_OldData", "_NewData"];
 _Index  = _this select 0;
   _OldData = +(_this select 1);
  _NewData = +(_this select 2);
        for "_i" from 0 to (count _OldData) step 1 do {
  private["_OldCell", "_NewCell"];
  _OldCell = _OldData select _i;
  _NewCell = _NewData select _i;
    if (!isNil "_OldCell") then  {
           if (str(_OldCell) != str(_NewCell)) then   {
        ["Public_PlayerList", _Index, _i, [true,true,true], _NewCell] call Send_ArrayRowCol;
            _CellsName = ["ID","Name","Object","In Game","Side","Money","Equipment","Voted for","Show Vote","Commander","ServerID","UID"];
    ["SetPlayerInfo.sqf", format["%1 - %2: %3",_NewData select 1, _CellsName select _i, _NewCell]] spawn Fun_AddToLog;
   
};

  
};

 
};


};

  private ["_this", "_PlayerList", "_Value", "_TimeS", "_WaitTime", "_result", "_Founded", "_CanWrite",   "_PlayerInfNotBug"];
_PlayerInfNotBug = true;
if (isNil "_this") then {
_PlayerInfNotBug = false}else{
 if ((typeName _this) != "ARRAY") then {
_PlayerInfNotBug = false}else{
   if (count _this < 11) then {
_PlayerInfNotBug = false}  else  {
     if (typeName (_this select 5) !=  "SCALAR") then {
_PlayerInfNotBug = false
};


};

 }
};

if (_PlayerInfNotBug) then{
   _PlayerList = + Public_PlayerList;
 _Value  = +(_this);
    _Value  set [6, nil];
   _Founded = false;
     if ( count(_PlayerList) > 0) then {
  private["_UID"];
    _UID  = _Value select 11;
   {
   if ((typeName _x) == "ARRAY") then {
    if (_UID == (_x select 11)) then     {
          _Value set[0, _forEachIndex];
     _script = [_forEachIndex, _x, _Value] call _SendChangedData;
          _Founded = true;
    
};

   
};

          if (_Founded) exitWith {

};

  } forEach _PlayerList;
 
};

   if (!_Founded) then  {
  _Value set[0, count(_PlayerList)];
  ["Public_PlayerList", count(_PlayerList), _Value] call Send_All_Array;
 ["SetPlayerInfo", format["Added: %1", _this]] spawn Fun_AddToLog;
  
};

}else{
 ["SetPlayerInfo", format["Buged: %1", _this]] spawn Fun_AddToLog;

};

_PlayerInfNotBug 