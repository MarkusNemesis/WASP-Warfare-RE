disableSerialization;
private ["_FactoryTypeB", "_FactoryChoose", "_BuyList", "_Map", "_SpecialVehB", "_InfLabels", "_BuyButton", "_Question", "_Function", "_Display", "_Side", "_Factorys",   "_NearestBldObj", "_NearestCheck", "_NearestObj", "_Units", "_LVehicles", "_SpecHelpVeh", "_VehicleData", "_CurrentLevel"];
_Question  = _this select 1;
    _Side   = Side Player;
_FactoryTypeB = [1101, 1102, 1103, 1104, 1105, 1106];
_FactoryChoose = 1201;
_BuyList  = 1202;
_Map   = 1203;
_SpecialVehB = [1301, 1302, 1303, 1304];
_SpecHelpVeh = [1351, 1352, 1353, 1354];
    _InfLabels  = [1401, 1402, 1403, 1404, 1405];
  _BuyButton  = 1501;
_VehicleData = compile preprocessFileLineNumbers "Functions\Prepare_Vehicle_Data.sqf";
if(missionNamespace getVariable 'MP_TeamUpgrades' > 0)then {
 _CurrentLevel = 3;
}else {
 _CurrentLevel = 1;

};

_NearestBldObj  = [Side Player, Player] call Compile preprocessFileLineNumbers "Functions\Nearest_Buildings_Obj.sqf";
_NearestCheck = _NearestBldObj select 0;
_NearestObj  = _NearestBldObj select 1;
private ["_B", "_LF", "_HF", "_AF", "_CC", "_S", "_BF", "_TC", "_BW", "_ObjB", "_ObjLF", "_ObjHF", "_ObjAF", "_ObjCC", "_ObjS", "_ObjBF", "_ObjTC", "_ObjBW", "_i", "_BLFHFAFBFTC"];
_CC  = _NearestCheck select 0;
_B  = _NearestCheck select 1;
_LF  = _NearestCheck select 2;
_HF  = _NearestCheck select 3;
_AF  = _NearestCheck select 4;
_BF  = _NearestCheck select 5;
_S  = _NearestCheck select 6;
_TC  = _NearestCheck select 7;
_BW  = _NearestCheck select 8;
_ObjB = _NearestObj select 1;
_ObjLF = _NearestObj select 2;
_ObjHF = _NearestObj select 3;
_ObjAF = _NearestObj select 4;
_ObjBF = _NearestObj select 5;
_ObjTC = _NearestObj select 7;
private ["_onLoad", "_TypeB", "_UpdateSupMon", "_UpdateTurn", "_BuyForAllFType" ,"_AddFactoryBuy", "_TextResize"];
_TextResize = {
   private["_Text", "_TextArray", "_Length", "_SpacePos", "_NewText"];
 _Text  = _this select 0;
 _Length  = _this select 1;
 _TextArray  = toArray _Text;
  _SpacePos = -1;
 _NewText = [];
   if (count (_TextArray) > _Length) then   {
    for "_i" from 0 to (count (_TextArray) - 1) do  {
   _Symbol = _TextArray select _i;
   if ((_Symbol == 32) && (_i <= _Length)) then   {
    _SpacePos = _i;
   
};

  
};

    for "_i" from 0 to (_SpacePos) do  {
   _NewText set[_i, _TextArray select _i];
   
};

  _NewText  = toString _NewText;
 } else           {
  _NewText = _Text;
 
};

  _NewText
};

