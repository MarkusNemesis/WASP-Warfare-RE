 if (isMultiplayer) then{
  "Packet_ArrayRow" addPublicVariableEventHandler {
    private["_VariableName", "_ArrayRow", "_Data", "_Array"];
  _VariableName = _this select 1 select 0;
      _ArrayRow  = _this select 1 select 1;
      _Data   = _this select 1 select 2;
          _Array = missionNamespace getVariable _VariableName;
      if (typeName (_ArrayRow) == "STRING") then {
   if (toLower(_ArrayRow) == "end") then {
_Array set [count(_Array), _Data]}  
};

  if (typeName (_ArrayRow) == "SCALAR") then {
   _Array set [_ArrayRow, _Data]  
};

      missionNamespace setVariable [_VariableName, _Array];
         
};


};

