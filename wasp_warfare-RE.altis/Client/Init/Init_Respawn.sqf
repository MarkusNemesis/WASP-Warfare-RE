private["_MHQ", "_RespawnPos"];
["CLIENT INIT", "RESPAWN NEAR MHQ"] call Fun_AddToLog;
_MHQ  = if (side Player == west) then {
Public_MHQ_BF} else {
Public_MHQ_OF
};

_RespawnPos = [getPosATL _MHQ, 20, 5] call Fun_CalcRandomRespawn;
Player setPosATL _RespawnPos;
 ["CLIENT INIT", "ADD RESPAWN VARIABLE"] call Fun_AddToLog;
 _RespawnInfo = [getPosATL  Player , ["Player", "", Player], -1, []];
uiNamespace setVariable ["Respawn", _RespawnInfo];
