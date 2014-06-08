private ["_UpdateVote", "_SideArray"];
_UpdateVote ={
   private ["_this", "_Side", "_VoteSideVariable", "_Candidates", "_PlayerList", "_VariableName", "_VoteListArray", "_TimeEnd", "_Commander"];
  _Side    = _this select 0;
 _Candidates   = [];
 _PlayerList   = + Public_PlayerList;
 _VoteSideVariable = + (_this select 1);
 _Commander   = _VoteSideVariable select 0;
 _TimeEnd   = _VoteSideVariable select 1;
 _TimeEnd = round(_TimeEnd - Public_Time);
 _VoteListArray  = _VoteSideVariable select 2;
       {
  private ["_Player", "_PlayerSide", "_InGame"];
    _Player  = _x;
  _PlayerSide = _Player select 4;
  _InGame  = _Player select 3;
    if ((_PlayerSide == _Side) && _InGame) then {
_Candidates set[count(_Candidates), _Player select 1]
};

   } foreach _PlayerList;
     if (count (_VoteListArray) == 0) then {
    {
_VoteListArray set[count(_VoteListArray),[0,_x]]} foreach _Candidates;
 } else {
    {
   private["_Candidate", "_i", "_CanExist"];
   _Candidate = _x;
   _CanExist = false;
      for "_i" from 0 to (count(_VoteListArray)-1) do    {
    private ["_PlrInList"];
    _PlrInList = (_VoteListArray select _i) select 1;
    if ((_Candidate == _PlrInList) && !_CanExist) exitWith {
_CanExist = true
};

    
};

      if (!_CanExist) then {
_VoteListArray set[count(_VoteListArray),[0,_Candidate]]
};

    } foreach _Candidates;
        {
   private["_PlrInList", "_InGame"];
   _PlrInList  = (_x) select 1;
   _InGame  = false;
      for "_i" from 0 to (count(_Candidates)-1) do    {
    private["_Candidate"];
    _Candidate = _Candidates select _i;
    if ((_Candidate == _PlrInList) && !_InGame) exitWith {
_InGame = true
};

    
};

      if (!_InGame) then    {
    _VoteListArray set [_forEachIndex,-1];
    _VoteListArray = _VoteListArray - [-1];
   
};

     } foreach _VoteListArray;
 
};

  private ["_NewCommander", "_Percent", "_ComInf"];
   _NewCommander = [0,"nobody"];
     {
  private ["_Votes", "_Name"];
     _Votes  = _x select 0;
  _Name = _x select 1;
  if ((_NewCommander select 0) < _Votes) then {
_NewCommander = [_Votes, _Name]
};

   } forEach _VoteListArray;
   _Percent = if ((_NewCommander select 0) <= 0) then {
0} else {
(_NewCommander select 0) / count(_VoteListArray)
};

 if (_Percent > 0.31) then {
_VoteSideVariable set [0, _NewCommander select 1]
};

   _VoteSideVariable set [2, _VoteListArray];
 if (_Side == west) then {
  ["Public_VoteBF", 0, [true,false,false], _NewCommander select 1] call Send_ArrayRow;
  ["Public_VoteBF", 2, [true,false,false], _VoteListArray] call Send_ArrayRow;
 } else {
  ["Public_VoteOF", 0, [false,true,false], _NewCommander select 1] call Send_ArrayRow;
  ["Public_VoteOF", 2, [false,true,false], _VoteListArray] call Send_ArrayRow;
 
};

       if (_TimeEnd <= 0) then {
  private ["_Msg"];
      {
   private ["_PlayerInf"];
   _PlayerInf = _x;
        _PlayerSide = _PlayerInf select 4;
       if (_PlayerSide == _Side) then   {
        _PlayerInf set[7, ""];
    _PlayerInf call SetPlayerInfo;
   
};

  } forEach _PlayerList;
  ["UpdateVote.sqf", "DELETE VOTED WHO INF from PLAYER LIST"] call Fun_AddToLog;
        _Percent = if ((_NewCommander select 0) <= 0) then {
0} else {
(_NewCommander select 0) / count(_VoteListArray)
};

  if (_Percent > 0.31) then  {
      {
    private ["_PlayerInf", "_PlayerSide", "_PlayerCom"];
    _PlayerInf = + _x;
         _PlayerSide = _PlayerInf select 4;
     _PlayerCom = _PlayerInf select 9;
        if (_PlayerSide == _Side && _PlayerCom) exitWith    {
          _PlayerInf set [ 9, false];
         _PlayerInf call SetPlayerInfo;
    
};

   } forEach _PlayerList;
   ["UpdateVote.sqf", "SET OLD COMMANDER - false"] call Fun_AddToLog;
        _VoteSideVariable set [0, _NewCommander select 1];
   _ComInf = +(["Name", _NewCommander select 1] call GetPlayerInfo);
   ["UpdateVote.sqf", "GET NEW COMMANDER DATA"] call Fun_AddToLog;
         _ComInf set [9, true];
   _ComInf call SetPlayerInfo;
   ["UpdateVote.sqf", "WRITE IN PLAYER DATA isCommander - true"] call Fun_AddToLog;
  
};

   _VoteSideVariable set [1, -1];
  _VoteSideVariable set [2, []];
  _VoteSideVariable set [3, -1];
         if (_Side == west) then {
   ["Public_VoteBF", 0, [true,false,false], _NewCommander select 1] call Send_ArrayRow;
   ["Public_VoteBF", 1, [true,false,false], -1] call Send_ArrayRow;
   ["Public_VoteBF", 2, [true,false,false], []] call Send_ArrayRow;
   ["Public_VoteBF", 3, [true,false,false], -1] call Send_ArrayRow;
  }  else {
   ["Public_VoteOF", 0, [true,false,false], _NewCommander select 1] call Send_ArrayRow;
   ["Public_VoteOF", 1, [false,true,false], -1] call Send_ArrayRow;
   ["Public_VoteOF", 2, [false,true,false], []] call Send_ArrayRow;
   ["Public_VoteOF", 3, [false,true,false], -1] call Send_ArrayRow;
  
};

  ["UpdateVote.sqf", "VOTE COMMANDER STOPED AND BROADCASTED"] call Fun_AddToLog;
      _Msg =  {
   private ["_Text", "_VoteSideVariable", "_Commander",  "_Side"];
      _Side    = side Player;
   _VoteSideVariable  = if (_Side == west) then {
Public_VoteBF} else {
Public_VoteOF
};

   _Commander   = _VoteSideVariable select 0;
    if ((_Commander) == "nobody") then {
_Text = "COMMANDER WAS NOT SELECTED"}    else {
_Text = format["NEW COMMANDER<br /><t size='1.2'>%1</t>", _Commander]
};

         ["White", "COMMANDER", _Text, "", 0, -1, ""] spawn HintMSG_Complete;
     
};

      [_Msg,"BIS_fnc_spawn",_Side,false] spawn BIS_fnc_MP;
  ["UpdateVote.sqf", "MSG FOR ALL SENT"] call Fun_AddToLog;
   
};


};

_SideArray = [west, east];
for "_i" from 0 to (count(_SideArray)-1) do  {
  private ["_VoteSideV", "_TimeEnd", "_Side"];
    _Side  = _SideArray select _i;
  _VoteSideV  = switch (_Side) do  {
   case west: {
Public_VoteBF
};

   case east: {
Public_VoteOF
};

  
};

  _TimeEnd  = _VoteSideV select 1;
      if (_TimeEnd != -1) then  {
   [_Side, _VoteSideV] call _UpdateVote;
  
};

 
};

