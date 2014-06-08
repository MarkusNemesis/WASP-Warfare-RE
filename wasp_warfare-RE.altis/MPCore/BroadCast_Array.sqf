      private["_VariableName", "_ArrayRow", "_Data", "_LocalVariable"];
 _VariableName = _this select 0;
     _ArrayRow  = _this select 1;
     _Data   = _this select 2;
       _LocalVariable = MissionNameSpace getVariable _VariableName;
 _LocalVariable  set [_ArrayRow, _Data];
 MissionNameSpace setVariable [_VariableName, _LocalVariable];
if (isMultiplayer) then{
   Packet_ArrayRow = [_VariableName, _ArrayRow, _Data];
   publicVariable "Packet_ArrayRow";
   diag_log format["Packet_ArrayRow For:[All] From:[%1] Data:[%2]",Owner Player, Packet_ArrayRow];

};

