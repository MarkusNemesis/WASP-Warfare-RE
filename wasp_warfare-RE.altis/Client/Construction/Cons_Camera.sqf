  disableSerialization;
 private["_Display", "_CtrlLines", "_CtrlCross", "_CtrlNVG", "_CtrlBld", "_CtrlHelp", "_CtrlName", "_onLoad",  "_Function", "_Question", "_BuildInf"];
_Question = _this select 1;
_Display = uiNamespace getVariable "ConstructionDisplay";
_CtrlLines  = _Display displayCtrl 1001;
  _CtrlCross  = _Display displayCtrl 1011;
  _CtrlNVG  = _Display displayCtrl 1012;
  _CtrlBld  = _Display displayCtrl 1100;
  _CtrlHelp  = _Display displayCtrl 1101;
  _CtrlName  = _Display displayCtrl 1102;
  _onLoad ={
_HelpText = format["<t align='left' color='%1'>W,A,S,D</t><t align='right' color='%2'>Camera Move<\t><br />       <t align='left' color='%1'>Mouse</t><t align='right' color='%2'>Camera Direct</t><br />       <t align='left' color='%1'>N</t><t align='right' color='%2'>Night Vision</t><br />       <t align='left' color='%1'>1....9</t><t align='right' color='%2'>Building Select</t><br />       <t align='left' color='%1'>Q, E</t><t align='right' color='%2'>Building Rotate</t><br />       <t align='left' color='%1'>LMB</t><t align='right' color='%2'>Build Selected</t><br />       <t align='left' color='%1'>RMB</t><t align='right' color='%2'>Cancel Selected</t><br />       <t align='left' color='%1'>ESC</t><t align='right' color='%2'>Exit</t>",       "#ffff00", "#00ff00"];
_CtrlHelp ctrlSetStructuredText parseText _HelpText;
_CtrlName ctrlSetStructuredText parseText "<br /><t align='center' color='#00ff00'>CONSTRUCTION VIEW<\t>";
_BldText = format["<t align='left' color='%2' size='0.8'>       <br /><t align='left' color='%2' >Building</t><t align='right' color='%1'>0</t>       <br /><t align='left' color='%2' >Direction</t><t align='right' color='%1'>0</t>       <br /><t align='left' color='%2' >X</t><t align='right' color='%1'>0</t>       <br /><t align='left' color='%2' >Y</t><t align='right' color='%1'>0</t>       <br /><t align='left' color='%2' >Z</t><t align='right' color='%1'>0</t>       </t>","#ffff00", "#00ff00"];
_CtrlBld ctrlSetStructuredText parseText _BldText;

};

_BuildInf ={
   private["_Value", "_Bld", "_Dir", "_Pos"];
 _Value = _this select 0;
   _Bld = _Value select 0;
   _Dir = _Value select 1;
   _Pos = _Value select 2;
    _Dir = if (_Dir < 0) then {
360 + _Dir} else {
_Dir
};

    _BldText = format["<t size='0.8'>       <br /><t align='left' color='%2' >Building</t><t align='right' color='%1'>%3</t>       <br /><t align='left' color='%2' >Direction</t><t align='right' color='%1'>%4</t>       <br /><t align='left' color='%2' >X</t><t align='right' color='%1'>%5</t>       <br /><t align='left' color='%2' >Y</t><t align='right' color='%1'>%6</t>       <br /><t align='left' color='%2' >Z</t><t align='right' color='%1'>%7</t>       </t>","#ffff00", "#00ff00", _Bld, round(_Dir), round(_Pos select 0), round(_Pos select 1), round(_Pos select 2)];
 _CtrlBld ctrlSetStructuredText parseText _BldText;

};

_Function = switch (_Question) do{
    case "onLoad"   : {
_onLoad
};

 case "BuildInf"   : {
_BuildInf
};


};

call _Function;
