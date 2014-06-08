 if (isMultiplayer) then{
  "Packet_Data" addPublicVariableEventHandler {
    private["_VariableName", "_ArrayRow", "_Data", "_Array"];
  _VariableName = _this select 1 select 0;
      _Data   = _this select 1 select 1;
           missionNamespace setVariable [_VariableName, _Data];
       
};


};

