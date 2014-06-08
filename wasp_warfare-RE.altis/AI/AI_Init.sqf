private["_AI_TeamLeaders"];
AI_WEST     = [];
AI_EAST     = [];
AI_MaxUnits    = 4;
AI_Loop     = Compile preprocessFileLineNumbers "AI\AI_Loop.sqf";
AI_Task     = Compile preprocessFileLineNumbers "AI\AI_Task.sqf";
_AI_TeamLeaders   = if (isMultiplayer) then {
playableUnits} else {
switchableUnits
};

{
   private["_AI_Data"];
 _AI_Data = [_x, paramsArray select 3, ["notask"]];
 switch (side _x) do {
  case west  : {
AI_WEST set [count AI_WEST, _AI_Data]
};

  case east  : {
AI_EAST set [count AI_EAST, _AI_Data]
};

 
};

   _x addEventHandler ["Respawn",{
_this spawn EH_Respawn}];
   _x addEventHandler ["Killed",{
_this call EH_KilledUnit}];
     _x call DeleteNVG;
} forEach _AI_TeamLeaders;
{
 private["_MHQ", "_RespawnPos"];
 _MHQ  = if (side _x == west) then {
Public_MHQ_BF} else {
Public_MHQ_OF
};

 _RespawnPos = [getPosATL _MHQ, 20, 5] call Fun_CalcRandomRespawn;
 _x setPosATL _RespawnPos;
} forEach _AI_TeamLeaders;
west spawn AI_Loop;
east spawn AI_Loop;
