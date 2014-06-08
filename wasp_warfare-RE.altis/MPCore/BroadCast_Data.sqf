   private["_VariableName", "_Data"];
 _VariableName = _this select 0;
     _Data   = _this select 1;
       MissionNameSpace setVariable [_VariableName, _Data];
if (isMultiplayer) then{
    Packet_Data = [_VariableName, _Data];
   publicVariable "Packet_Data";
   if (_VariableName != "Public_Time") then {
 diag_log format["Packet_Data For:[All] From:[%1] Data:[%2]",Owner Player, Packet_Data];
 
};


};

