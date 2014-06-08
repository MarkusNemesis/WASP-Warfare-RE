 private["_this", "_SID", "_Name", "_UID"];
_SID  = _this select 0;
  _Name  = _this select 1;
  _UID  = _this select 2;
  _PlayerInfo = ["UID", _UID] call GetPlayerInfo;
_PlayerInfo set [3, false];
if (_PlayerInfo select 9) then{
 _PlayerInfo set [9, false];
 _Access = switch (_PlayerInfo select 4) do {
  case west : {
[true,false,false]
};

  case east : {
[false,true,false]
};

 
};

  ["Public_VoteBF", 0, _Access, "nobody"] call Send_ArrayRow;
 ["Public_VoteBF", 1, _Access, Public_Time + (if (debug) then {
20} else {
60})] call Send_ArrayRow;
 ["Public_VoteBF", 2, _Access, []] call Send_ArrayRow;
 ["Public_VoteBF", 3, _Access, 1] call Send_ArrayRow;
 [_PlayerInfo select 4, [[], {
createDialog 'WFVote'}], objNull] call Send_Run;

};

_PlayerInfo call SetPlayerInfo;
{
  if (vehicle _x != _x) then {
deleteVehicle (vehicle _x)
};

 deleteVehicle _x;
} forEach (group (_PlayerInfo select 2));
