private["_this", "_Key", "_Shift", "_Ctrl", "_Alt", "_MouseX", "_MouseY", "_MouseZ", "_MouseB", "_KeysText", "_KB",  "_MM", "_MZ", "_MB"];
_KB = false;
 _MM = false;
 _MZ = false;
 _MB = false;
_Key = -1;
 _Shift = false;
 _Ctrl = false;
 _Alt = false;
 _MouseX = 0;
 _MouseY = 0;
 _MouseZ = 0;
 _MouseB = -1;
  switch (_this) do{
  case "KB": {
_KB = true
};

    case "MM": {
_MM = true
};

    case "MZ": {
_MZ = true
};

    case "MB": {
_MB = true
};

  
};

   _Key   = if (count (Control_KeyPress) > 0) then {
(Control_KeyPress select 1) select 1
};

_Shift   = if (count (Control_KeyPress) > 0) then {
(Control_KeyPress select 1) select 2
};

_Ctrl   = if (count (Control_KeyPress) > 0) then {
(Control_KeyPress select 1) select 3
};

_Alt   = if (count (Control_KeyPress) > 0) then {
(Control_KeyPress select 1) select 4
};

 _MouseX  = if (count (Control_MouseMove) > 0) then {
(Control_MouseMove select 1) select 1
};

_MouseY  = if (count (Control_MouseMove) > 0) then {
(Control_MouseMove select 1) select 2
};

_MouseZ  = if (count (Control_MouseZChange) > 0) then {
(Control_MouseZChange select 1) select 1
};

_MouseB  = if (count (Control_MousePress) > 0) then {
(Control_MousePress select 1) select 1
};

if (_KB && _Key == 22) then {
closeDialog 0;
 createDialog "WF_Menu"
};

