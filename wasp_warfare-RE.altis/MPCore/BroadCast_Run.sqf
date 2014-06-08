 if (isMultiplayer) then{
  private["_PCMachine", "_Parameters", "_Code", "_PlayerObject", "_BroadCast", "_Error"];
 _PCMachine  = _this select 0;
 _Parameters  = (_this select 1) select 0;
 _Code   = (_this select 1) select 1;
 _PlayerObject = _this select 2;
 _BroadCast  = true;
 _Error   = [];
  if (typeName _Code != "CODE") then {
  _BroadCast = false;
 _Error set [count _Error, "NOT CODE TYPE"] 
};

   if (_BroadCast) then {
      Packet_Run = [[_Parameters, _Code], _PlayerObject];
  switch (typeName _PCMachine) do  {
   case "STRING" : {
         switch (toLower _PCMachine) do    {
     case "all"  : {
            publicVariable "Packet_Run";
            _Parameters spawn _Code;
           
};

     case "server" : {
publicVariableServer "Packet_Run"
};

     default     {
hint format ["WRONG MACHINE\nNOT 'SERVER' or 'ALL'"]
};

    
};

   
};

   case "OBJECT" : {
        if (isPlayer _PCMachine) then {
(owner _PCMachine) publicVariableClient "Packet_Run"}    else {

};

   
};

   case "SCALAR" : {
        _PCMachine publicVariableClient "Packet_Run"   
};

   case "SIDE"  : {
         {
     private["_PlayerObj", "_PlayerInGame", "_PlayerSide", "_Access"];
     _PlayerObj  = _x select 2;
     _PlayerInGame = _x select 3;
     _Access   = if ((side _PlayerObj) == _PCMachine) then {
true} else {
false
};

               if ((isPlayer _PlayerObj) && _PlayerInGame && _Access) then {
       (owner _PlayerObj) publicVariableClient "Packet_Run"      
};

    } forEach Public_PlayerList;
   
};

  
};

 
};

}else{
 private["_Parameters", "_Code"];
 _Parameters  = (_this select 1) select 0;
 _Code   = (_this select 1) select 1;
 _Parameters spawn _Code;

};

