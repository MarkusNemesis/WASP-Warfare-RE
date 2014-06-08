if (isMultiplayer) then{
 "Packet_Run" addPublicVariableEventHandler {
           private["_Parameters", "_Code", "_Owner"];
  _Parameters  = _this select 1 select 0 select 0;
      _Code   = _this select 1 select 0 select 1;
      _Owner   = _this select 1 select 1;
            _Parameters spawn _Code;
      diag_log format["Recive_Run From:[%1] Code:%2",owner _Owner, [_Parameters, _Code]];
 
};


};

