private["_Display", "_Side", "_UpgradeArray", "_UpgradeRun"];
_Display  = uiNamespace getVariable "Display_MSG_Upgrade";
 _Side   = side PLayer;
          _UpgradeArray = switch _Side do {
          case west :{
+ Public_UpgradesBF
};

 case east :{
+ Public_UpgradesOF
};


};

_UpgradeRun  = if (typeName _UpgradeArray == "ARRAY") then {
_UpgradeArray select 0} else {
""
};

 if (!isNil "_Display") then {
if (typeName _Display == "DISPLAY") then {
if (isNull _Display) then {
_Display = nil}}
};

if (isNil "_Display") then{
  if (_UpgradeRun != "") then {
  private["_Display", "_CtrlText", "_Text", "_FullName"];
  6888 cutRsc ["MSG_Upgrade","PLAIN",0.5];
  _Display = uiNamespace getVariable "Display_MSG_Upgrade";
  _CtrlText = _Display DisplayCtrl 1100;
    _FullName = (_UpgradeRun call Get_Upgrade_Data) select 6;
    _Text  = format["<t align='right' color='#ffff00'>%1</t>", _FullName];
    _CtrlText ctrlSetStructuredText parseText _Text;
 
};

}else{
  if (_UpgradeRun == "") then {
  6888 cutText ["","PLAIN",0.5];
 
};

 
};

