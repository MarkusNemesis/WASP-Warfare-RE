 private ["_this", "_DeadBody", "_NewBody", "_DeadBdPos", "_MHQobj", "_RespawnInfo"];
_NewBody = _this select 0;
_DeadBody = _this select 1;
if (isPlayer _NewBody) then  {
 _RespawnInfo  = uiNamespace getVariable "Respawn";
if (!isNil "_RespawnInfo" && !isNil "Respawn_Update") then{
  _NewBody  = _this select 0;
_DeadBody   = _this select 1;
_DeadBdPos  = getPosATL  _DeadBody;
_MHQobj = if (side Player == west) then {
Public_MHQ_BF} else {
Public_MHQ_OF
};

_RespawnInfo set[0, _DeadBdPos];
 _RespawnInfo set[1, ["MHQ", "", _MHQobj]];
_RespawnInfo set[2, time + 30];
  uiNamespace setVariable ["Respawn", _RespawnInfo];
[] spawn Respawn_Update;
[_DeadBody, 30] spawn Respawn_CameraEffect;
createDialog "WFRespawn";
 [] spawn Respawn_Run;
 
};


};

