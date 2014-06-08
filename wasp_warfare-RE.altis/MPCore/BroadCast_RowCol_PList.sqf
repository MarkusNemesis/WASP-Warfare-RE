      private["_VariableName", "_ArrayRow", "_Data", "_LocalVariable", "_ArrayColum", "_ArrayColum", "_AccessArray",   "_VarRowArray", "_ObjectList"];
 _VariableName = _this select 0;
     _ArrayRow  = _this select 1;
     _ArrayColum  = _this select 2;
     _ObjectList  = _this select 3;
     _Data   = _this select 4;
       _LocalVariable = missionNamespace getVariable _VariableName;
 _VarRowArray = _LocalVariable select _ArrayRow;
 _VarRowArray set [_ArrayColum, _Data];
 _LocalVariable set [_ArrayRow, _VarRowArray];
 missionNamespace setVariable [_VariableName, _LocalVariable];
if (isMultiplayer) then{
   Packet_ArrayRowCol = [ _VariableName, _ArrayRow, _ArrayColum, _Data];
   {
  private["_PlayerObj"];
  _PlayerObj  = _x;
     if (isPlayer _PlayerObj) then {
    (owner _PlayerObj) publicVariableClient "Packet_ArrayRowCol";
    
};

 } forEach _ObjectList;
   if (!isDedicated) then {
  publicVariableServer "Packet_ArrayRowCol";
  
};

    diag_log format["Packet_ArrayRowCol From:[%1] Access:[%2] Data:[%3]", if (isDedicated) then {
"Server"} else {
name Player}, nil, Packet_ArrayRowCol];

};

 