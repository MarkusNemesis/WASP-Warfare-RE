private["_PlayerInfo"];
_PlayerInfo  = ["UID", getPlayerUID Player] call GetPlayerInfo;
  _PlayerInfo  set [2, Player];
          _PlayerInfo  call SetPlayerInfo;
           player setUnitRank "COLONEL";
player addRating 4000;
  if (!isServer) then {
    Player addEventHandler ["Killed",{
_this call EH_KilledUnit;
}];
    
};

 Player call Compile preprocessFileLineNumbers "Client\Action\Action_MHQ.sqf";
Player call Compile preprocessFileLineNumbers "Client\Action\Action_PushBoat.sqf";
player addAction ["<t color='#42b6ff'>WFMenu</t><t align='right' color='#ffa500'>[U]  </t>",{
createDialog "WF_Menu"},"", 6, true, true];
if (Debug) then{
  Player addAction ["<t color='#f4c430' align='left'>Debug: [4] Mini PlayerList</t>", "Client\Action\Action_PlayerList.sqf"];
  player addAction ["<t color='#f4c430' align='left'>Debug: [5] Add Unit</t>","Client\Action\Action_Debug_Create_Unit.sqf"];
   ["someId", "onMapSingleClick", {
hint str[_this];
 (vehicle Player) setPosATL _this}] call BIS_fnc_addStackedEventHandler;

};

 player setVariable ["Progress Bar", false];
disableSerialization;
6880 cutRsc ["EconomicBar_Dialog","PLAIN",3];
 [Player, profileNamespace getVariable "WASP_Equipment"] call SetEquipment;
