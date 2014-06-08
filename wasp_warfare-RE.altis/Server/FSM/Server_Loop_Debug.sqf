  private[];
for "_i" from 0 to 1 step 0 do{
 sleep 90;
        if (Server_LoopWork) then  {
      Server_LoopWork  = false;
  ["LOOP DEBUG", "MAIN LOOP - WORK"] call Fun_AddToLog;
 } else {
      ["LOOP DEBUG", "MAIN LOOP - !ERROR!"] call Fun_AddToLog;
  ["LOOP DEBUG", "=================="] call Fun_AddToLog;
  ["LOOP DEBUG", format["Public_BuyTurn: %1", Public_BuyTurn]] call Fun_AddToLog;
  ["LOOP DEBUG", format["Server_BuyTurn: %1", Server_BuyTurn]] call Fun_AddToLog;
  ["LOOP DEBUG", format["Public_BuyTurnNumber: %1", Public_BuyTurnNumber]] call Fun_AddToLog;
  ["LOOP DEBUG", "=================="] call Fun_AddToLog;
  ["LOOP DEBUG", "CLEAR ERROR DATA"] call Fun_AddToLog;
      Public_BuyTurn   = [];
  Server_BuyTurn   = [];
  Public_BuyTurnNumber = [];
    ["LOOP DEBUG", "RESTART MAIN LOOP"] call Fun_AddToLog;
    [] spawn Compile preprocessFileLineNumbers "Server\FSM\Server_Loop.sqf";
 
};


};

