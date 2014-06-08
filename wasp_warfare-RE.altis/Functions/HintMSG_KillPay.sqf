 private["_Price", "_FillKillPayTitle", "_Display"];
disableSerialization;
_Display = uiNamespace getVariable "Display_KillPay";
_Price  = _this;
_FillKillPayTitle ={
 _Display = uiNamespace getVariable "Display_KillPay";
 _CtrlText = _Display DisplayCtrl 1100;
  _Text  = "<t align='center' size='1.3'><br />";
 {
  private["_Color", "_Plus"];
  _Color = if (_x >= 0) then {
"#d7ffd7"} else {
"#ffd7d7"
};

  _Plus = if (_x >= 0) then {
"+"} else {
""
};

  _Text = _Text + format["<br /><t color='%1'>%2%3</t>", _Color, _Plus, _x];
 } forEach KillPay_Array;
 _Text  = _Text + "</t>";
   _CtrlText ctrlSetStructuredText parseText _Text;

};

 if (count(KillPay_Array) < 5) then {
  KillPay_Array set [count(KillPay_Array), _Price];
}else {
  KillPay_Array set [0,-1];
 KillPay_Array = KillPay_Array - [-1];
      KillPay_Array set [count(KillPay_Array), _Price];
 
};

if (isNil "_Display") then{
   6890 cutRsc ["MSG_KillPay","PLAIN",0.5];
      [] call _FillKillPayTitle;
   [] spawn {
  sleep 2;
  6890 cutText ["","PLAIN",1];
  KillPay_Array  = [];
  uiNamespace setVariable ["Display_KillPay", nil];
 
};

}else{
     [] call _FillKillPayTitle;

};