_AddFactoryBuy  ={
 private ["_AddFtype", "_AddBlds", "_AddVeh", "_AddFName"];
 _AddFtype = _this;
            _AddBlds = switch (_AddFtype) do         {
  case "B" : {
_ObjB
};

  case "LF" : {
_ObjLF
};

  case "HF" : {
_ObjHF
};

  case "AF" : {
_ObjAF
};

  case "BF" : {
_ObjBF
};

  case "TC" : {
_ObjTC
};

 
};

 _AddVeh  = [_Side, _AddFtype, _CurrentLevel] call _VehicleData;
   _AddFName = switch (_AddFtype) do {
  case "B" : {
"Barracks"
};

  case "LF" : {
"Light Factory"
};

  case "HF" : {
"Heavy Factory"
};

  case "AF" : {
"Air Factory"
};

  case "BF" : {
"Boat Factory"
};

  case "TC" : {
"Town Center"
};

 
};

  ((uiNamespace getVariable "WFDisplay_buyUnits") DisplayCtrl (_InfLabels select 4)) ctrlSetText _AddFtype;
  lbClear _FactoryChoose;
  {
  LbAdd [_FactoryChoose, format["%1 - %2m", _AddFName, round((_x select 3) distance Player)]];
 } forEach _AddBlds;
  lbSetCurSel [_FactoryChoose, 0];
  lnbClear  _BuyList;
   {
  private["_Text", "_Image", "_ImgClass"];
  _Text  = getText (configFile >>  "CfgVehicles" >> (_x select 1) >> "displayName");
  _Text  = [_Text, 40] call _TextResize;
  _Image  = if (_AddFName != "B") then {
getText (configFile >>  "CfgVehicles" >> (_x select 1) >> "picture")
};

     lnbAddRow   [_BuyList, [_x select 1,_Text, format["%1$",_x select 4]]];
  lnbSetColor  [_BuyList, [_forEachIndex, 2],[0,1,0,1]];
  if (_AddFName != "B") then {
lnbSetPicture  [_BuyList, [_forEachIndex, 1], _Image ]
};

 } forEach _AddVeh;

};

_UpdateSupMon ={
 _SupMon = Player call GetPlayerSupplyMoney;
 _SupplyText    = parseText format ["<t align='left' size='%1' color='#ff9100' >Supply: <t align='right'>%2</t></t>",1,_SupMon select 0];
 _MoneyText    = parseText format ["<t align='left' size='%1' color='#00ff00' >Money: <t align='right'>%2</t></t>",1,_SupMon select 1];
 ((uiNamespace getVariable "WFDisplay_buyUnits") DisplayCtrl (_InfLabels select 0)) ctrlSetStructuredText _SupplyText;
 ((uiNamespace getVariable "WFDisplay_buyUnits") DisplayCtrl (_InfLabels select 1)) ctrlSetStructuredText _MoneyText;

};

_UpdateTurn ={
 private ["_ChosenBld", "_Building", "_SelectNum", "_FType", "_CountTurn", "_Text"];
  _FType =  ctrlText (_InfLabels select 4);
  _SelectNum  = lbCurSel _BuyList;
 _ChosenBld = lbCurSel _FactoryChoose;
 _Building = switch (_FType) do {
  case "B" : {
_ObjB select _ChosenBld;

};

  case "LF" : {
_ObjLF select _ChosenBld;

};

  case "HF" : {
_ObjHF select _ChosenBld;

};

  case "AF" : {
_ObjAF select _ChosenBld;

};

  case "BF" : {
_ObjBF select _ChosenBld;

};

  case "TC" : {
_ObjTC select _ChosenBld;

};

 
};

 _CountTurn  = if (TypeName _Building != "ARRAY") then {
0} else {
(_Building select 1) call GUI_UpdateTurn
};

 _Text = parseText format ["<t align='left' size='%1'>Turn: <t align='right'>%2</t></t>",1,_CountTurn];
 ((uiNamespace getVariable "WFDisplay_buyUnits") DisplayCtrl (_InfLabels select 2)) ctrlSetStructuredText _Text;

};

