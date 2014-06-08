private["_Function", "_Question", "_Vote"];
_Question  = _this select 1;
    _onLoad ={
 private ["_MBuyUnits", "_MBuyGear", "_MTeam", "_MVoting", "_MCommand", "_MTactical", "_MUpgrade", "_MEconomy",    "_MSupport", "_MGroups", "_NearestCheck", "_PlayerInfo", "_ComName", "_Unflip", "_Exit", "_Help",    "_Params", "_AllButtons"];
 _AllButtons = [2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2000];
  {
ctrlShow [_x, false]} forEach _AllButtons;
   _MTeam  = 2001;
 _MBuyUnits = 2002;
 _MBuyGear = 2003;
 _MTactical = 2004;
 _MSupport = 2005;
 _MGroups = 2006;
  _MUpgrade = 2007;
 _MVoting = 2008;
 _MEconomy = 2009;
 _MCommand = 2010;
 _Unflip  = 2011;
 _Exit  = 2012;
 _Help  = 2013;
 _Params  = 2014;
  ctrlEnable [2000, false];
    {
ctrlEnable [_x, false]} forEach [_MBuyUnits, _MBuyGear, _MCommand, _MTactical, _MUpgrade, _MEconomy,            _MGroups, _Help, _Params];
  {
sleep 0.001;
 ctrlShow [_x, true]} forEach _AllButtons;
   _NearestCheck = [Side Player, Player] call Compile preprocessFileLineNumbers "Functions\Nearest_Buildings.sqf";
 private ["_B", "_LF", "_HF", "_AF", "_CC", "_S", "_BF", "_TC", "_BW", "_i", "_BLFHFAFBFTC"];
 _CC  = _NearestCheck select 0;
 _B  = _NearestCheck select 1;
 _LF  = _NearestCheck select 2;
 _HF  = _NearestCheck select 3;
 _AF  = _NearestCheck select 4;
 _BF  = _NearestCheck select 5;
 _S  = _NearestCheck select 6;
 _TC  = _NearestCheck select 7;
 _BW  = _NearestCheck select 8;
  _BLFHFAFBFTC = false;
 for "_i" from 1 to (5) do {
    _BLFHFAFBFTC = if (_NearestCheck select _i) then {
true} else {
_BLFHFAFBFTC
};

 
};

  _BLFHFAFBFTC = if (_TC) then {
true} else {
_BLFHFAFBFTC
};

  ctrlEnable [_MBuyUnits, _BLFHFAFBFTC];
  ctrlEnable [_MBuyGear, _BW];
  _PlayerInfo = ["Commander", Player] call GetPlayerInfo;
 _ComName = if (count(_PlayerInfo) == 0) then {
"NoBody"} else {
_PlayerInfo select 1
};

 if ((name Player) == _ComName && _CC) then {
ctrlEnable [_MUpgrade, true]
};

  
};

_Vote ={
 private ["_OpenVoteMenu", "_Side", "_PlrInf", "_PlrShowVote"];
  _Side   = side Player;
 _OpenVoteMenu = {
  private ["_PlayerName", "_PlayerInfo", "_PlayerSV", "_Check"];
      _Check = ["Name", name Player] call GetPlayerInfo;
   if (count(_Check) > 0) then  {
   _PlayerName = name Player;
   _PlayerInfo = ["Name", _PlayerName] call GetPlayerInfo;
   _PlayerSV = _PlayerInfo select 8;
       if (_PlayerSV) then    {
    createDialog "WFVote";
   
};

  
};

 
};

    [_OpenVoteMenu,"BIS_fnc_spawn",_Side,true] spawn BIS_fnc_MP;
   _PlrInf   = ["Name", name Player] call GetPlayerInfo;
 _PlrShowVote = _PlrInf select 8;
  if (!_PlrShowVote) then {
createDialog "WFVote";

};


};

_Function = switch (_Question) do{
    case "onLoad"  : {
_onLoad
};

 case "Vote"   : {
_Vote
};


};

call _Function;
