disableSerialization;
private["_Display", "_SupMon", "_Supply", "_Money", "_TextMoney", "_TextSupply", "_TextFPS", "_CtrlMoney",  "_CtrlSupply", "_CtrlFPS", "_CtrlComImg", "_CtrlCom", "_CtrlTimImg", "_CtrlTime", "_TextTime",  "_TeamComInf", "_ComName", "_ComColor", "_ComImgColor","_TextCom", "_Payment", "_TextPMoney", "_TextPSupply"];
_Display = EcoDisplay select 0;
       _SupMon  = Player call GetPlayerSupplyMoney;
_Supply  = round (_SupMon select 0);
      _Money  = round (_SupMon select 1);
      _Payment = (Side Player) call Fun_CalculatePayment;
  _TeamComInf = ["Commander", Player] call GetPlayerInfo;
  if (count(_TeamComInf) == 0) then {
 _ComName  = "No Commander";
 _ComColor  = "#ffffff";
 _ComImgColor = [1, 1, 1, 1];
} else {
 _ComName  = _TeamComInf select 1;
 _ComColor  = "#ffff00";
 _ComImgColor = [1, 1, 0, 1];

};

_CtrlMoney = _Display DisplayCtrl 1000;
     _CtrlSupply = _Display DisplayCtrl 1001;
     _CtrlFPS = _Display DisplayCtrl 1002;
     _CtrlComImg = _Display DisplayCtrl 1003;
     _CtrlCom = _Display DisplayCtrl 1004;
     _CtrlTimImg = _Display DisplayCtrl 1005;
     _CtrlTime = _Display DisplayCtrl 1006;
     _CtrlComImg ctrlSetTextColor _ComImgColor;
_CtrlTimImg ctrlSetTextColor [0.2588, 0.7137, 1, 1];
_TextPMoney  = format["<br /><t size='1' align='right' color='#98ff98'>+ %1</t>",round(_Payment select 1)];
_TextPSupply = format["<br /><t size='1' align='right' color='#ffa500'>+ %1</t>",round(_Payment select 0)];
_TextMoney  = format["<t align='right' color='#00ff00'>$ <t color='#d7ffd7'>%1</t>%2", _Money, _TextPMoney];
_TextSupply  = format["<t align='right' color='#ff7d00'>S <t color='#ffcc9a'>%1</t>%2", _Supply, _TextPSupply];
_TextFPS = format["<t color='#09a6f3'>%1</t><t color='#215b7f'>(%2)</t>", round(diag_fps),round(diag_fpsmin)];
_TextTime = format["<t align='left' color='#09a6f3' size='1.1'>%1</t>", (time call Fun_NormalTimeFormat) select 3];
_TextCom = format["<t align='left' color='%1' size='1.1'>%2</t>", _ComColor, _ComName];
_CtrlMoney  ctrlSetStructuredText parseText (_TextMoney);
_CtrlSupply ctrlSetStructuredText parseText (_TextSupply);
_CtrlFPS  ctrlSetStructuredText parseText (_TextFPS);
_CtrlTime ctrlSetStructuredText parseText (_TextTime);
_CtrlCom ctrlSetStructuredText parseText (_TextCom);
