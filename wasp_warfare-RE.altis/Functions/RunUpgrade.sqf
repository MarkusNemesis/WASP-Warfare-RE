 _Script = {
  private["_Side", "_SideNum", "_UpgradeVar", "_Upgrades", "_UpgradesRun", "_PublicArray",    "_Name", "_Time", "_FullName", "_Access"];
  _Side   = _this select 0;
         _Name   = _this select 1;
         _Time   = _this select 2;
         _FullName  = _this select 3;
         _SideNum  = 0;
    _Upgrades  = if (side Player == west) then {
Public_UpgradesBF} else {
Public_UpgradesOF
};

   _UpgradesRun = _Upgrades select 0;
        _PublicArray = _Upgrades select 1;
            _UpgradesRun  = _Name;
  _Upgrades  = [_UpgradesRun, _PublicArray];
  _Access   = switch _Side do  {
   case west  : {
["Public_UpgradesBF",[true,false,false]]
};

   case east  : {
["Public_UpgradesOF",[false,true,false]]
};

  
};

      [_Access select 0, 0, _Access select 1, _UpgradesRun] spawn Send_ArrayRow;
      _this spawn   {
   private["_Side", "_SideNum", "_UpgradeVar", "_Upgrades", "_UpgradesRun", "_PublicArray",     "_Name", "_Time", "_FullName", "_Access"];
   sleep (if (Debug) then {
5} else {
_this select 2});
   _Side   = _this select 0;
          _Name   = _this select 1;
          _Time   = _this select 2;
          _FullName  = _this select 3;
          _Side   = _this select 0;
          _Upgrades  = if (_Side == west) then {
Public_UpgradesBF} else {
Public_UpgradesOF
};

    _UpgradesRun = "";
             _PublicArray = _Upgrades select 1;
           _Access   = switch _Side do   {
    case west  : {
["Public_UpgradesBF",[true,false,false]]
};

    case east  : {
["Public_UpgradesOF",[false,true,false]]
};

   
};

        {
    private["_x", "_forEachIndex"];
    if ((_x select 0) == _Name) then     {
     _x set [1, true];
     _PublicArray set [_forEachIndex, _x];
               [_Access select 0, 1, _forEachIndex, _Access select 1, _x] call Send_ArrayRowCol;
    
};

   } forEach _PublicArray;
        [_Access select 0, 0, _Access select 1, ""] spawn Send_ArrayRow;
          [_Side, [_FullName, {
["UpgradeA", _this] call SayMSG_All}], ObjNull] call Send_Run;
  
};

 
};

 ["Server", [_this, _Script], Player] call Send_Run;
