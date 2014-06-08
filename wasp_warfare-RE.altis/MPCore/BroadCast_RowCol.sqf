      private["_VariableName", "_ArrayRow", "_Data", "_LocalVariable", "_ArrayColum", "_ArrayColum", "_AccessArray",   "_VarRowArray"];
 _VariableName = _this select 0;
     _ArrayRow  = _this select 1;
     _ArrayColum  = _this select 2;
     _AccessArray = _this select 3;
     _Data   = _this select 4;
       _LocalVariable = missionNamespace getVariable _VariableName;
 _VarRowArray = _LocalVariable select _ArrayRow;
 _VarRowArray set [_ArrayColum, _Data];
 _LocalVariable set [_ArrayRow, _VarRowArray];
 missionNamespace setVariable [_VariableName, _LocalVariable];
if (isMultiplayer) then{
   Packet_ArrayRowCol = [ _VariableName, _ArrayRow, _ArrayColum, _Data];
   {
  private["_PlayerObj", "_PlayerInGame", "_PlayerSide", "_Access"];
  _PlayerObj  = _x select 2;
  _PlayerInGame = _x select 3;
    _Access   = switch (side _PlayerObj) do   {
    case west   : {
_AccessArray select 0
};

    case east   : {
_AccessArray select 1
};

    case resistance  : {
_AccessArray select 2
};

   
};

      if ((isPlayer _PlayerObj) && _PlayerInGame && _Access) then {
    (owner _PlayerObj) publicVariableClient "Packet_ArrayRowCol";
    
};

 } forEach Public_PlayerList;
   if (!isDedicated) then {
  publicVariableServer "Packet_ArrayRowCol";
  
};

    diag_log format["Packet_ArrayRowCol From:[%1] Access:[%2] Data:[%3]", if (isDedicated) then {
"Server"} else {
name Player}, _AccessArray, Packet_ArrayRowCol];

};

 