_BuyForAllFType ={
 private ["_ChosenBld", "_Building", "_SelectNum", "_FType", "_Purchase", "_Vehicle", "_Vehicles", "_PaySupply", "_PayMoney", "_SpecBool"];
  _FType  = ctrlText (_InfLabels select 4);
 _SelectNum  = lbCurSel _BuyList;
 _ChosenBld = lbCurSel _FactoryChoose;
 _Building = switch (_FType) do {
  case "B" : {
_ObjB select _ChosenBld;

};

  case "LF" : {
_ObjLF select _ChosenBld;

};

  case "HF" : {
_ObjHF select _ChosenBld;

};

  case "AF" : {
_ObjAF select _ChosenBld;

};

  case "BF" : {
_ObjBF select _ChosenBld;

};

  case "TC" : {
_ObjTC select _ChosenBld;

};

 
};

  _Vehicles = [_Side, _FType, _CurrentLevel] call _VehicleData;
              _Vehicle = _Vehicles select _SelectNum;
   _PaySupply = _Vehicle select 3;
 _PayMoney = _Vehicle select 4;
 _SpecBool = ["", "", "", ""];
 {
  if ((ctrlText _x) == "1") then {
_SpecBool set [_forEachIndex, true]} else {
_SpecBool set [_forEachIndex, false]
};

 } forEach _SpecHelpVeh;
  _Purchase = [_FType, _Building, _Vehicle select 1, _Vehicle select 2, time,  _Vehicle select 5, {
}, Group Player, _SpecBool select 0, _SpecBool select 1, _SpecBool select 2, _SpecBool select 3];
  _Purchase call Compile preprocessFileLineNumbers "Functions\Add_Buy_Turn.sqf";
  [Player, 0, - _PayMoney] call SetPlayerSupplyMoney;
 
};

_onLoad ={
 private ["_Nearest", "_SupMon", "_SupplyText", "_MoneyText"];
  uiNamespace setVariable ['WFDisplay_buyUnits', (_this select 0) select 0];
   _Nearest = [_B, _LF, _HF, _AF, _BF, _TC];
 {
ctrlEnable [_x, _Nearest select  _forEachIndex]} forEach _FactoryTypeB;
    {
  private ["_SpecButCtr"];
  ctrlEnable [_x, false];
  _SpecButCtr = (uiNamespace getVariable "WFDisplay_buyUnits") DisplayCtrl _x;
  _SpecButCtr ctrlSetTextColor [-1, -1, -1, 0.75];
 } forEach _SpecialVehB;
 {
  ctrlSetText [_x, "0"];
 } forEach _SpecHelpVeh;
  call _UpdateSupMon;
  if(_B && !_LF && !_HF && !_AF)then {
  call _TypeB;
 
};

 if(!_B && _LF && !_HF && !_AF)then {
  call _TypeLF;
 
};

 if(!_B && !_LF && _HF && !_AF)then {
  call _TypeHF;
 
};

 if(!_B && !_LF && !_HF && _AF)then {
  call _TypeAF;
 
};

   waitUntil {
  sleep 0.2;
  ["Server", "Public_BuyTurnNumber"] call Send_Request;
  [] call _UpdateTurn;
  isNull ((_this select 0) select 0) 
};


};

_TypeB ={
  "B" call _AddFactoryBuy;
  call _UpdateSupMon;

};

_TypeLF ={
  "LF" call _AddFactoryBuy;
  call _UpdateSupMon
};

_TypeHF ={
 "HF" call _AddFactoryBuy;
  call _UpdateSupMon
};

_TypeAF ={
  "AF" call _AddFactoryBuy;
  call _UpdateSupMon
};

_TypeBF ={
 "BF" call _AddFactoryBuy;
  call _UpdateSupMon
};

_TypeTC ={
  "TC" call _AddFactoryBuy;
  call _UpdateSupMon
};

_SpecBChange ={
 private ["_SpecBut", "_SpecButCtr", "_SpecButHlp", "_Boolean"];
 _SpecBut = _this select 0;
 _SpecButCtr = (uiNamespace getVariable "WFDisplay_buyUnits") DisplayCtrl _SpecBut;
 _SpecButHlp = _SpecBut + 50;
  _Boolean = ctrlText _SpecButHlp;
 if (_Boolean == "0") then {
  ctrlSetText[_SpecButHlp, "1"];
  _SpecButCtr ctrlSetTextColor [0, 1, 0, 0.75];
 } else {
  ctrlSetText[_SpecButHlp, "0"];
  _SpecButCtr ctrlSetTextColor [1, 1, 1, 0.75];
 
};


};

