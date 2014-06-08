  private["_Display", "_Max"];
disableSerialization;
_Display  = uiNamespace getVariable "Display_Pay";
_Max   = 12;
if (!isNil "_Display") then {
if (typeName _Display == "DISPLAY") then {
if (isNull _Display) then {
_Display = nil}}
};

_FillPayTitle ={
 private["_Text"];
 _Display  = uiNamespace getVariable "Display_Pay";
 _CtrlText  = _Display DisplayCtrl 1100;
 _Text = "<t align='center' size='1'><br />";
   for "_i" from 1 to (_Max - (count Pay_Array))  step 1 do {
  _Text = _Text + "<br />";
 
};

   for "_i" from (count Pay_Array) to 0 step -1 do {
  private["_PayMSG", "_Image", "_Description", "_Pay", "_Plus", "_Color", "_Color2", "_MSG"];
  _PayMSG   = Pay_Array select _i;
      if (!isNil "_PayMSG") then {
   _Image   = _PayMSG select 0;
      _Description = _PayMSG select 1;
      _Pay   = _PayMSG select 2;
               _Color = if (_Pay >= 0) then {
"#d7ffd7"} else {
"#ffd7d7"
};

   _Color2 = if (_Pay >= 0) then {
"#98ff98"} else {
"#ffc0cb"
};

   _Plus = if (_Pay >= 0) then {
"+"} else {
"-"
};

      switch _Image do {
    case "Town"  : {
_Image = "";
 _Color = "#fde910"
};

    case "Camp"  : {
_Image = "";
 _Color = "#fde910"
};

    case "Payment" : {
_Image = "";
 _Color = "#fde910"
};

    default     {

};

   
};

      _Pay = format["<t align='right' color='%1'>%2 %3</t>", _Color2, _Plus, _Pay];
   _Image = if (_Image != "") then {
format["<img align='left' image=%1 />", _Image]} else {
""
};

   _MSG = format["%1<t align='left'>%2</t> %3", _Image, _Description, _Pay];
   _MSG = format["<t color='%1'>",_Color] + _MSG + "</t><br />";
           _Text = _Text + _MSG;
  
};

 
};

   _Text = _Text + "</t>";
   _CtrlText ctrlSetStructuredText parseText _Text;

};

if (count(Pay_Array) < _Max) then {
  Pay_Array set [count(Pay_Array), _this];
}else {
  Pay_Array set [0,-1];
 Pay_Array = Pay_Array - [-1];
      Pay_Array set [count(Pay_Array), _this];
 
};

if (isNil "_Display") then{
   6887 cutRsc ["MSG_Pay","PLAIN",0.5];
       [] call _FillPayTitle;
   [] spawn {
  sleep 40;
  6887 cutText ["","PLAIN",5];
  Pay_Array  = [];
  uiNamespace setVariable ["Display_Pay", nil];
 
};

}else{
      [] call _FillPayTitle;

};

