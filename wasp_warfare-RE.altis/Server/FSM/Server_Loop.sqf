private["_EcoUpdate", "_LastUpdate", "_TownUpdate", "_GarbageUpdateM", "_GarbageUpdateD"];
_EcoUpdate  = time;
_LastUpdate  = time;
_TownUpdate  = time;
_GarbageUpdateM = time;
_GarbageUpdateD = time;
["Server_Loop.sqf", "Start Loop"] spawn Fun_AddToLog;
for "_i" from 0 to 1 step 0 do{
 if ((time - _LastUpdate) > 1) then {
    [] call ServerFSM_UpdateVote;
      ["Public_Time", round(diag_tickTime)] call Send_All_Data;
    _LastUpdate = time;
 
};

  if ((time - _TownUpdate) > 3) then  {
    [] call ServerFSM_UpdateCamps;
      [] call ServerFSM_UpdateTowns;
        _TownUpdate = time;
 
};

  if ((time - _EcoUpdate) > 60) then  {
     [] call ServerFSM_UpdateEconomy;
        [] call ServerFSM_GameOver;
        [] call ServerFSM_UpdateGroups;
      Server_LoopWork = true;
  _EcoUpdate = time;
 
};

 if ((time - _GarbageUpdateM) > Garbage_TimeMark) then {
    [] call ServerFSM_GarbageMark;
 
};

  if ((time - _GarbageUpdateD) > Garbage_TimeDelete) then {
    [] call ServerFSM_GarbageDelete;
 
};

   [] call ServerFSM_UpdateTurn;
 sleep 0.5;

};