_Select ={
 private ["_SelectNum", "_Information", "_Unit", "_TextSize", "_LastLBNumber", "_LBNumber", "_Vehicles"];
  _FType   =  ctrlText (_InfLabels select 4);
 _SelectNum   = (_this select 0) select 1;
 _Unit   = ([_Side, _FType, _CurrentLevel] call _VehicleData) select _SelectNum;
 _TextSize  = 0.8;
 _LastLBNumber = parseNumber (ctrlText 1252);
    _LBNumber  = (_this select 0) select 1;
    _Vehicles  = [_Side, _FType, _CurrentLevel] call _VehicleData;
   hint format["Last:%1 Now: %2", _LastLBNumber, _LBNumber];
  if (_FType != "B") then  {
  private ["_Vehicle", "_VehSpcArray"];
  _Vehicle  = _Vehicles select _SelectNum;
  _VehSpcArray = [_Vehicle select 6, _Vehicle select 7, _Vehicle select 8, true];
  {
   private["_SpecButCtr", "_Color"];
   _SpecButCtr = (uiNamespace getVariable "WFDisplay_buyUnits") DisplayCtrl _x;
   _Color   = if ( _VehSpcArray select _forEachIndex ) then {
[1, 1, 1, 0.75]} else {
[-1, -1, -1, 0.75]
};

   ctrlSetText[_x + 50, "0"];
           _SpecButCtr ctrlSetTextColor _Color;
        ctrlEnable [_x, _VehSpcArray select _forEachIndex];
           if (_x == 1304) then    {
    ctrlSetText[_x + 50, "1"];
            _SpecButCtr ctrlSetTextColor [0, 1, 0, 0.75];
      
};

  } forEach _SpecialVehB;
     } else {
    {
   private ["_SpecButCtr"];
   ctrlEnable [_x, false];
   _SpecButCtr = (uiNamespace getVariable "WFDisplay_buyUnits") DisplayCtrl _x;
   _SpecButCtr ctrlSetTextColor [-1, -1, -1, 0.75];
  } forEach _SpecialVehB;
 
};

  uiNamespace setVariable ["BuyUnits_VehicleInf", _Vehicles select _SelectNum];
    _Information = composeText [  parseText format ["<t align='left' size='%1'>Unit or Vehicle Information:</t>", _TextSize],  parseText format ["<br /><t align='left' size='%1'>Type: <t align='right'>%2</t></t>", _TextSize, getText (configFile >> 'CfgVehicles' >> (_Unit select 1) >> "displayName")],  parseText format ["<br /><t align='left' size='%1'>Cost: <t align='right' color='#ff9100'>%2 </t><t align='right' color='#00ff00'> %3</t></t>", _TextSize, _Unit select 3, _Unit select 4],  parseText format ["<br /><t align='left' size='%1'>Creating Time: <t align='right'>%2</t></t>", _TextSize, _Unit select 5] ];
 ((uiNamespace getVariable "WFDisplay_buyUnits") DisplayCtrl (_InfLabels select 3)) ctrlSetStructuredText  _Information;
     ctrlSetText [1252, str(_LBNumber)];
  call _UpdateSupMon;
  call _UpdateTurn;

};

_Buy ={
 private["_Money", "_Vehicle", "_Cost"];
 _Money  = (Player call GetPlayerSupplyMoney) select 1;
      _Vehicle = uiNamespace getVariable "BuyUnits_VehicleInf";
     _Cost  = if (!isNil "_Vehicle") then {
_Vehicle select 4} else {
100
};

   if (_Money >= _Cost) then {
  private["_UnitsInVeh"];
      if (count (units (player)) <  paramsArray select 0) then  {
  call _BuyForAllFType;
  call _UpdateSupMon;
  call _UpdateTurn;
  }  else  {
   hint parseText format ["<t align='center' color='#ff0000'>%1</t><br /><t align='center'></t>", toUpper  "You have Maximal Units"];
  
};

 } else {
  hint parseText format ["<t align='center' color='#ff0000'>%1</t><br /><t align='center'></t>", toUpper  "You do not have enough money"];
 
};


};

_Function = switch (_Question) do{
    case "onLoad"  : {
_onLoad
};

 case "B"   : {
_TypeB
};

 case "LF"   : {
_TypeLF
};

 case "HF"   : {
_TypeHF
};

 case "AF"   : {
_TypeAF
};

 case "BF"   : {
_TypeBF
};

 case "TC"   : {
_TypeTC
};

 case "Select"  : {
_Select
};

 case "BuySelected" : {
_Buy
};

 case "SpecBChange" : {
_SpecBChange
};


};

call _Function;
