   private["_EventHandlerName", "_KillerObject", "_EventHandlerData"];
_EventHandlerName = _this select 0;
   _KillerObject = _this select 1;
   _EventHandlerData = _this select 2;
     if (!isDedicated && !isServer) then {
  switch _EventHandlerName do {
  case ("Kill")    : {
         disableSerialization;
   private["_DeadBody", "_Price", "_DeadBodyEnemy", "_DeadBodyName", "_Text", "_KillerIsPlayer"];
   _DeadBody  = _EventHandlerData select 0;
      _Price   = _EventHandlerData select 1;
      _DeadBodyEnemy = _EventHandlerData select 2;
      _KillerIsPlayer = _EventHandlerData select 3;
      _DeadBodyName = getText (configFile >> "CfgVehicles" >> (typeOf _DeadBody) >> "displayName");
   _Temxt   = if (_DeadBodyEnemy) then {
"KILL"} else {
"TEAM KILL"
};

           [Player, 0, _Price] call SetPlayerSupplyMoney;
         if (_KillerIsPlayer) then {
_Price spawn HintMSG_KillPay
};

     ["", _DeadBodyName, _Price] spawn HintMSG_Pay;
       
};

 
};


};

 if (isMultiplayer) then{
   Packet_EventHandler = [ _EventHandlerName, _EventHandlerData];
   (owner _KillerObject) publicVariableClient "Packet_EventHandler";
     diag_log format["--EH-- %1 To:[%2] Data:[%3]", _EventHandlerName, _KillerObject, _EventHandlerData];

};

