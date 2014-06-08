if (isMultiplayer) then{
 "Packet_Answer" addPublicVariableEventHandler {
           private["_VariableName", "_Side", "_Owner", "_Answer"];
  _VariableName = _this select 1 select 0;
      _Answer   = _this select 1 select 1;
            missionNamespace setVariable [_VariableName, _Answer];
        missionNamespace setVariable [format["Done_%1", _VariableName], true];
          
};


};

