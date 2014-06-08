 if (isMultiplayer) then{
  "Packet_ArrayRowCol" addPublicVariableEventHandler {
    private["_VariableName", "_ArrayRow", "_ArrayColum", "_Data", "_LocalVariable", "_VarRowArray"];
  _VariableName = _this select 1 select 0;
      _ArrayRow  = _this select 1 select 1;
      _ArrayColum  = _this select 1 select 2;
      _Data   = _this select 1 select 3;
          _LocalVariable = missionNamespace getVariable _VariableName;
  _VarRowArray = _LocalVariable select _ArrayRow;
        _VarRowArray set [_ArrayColum, _Data];
  _LocalVariable set [_ArrayRow, _VarRowArray];
      missionNamespace setVariable [_VariableName, _LocalVariable];
         
};


};

