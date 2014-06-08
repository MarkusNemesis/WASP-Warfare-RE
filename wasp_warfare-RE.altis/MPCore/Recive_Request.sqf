if (isMultiplayer) then{
 "Packet_Request" addPublicVariableEventHandler {
           private["_VariableName", "_Side", "_Owner", "_Answer", "_Responder"];
  _VariableName = _this select 1 select 0;
      _Side   = _this select 1 select 1;
      _Owner   = owner ((_this select 1) select 2);
        _Answer = missionNamespace getVariable _VariableName;
      _Responder = if (isDedicated) then {
"Server"} else {
owner Player
};

      Packet_Answer = [_VariableName, _Answer];
  _Owner publicVariableClient "Packet_Answer";
      diag_log format["Packet_Answer From:[%1] To:[%2] Answer:[%3]", _Responder, _Owner, _VariableName];
 
};


};

