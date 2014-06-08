 if (isMultiplayer) then{
  private["_PCMachine", "_VariableName", "_Side", "_BroadCast", "_Error"];
 _PCMachine  = _this select 0;
     _VariableName = _this select 1;
     _Side   = side Player;
      _PlayerObj  = _this select 2;
     _BroadCast  = true;
        _Error   = [];
          if (!(typeName _PCMachine in ["STRING","OBJECT"])) then {
  _BroadCast = false;
 _Error set [count _Error, "PCMachine not String or Object Type"] 
};

 if (typeName _VariableName != "STRING") then {
  _BroadCast = false;
 _Error set [count _Error, "VariableName not StringType"] 
};

 if (typeName _PCMachine == "OBJECT") then {
  if (!isPlayer _PCMachine) then {
_BroadCast = false;
 _Error set [count _Error, "PCMachine Object not Player"]} 
};

 if (typeName _PCMachine == "STRING") then {
  if  (toLower _PCMachine != "server") then {
_BroadCast = false;
 _Error set [count _Error, "PCMachine String not ""Server"""]} 
};

     if (_BroadCast) then {
    Packet_Request = [_VariableName, _Side, Player];
  switch (typeName _PCMachine) do  {
   case "SCALAR" : {
 _PCMachine publicVariableClient "Packet_Request"
};

   case "OBJECT" : {
 owner (_PCMachine) publicVariableClient "Packet_Request"
};

   case "STRING" : {
 publicVariableServer "Packet_Request"
};

  
};

  diag_log format["BroadCast_Request From:[%1] To:[%2] Request:%3", Player, _PCMachine, _this];
 } else {
    diag_log format["Packet_Request Error:%1 From:[%2] Request:[%3]", _Error, Owner Player, _this];
 
};


};

