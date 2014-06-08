                           disableSerialization;
  Private ["_this", "_Display", "_MsgType", "_MsgParams", "_MsgMainText", "_MsgDescription", "_CtrlMain",   "_CtrlImage", "_CtrlDescrip", "_MsgShow", "_Image", "_Time", "_Sound"];
_MsgType   = _this select 0;
     _MsgMainText  = _this select 1;
     _MsgDescription  = _this select 2;
     _MsgParams   = [];
        _MsgShow   = [];
         _MsgParams = switch _MsgType do {
  case "Red"  : {
["#ff0000", "#ff0000", [1, 0, 0, 0.7]   , [0.2, 0.2, 0.2, 0.9],  [0.3, 0.3, 0.3, 0.9]]
};

 case "Green" : {
["#00ff00", "#00ff00", [0, 1, 0, 0.7]   , [0.2, 0.2, 0.2, 0.9],  [0.3, 0.3, 0.3, 0.9]]
};

  case "Blue"  : {
["#09a6f3", "#09a6f3", [0, 0, 1, 0.7]   , [0.2, 0.2, 0.2, 0.9],  [0.3, 0.3, 0.3, 0.9]]
};

 case "Yellow" : {
["#ffff00", "#ffff00", [1, 1, 0, 0.7]   , [0.2, 0.2, 0.2, 0.9],  [0.3, 0.3, 0.3, 0.9]]
};

 case "White" : {
["#ffffff", "#ffffff", [1, 1, 1, 0.7]   , [0.2, 0.2, 0.2, 0.9],  [0.3, 0.3, 0.3, 0.9]]
};

   default     {
["#09a6f3", "#ffffff", [0.2588, 0.7137, 1, 0.7] , [0.2, 0.2, 0.2, 0.9],  [0.3, 0.3, 0.3, 0.9]]
};

 
};

_MsgShow = switch (_this select 4) do{
 case 0  : {
[true, true, true]
};

 case 1  : {
[false, true, true]
};

 case 2  : {
[true, false, false]
};

 default    {
[false, true, true]
};


};

_Image = if ((_this select 3) != "") then {
_this select 3} else {
"a3\ui_f\data\gui\Rsc\RscDisplayInventory\gradient_gs.paa"
};

_Time = if ((_this select 5) != -1) then {
_this select 5} else {
7
};

_Sound = if ((_this select 6) != "") then {
_this select 6} else {
"HintComplete"
};

6885 cutRsc ["MSG_Complete","PLAIN",3];
     playSound _Sound;
          _Display   = MSG_CompleteDisplay select 0;
  _CtrlMain   = _Display DisplayCtrl 1000;
_CtrlImage   = _Display DisplayCtrl 1001;
 _CtrlDescrip  = _Display DisplayCtrl 1002;
_CtrlMain   ctrlShow (_MsgShow select 0);
_CtrlImage   ctrlShow (_MsgShow select 1);
_CtrlDescrip ctrlShow (_MsgShow select 2);
 _CtrlMain   ctrlSetBackgroundColor (_MsgParams select 3);
_CtrlImage   ctrlSetBackgroundColor (_MsgParams select 4);
_CtrlDescrip  ctrlSetBackgroundColor (_MsgParams select 4);
_CtrlImage  ctrlSetTextColor (_MsgParams select 2);
 _CtrlMain   ctrlSetStructuredText parseText format["<t color='%1'>%2</t>", _MsgParams select 0, _MsgMainText];
_CtrlDescrip  ctrlSetStructuredText parseText format["<t color='%1'>%2</t>", _MsgParams select 1, _MsgDescription];
_CtrlImage  ctrlSetText _Image;
(_Time) spawn{
 sleep _this;
 6885 cutText ["","PLAIN",2];

};

