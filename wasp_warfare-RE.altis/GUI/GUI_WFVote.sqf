private ["_Question", "_Function", "_onLoad", "_Select", "_Vote", "_VoteSideVariable", "_PlayerList",   "_CanWrite", "_Show", "_Check", "_Side"];
disableSerialization;
_Question  = _this select 1;
    _Side   = side Player;
_onLoad = {
 private ["_Commander", "_TimeEnd", "_VoteListArray"];
  uiNamespace setVariable ["WFDisplay_VoteMenu", (_this select 0) select 0];
    _VoteSideVariable = if (_Side == west) then {
Public_VoteBF} else {
Public_VoteOF
};

 _TimeEnd   = round(_VoteSideVariable select 1);
   if (_TimeEnd == -1) then {
  private ["_VariableName"];
    _VoteSideVariable set [1, Public_Time + (if (debug) then {
20} else {
60})];
  _VoteSideVariable set [3, 1];
        if (side Player == west) then  {
   ["Public_VoteBF", 1, [true,false,false], Public_Time + (if (debug) then {
20} else {
60})] call Send_ArrayRow;
   ["Public_VoteBF", 2, [true,false,false], []] call Send_ArrayRow;
   ["Public_VoteBF", 3, [true,false,false], 1] call Send_ArrayRow;
   [west, [[], {
createDialog 'WFVote'}], objNull] call Send_Run;
  }  else  {
   ["Public_VoteOF", 1, [false,true,false], Public_Time + (if (debug) then {
20} else {
60})] call Send_ArrayRow;
   ["Public_VoteOF", 2, [false,true,false], []] call Send_ArrayRow;
   ["Public_VoteOF", 3, [false,true,false], 1] call Send_ArrayRow;
   [east, [[], {
createDialog 'WFVote'}], objNull] call Send_Run;
  
};

 
};

   _Check = ["Name", name Player] call GetPlayerInfo;
   if (count(_Check) > 0) then {
    waitUntil   {
   private ["_result", "_Display", "_Candidates", "_VoteListChanged", "_PlayerInf", "_PlayerVoted", "_OnOff", "_ShowVote"];
     _result    = false;
   _Display   = uiNamespace getVariable "WFDisplay_VoteMenu";
   _PlayerInf   = ["Name", name Player] call GetPlayerInfo;
   _PlayerVoted  = _PlayerInf select 7;
   _VoteSideVariable = if (_Side == west) then {
Public_VoteBF} else {
Public_VoteOF
};

   _Commander   = _VoteSideVariable select 0;
   _TimeEnd   = _VoteSideVariable select 1;
 _TimeEnd = round(_TimeEnd - Public_Time);
   _VoteListArray  = _VoteSideVariable select 2;
         ctrlSetText [1003, format["00:%1",_TimeEnd]];
   if (_TimeEnd < 30) then {
(_Display DisplayCtrl 1003) ctrlSetTextColor [1, 1, 0, 1];

};

   if (_TimeEnd < 10) then {
(_Display DisplayCtrl 1003) ctrlSetTextColor [1, 0, 0, 1];

};

        ctrlSetText [1005, format["%1",_Commander]];
         _ShowVote = _PlayerInf select 8;
   _OnOff  = if (_ShowVote) then {
"ENABLED"} else {
"DISABLED"
};

   ctrlSetText [1601, format["SHOW VOTE MENU: %1",_OnOff]];
   (_Display DisplayCtrl 1601) ctrlSetTextColor (if (!_ShowVote) then {
[0.258823529, 0.713725490, 1, 0.8]} else {
[0.258823529, 0.913725490, 1, 1]});
         lbClear 1500;
     {
    LbAdd [1500,format ["%1  %2", _x select 0, _x select 1]];
        if ((_x select 1) != _PlayerVoted) then      {
     lbSetColor [1500,  _forEachIndex, [0.258823529, 0.713725490, 1, 1]];
    }    else    {
     lbSetColor [1500,  _forEachIndex, [1, 1, 0, 1]]    
};

      } foreach _VoteListArray;
        if (_TimeEnd <= 0) then {
closeDialog 0
};

     sleep 0.2;
   (isNull _Display)  
};

 
};


};

_Select = {

};

_Vote = {
 private ["_VoteListArray", "_VoteListNum", "_VariableName", "_PlayerInf", "_PlayerVoted"];
  _PlayerInf   = ["Name", name Player] call GetPlayerInfo;
 _PlayerVoted  = _PlayerInf select 7;
 _VoteListNum   = lbCurSel 1500;
 _VoteSideVariable = if (_side == west) then {
Public_VoteBF} else {
Public_VoteOF
};

 _VoteListArray  = _VoteSideVariable select 2;
   {
  private ["_PlrInList", "_PlrListID", "_PlrVote", "_PlrListName"];
  _PlrInList  = _x;
  _PlrVote  = _PlrInList select 0;
  _PlrListName = _PlrInList select 1;
  _PlrListID  = _forEachIndex;
    if (_VoteListNum == _PlrListID) exitWith   {
       if (_PlrListName != _PlayerVoted) then   {
        if (_PlayerVoted != "") then    {
     {
      if (_PlayerVoted == (_x select 1)) then      {
       private["_OldVote"];
              _OldVote = _x select 0;
       _OldVote = if (_OldVote > 0) then {
_OldVote - 1} else {
0
};

       _VoteListArray set[_forEachIndex, [_OldVote, _x select 1]];
      
};

     } forEach _VoteListArray;
    
};

        _PlrVote   = _PlrVote + 1;
    _PlayerVoted = _PlrListName;
            _PlrInList set [0, _PlrVote];
    _VoteListArray set [_PlrListID, _PlrInList];
    _VoteSideVariable set [2, _VoteListArray];
    if (side Player == west) then    {
     ["Public_VoteBF", _VoteSideVariable] call Send_All_Data;
    }    else    {
     ["Public_VoteOF", _VoteSideVariable] call Send_All_Data;
    
};

            _PlayerInf set[ 7, _PlayerVoted];
    _PlayerInf call SetPlayerInfo;
   
};

  
};

    } forEach _VoteListArray;

};

_Show ={
 private["_PlayerInf", "_ShowVote", "_OnOff", "_Display"];
  _PlayerInf = ["Name", name Player] call GetPlayerInfo;
 _Display = uiNamespace getVariable "WFDisplay_VoteMenu";
 _ShowVote = _PlayerInf select 8;
 _OnOff  = "ENABLED";
    if (_ShowVote) then {
  _PlayerInf set[8, false];
  _PlayerInf spawn SetPlayerInfo;
  _OnOff = "DISABLED";
 } else {
  _PlayerInf set[8, true];
  _PlayerInf spawn SetPlayerInfo;
 
};

   ctrlSetText [1601, format["SHOW VOTE MENU: %1",_OnOff]];
 (_Display DisplayCtrl 1601) ctrlSetTextColor (if (_ShowVote) then {
[0.258823529, 0.713725490, 1, 0.8]} else {
[0.258823529, 0.913725490, 1, 1]});

};

_Function = switch (_Question) do{
    case "onLoad"  : {
_onLoad
};

 case "Select"  : {
_Select
};

 case "Vote"   : {
_Vote
};

 case "Show"   : {
_Show
};


};

call _Function;
