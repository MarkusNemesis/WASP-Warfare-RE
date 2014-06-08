  private[];
for "_i" from 0 to 1 step 0 do{
 sleep 90;
        if (Server_LoopWork) then  {
      Server_LoopWork  = false;
  ["LOOP DEBUG", "MAIN LOOP - WORK"] spawn Fun_AddToLog;
 } else {
      ["LOOP DEBUG", "MAIN LOOP - !ERROR!"] spawn Fun_AddToLog;
  ["LOOP DEBUG", "=================="] spawn Fun_AddToLog;
  ["LOOP DEBUG", format["Public_BuyTurn: %1", Public_BuyTurn]] spawn Fun_AddToLog;
  ["LOOP DEBUG", format["Server_BuyTurn: %1", Server_BuyTurn]] spawn Fun_AddToLog;
  ["LOOP DEBUG", format["Public_BuyTurnNumber: %1", Public_BuyTurnNumber]] spawn Fun_AddToLog;
  ["LOOP DEBUG", "=================="] spawn Fun_AddToLog;
  ["LOOP DEBUG", "CLEAR ERROR DATA"] spawn Fun_AddToLog;
      Public_BuyTurn   = [];
  Server_BuyTurn   = [];
  Public_BuyTurnNumber = [];
    ["LOOP DEBUG", "RESTART MAIN LOOP"] spawn Fun_AddToLog;
    [] spawn Compile preprocessFileLineNumbers "Server\FSM\Server_Loop.sqf";
 
};


};

