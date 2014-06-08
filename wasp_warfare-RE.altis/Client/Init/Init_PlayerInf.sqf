private ["_PlayerInfo", "_Equipment", "_BasicItem", "_NVG", "_Index"];
["Server", "Public_PlayerList"] call Send_Request;
missionNamespace setVariable ["Done_Public_PlayerList", false];
    waitUntil {
(missionNamespace getVariable "Done_Public_PlayerList")
};

  ["Init_PlayerInf.sqf", "PlayersList Received"] call Fun_AddToLog;
_PlayerInfo = ["UID", getPlayerUID Player] call GetPlayerInfo;
  if (count _PlayerInfo <= 0) then  {
   ["CLIENT INIT", format["ADD NEW PLAYER INF [NAME: %1] [UID: %2]", name Player, getPlayerUID Player]] call Fun_AddToLog;
  _PlayerInfo  =   [  nil,         name Player,       Player,         true,         side Player,       paramsArray select 3,     nil,         "",          true,         false,         nil,         getPlayerUID Player     ];
  Player call DeleteNVG;
  profileNamespace setVariable ["WASP_Equipment", player call GetEquipment];
}else{
   ["CLIENT INIT", format["REFRESH PLAYER INF [NAME: %1] [UID: %2]", name Player, getPlayerUID Player]] call Fun_AddToLog;
   if ((side Player) != (_PlayerInfo select 4)) exitWith  {
  ["TEAM SWAP", format["BACK TO LOBBY [NAME: %1] [UID: %2]", name Player, getPlayerUID Player]] call Fun_AddToLog;
  failMission "END2";
 
};

  _PlayerInfo set [1 , name Player];
  _PlayerInfo set [2 , Player];
   _PlayerInfo set [3 , true];
    _PlayerInfo set [9 , false];
   _PlayerInfo set [10, owner Player];
    if (!isNil ('profileNamespace getVariable "WASP_Equipment"')) then {
  [Player, profileNamespace getVariable "WASP_Equipment"] call SetEquipment 
};

 
};

WaitUntil {
 _PlayerInfo call SetPlayerInfo;
 _InfoCheck = ["UID", getPlayerUID Player] call GetPlayerInfo;
 (count _InfoCheck >= 0)
};

