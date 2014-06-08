setSystemOfUnits 0;
 enableSaving [false,false];
enableTeamSwitch false;
west setFriend [resistance, 0];
west setFriend [civilian, 1];
east setFriend [resistance, 0];
east setFriend [civilian, 1];
resistance setFriend [WEST, 0];
resistance setFriend [EAST, 0];
civilian setFriend [WEST, 1];
civilian setFriend [EAST, 1];
[] call Compile preprocessFileLineNumbers "Variables\Variable_Both_Global.sqf";
["init.sqf", "Add Global Variable for Both"] spawn Fun_AddToLog;
[] call Compile preprocessFileLineNumbers "Client\Construction\Cons_Init.sqf";
["init.sqf", "Initialization Construction Module"] spawn Fun_AddToLog;
[] call Compile preprocessFileLineNumbers "MPCore\Init_MPCore.sqf";
["init.sqf", "MultiPlayer Core Initialization"] spawn Fun_AddToLog;
[] Spawn {
 waitUntil {
time > 0
};

  setDate [(date select 0),(paramsArray select 4),(date select 2),(paramsArray select 4),(date select 4)];
  if (local player) then {
skipTime (time / 3600)
};

 sleep 2;

};

["init.sqf", "Parameters Init"] spawn Fun_AddToLog;
["init.sqf", "MISSION STARTED"] spawn Fun_AddToLog;
if (isMultiplayer) then{
    ["init.sqf", "MULTIPLAYER"] spawn Fun_AddToLog;
 if (isDedicated) then {
      ["init.sqf", "DEDICATED SERVER"] spawn Fun_AddToLog;
  if (isServer) then {
      ["init.sqf", "SERVER INIT"] spawn Fun_AddToLog;
  [] call Compile preprocessFileLineNumbers "Server\Server_Init.sqf";
 } else {
      waitUntil {
!isNull player
};

  if ((Name Player) != "__SERVER__") then   {
   ["init.sqf", format ["CLIENT INIT [%1]", name Player]] spawn Fun_AddToLog;
   12452 cutRsc ["Loading_Titles","BLACK",0];
   Player call Compile preprocessFileLineNumbers "Client\InitClient_MP.sqf";
  } 
};

}else{
      ["init.sqf", "NOT DEDICATED SERVER"] spawn Fun_AddToLog;
  if (isServer) then  {
         ["init.sqf", "SERVER INIT"] spawn Fun_AddToLog;
   [] call Compile preprocessFileLineNumbers "Server\Server_Init.sqf";
            waitUntil {
!isNull player
};

   if ((Name Player) != "__SERVER__") then    {
    ["init.sqf", format ["CLIENT INIT [%1]", name Player]] spawn Fun_AddToLog;
    12452 cutRsc ["Loading_Titles","BLACK",0];
    Player call Compile preprocessFileLineNumbers "Client\InitClient_MP.sqf";
   }  }  else  {
         waitUntil {
!isNull player
};

   if ((Name Player) != "__SERVER__") then    {
    ["init.sqf", format ["CLIENT INIT [%1]", name Player]] spawn Fun_AddToLog;
    12452 cutRsc ["Loading_Titles","BLACK",0];
    Player call Compile preprocessFileLineNumbers "Client\InitClient_MP.sqf";
   }  
};

 
};

}else{
   ["init.sqf", format["LOCAL GAME [%1]", name Player]] spawn Fun_AddToLog;
 12452 cutRsc ["Loading_Titles","BLACK",0];
 [] call Compile preprocessFileLineNumbers "Server\Server_init.sqf";
 Player call Compile preprocessFileLineNumbers "Client\InitClient_LO.sqf";
 
};

