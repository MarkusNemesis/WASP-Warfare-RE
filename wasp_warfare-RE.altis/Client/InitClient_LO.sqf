sleep 5;
waitUntil {
["Server", "Public_ServerInit", Player] call Send_Request;
 Public_ServerInit
};

[] call Compile preprocessFileLineNumbers "Variables\Variable_Client_Global.sqf";
_PlayerInfo  =  [ nil,        name Player,      Player,        true,        side Player,      paramsArray select 3,    nil,        "",         true,        false,        nil,        getPlayerUID Player    ];
Public_PlayerList set[count(Public_PlayerList),_PlayerInfo];
Player call DeleteNVG;
[] call Compile preprocessFileLineNumbers "Client\Init\Init_SetViewDistance.sqf";
[] call Compile preprocessFileLineNumbers "Client\Init\Init_Respawn.sqf";
[] call Compile preprocessFileLineNumbers "Client\Init\Init_Markers.sqf";
[] call Compile preprocessFileLineNumbers "Client\Init\Init_KeyPress.sqf";
12452 cutText ["","BLACK IN",2];
if (Debug && (!isMultiplayer)) then{
  player addeventhandler ["HandleDamage",{
_result = 0, _result}];

};

Player addEventHandler ["Killed",{
_this call EH_KilledUnit}];
if (Debug) then{
 private ["_RespawnAction"];
   ["someId", "onMapSingleClick", "(vehicle Player) setPosATL ((_this select 1) select 0)"] call BIS_fnc_addStackedEventHandler;
   disableSerialization;
 6883 cutRsc ["Debug_Titles","PLAIN",0];
 _RespawnAction = {
  private["_RespawnInfo", "_MHQobj"];
  _RespawnInfo = uiNamespace getVariable "Respawn";
  _MHQobj   = if (side Player == west) then {
Public_MHQ_BF} else {
Public_MHQ_OF
};

  if ((_RespawnInfo select 2) == -1) then  {
   uiNamespace setVariable ["Respawn", [ getPosATL  Player , ["MHQ", "", _MHQobj] , time + 30,[]]];
  
};

  [] spawn Compile preprocessFileLineNumbers "Client\Respawn\Update_Respawn.sqf";
  [Player, 30] spawn Compile preprocessFileLineNumbers "Client\Respawn\CameraEffect.sqf";
     CreateDialog "WFRespawn";
 
};

   player addAction ["<t color='#f4c430' align='left'>Debug: [1] RespawnMenu</t>",_RespawnAction];
    player addAction ["<t color='#f4c430' align='left'>Debug: [2] GearMenu</t>",{
CreateDialog "WFGear"}];
    player addAction ["<t color='#f4c430' align='left'>Debug: [3] Construction</t>",Construction_Start];
   player addAction ["<t color='#f4c430' align='left'>Debug: [5] Add Unit</t>","Client\Action\Action_Debug_Create_Unit.sqf"];
       _GetPlayerInformation = {
  _PlrUID = getPlayerUID Player;
  _PlrInf = ["UID", _PlrUID] call GetPlayerInfo;
  hint format["PlrInf:\n%1",_PlrInf];
 
};

   Player addAction ["<t color='#f4c430' align='left'>Debug: [4] Get PlayerInfo</t>", _GetPlayerInformation];
 
};

Player call Compile preprocessFileLineNumbers "Client\Action\Action_MHQ.sqf";
Player call Compile preprocessFileLineNumbers "Client\Action\Action_PushBoat.sqf";
player addAction ["<t color='#42b6ff'>WFMenu</t><t align='right' color='#ffa500'>[U]  </t>",{
createDialog "WF_Menu"},"", 6, true, true];
player setVariable ["Progress Bar", false];
disableSerialization;
6880 cutRsc ["EconomicBar_Dialog","PLAIN",3];
private["_PlayerInfo", "_Equipment"];
if (isNil ('profileNamespace getVariable "WASP_Equipment"')) then {
 profileNamespace setVariable ["WASP_Equipment", Player call GetEquipment]
};

_Equipment = profileNamespace getVariable "WASP_Equipment";
[Player, _Equipment] call SetEquipment;
player setUnitRank "COLONEL";
[] spawn Compile preprocessFileLineNumbers "Client\FSM\Client_Loop.sqf";
