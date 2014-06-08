   private["_Side", "_AITLArray"];
_Side  = _this;
     _AITLArray = switch (_Side) do {
   case west  : {
AI_WEST
};

 case east  : {
AI_EAST
};


};

for "_i" from 0 to 1 step 0 do{
  for "_j" from 0 to ((count _AITLArray) -1)  step 1 do {
  private["_AITLData", "_AITLObj"];
  _AITLData = _AITLArray select _j;
      _AITLObj = _AITLData select 0;
            if (!isPlayer _AITLObj) then {
   _AITLData call AI_Task;
  
};

 
};

    sleep 30;

};

 