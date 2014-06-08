  disableSerialization;
 private["_Function", "_Question", "_GetFullCtrlData", "_StartUpgrade", "_MouseMove", "_Enter", "_Exit",  "_GetFullName"];
_Question = _this select 1;
   _GetFullCtrlData ={
 private["_Side","_SideNum","_Upgrades", "_PublicArray", "_UpgradesData", "_CtrlData", "_UpgradesIndex",   "_PublicIndex", "_UpgradesRun"];
 _Side   = side Player;
              _Upgrades  = if (side Player == west) then {
Public_UpgradesBF} else {
Public_UpgradesOF
};

  _UpgradesRun = _Upgrades select 0;
            _PublicArray = _Upgrades select 1;
            _UpgradesData = "All" call Compile preprocessFileLineNumbers "Data\Data_Upgrades.sqf";
  _UpgradesIndex = [];
                _PublicIndex = [];
                _CtrlData   =                 [  [1600, "B1"],  [1601, "B2"],  [1602, "B3"],  [1610, "WP1"],  [1611, "WP2"],  [1612, "WP3"],  [1613, "AT"],  [1614, "AA"],  [1620, "LF1"],  [1621, "LF2"],  [1622, "LF3"],  [1630, "HF1"],  [1631, "HF2"],  [1632, "HF3"],  [1640, "SP1"],  [1641, "SP2"],  [1642, "SP3"],  [1650, "AF1"],  [1651, "AF2"],  [1652, "AF3"] ];
   {
  _UpgradesIndex set [count(_UpgradesIndex), _x select 0];
 } forEach _UpgradesData;
   {
  _PublicIndex set [count(_PublicIndex), _x select 0];
 } forEach _PublicArray;
   {
  private ["_Name", "_Index", "_Data"];
  _Name  = _x select 1;
        _Index = _UpgradesIndex find _Name;
     _IndexP = _PublicIndex find _Name;
     _Data = [];
            if (_Index != -1) then  {
   private["_UpMustBe", "_Available", "_SupMon", "_Supply", "_Money", "_Enough"];
   _Bool   = (_PublicArray select _IndexP) select 1;
     _Data   = _UpgradesData select _Index;
        _Available = true;
              _Enough  = true;
              _UpMustBe = _Data select 5;
           _UpSupply = _Data select 2;
           _UpMoney = _Data select 3;
           _SupMon  = Player call GetPlayerSupplyMoney;
       _Supply  = _SupMon select 0;
           _Money  = _SupMon select 1;
                 {
    private["_BoolAvail", "_IndexMB"];
    _IndexMB  = _UpgradesIndex find _x;
    _BoolAvail  = (_PublicArray select _IndexMB) select 1;
    if (!_BoolAvail) then {
_Available = false
};

   } forEach _UpMustBe;
         _Enough = if ((_Supply >= _UpSupply) && (_Money >= _UpMoney)) then {
true} else {
false
};

      _Data set [1, _Bool];
   _CtrlData set [_forEachIndex, _Data +  [_x select 0, _Available, _Enough]];
  
};

 } forEach _CtrlData;
   _CtrlData = [_UpgradesRun, _CtrlData];
 _CtrlData
};

_GetFullName ={
    private["_NameArray", "_UpgradesData"];
 _NameArray  = _this select 0;
 _UpgradesData = _this select 1;
  if (count (_NameArray) > 0) then {
  {
   private["_Name", "_index"];
   _Name = _x;
   _index = _forEachIndex;
   {
    private["_x"];
    if (_Name == (_x select 0)) exitWith    {
     _NameArray set[_index, _x select 6];
    
};

   } forEach _UpgradesData;
  } forEach _NameArray;
 
};

   _NameArray
};

_onLoad ={
 uiNamespace setVariable ["WFDisplay_Upgrades", (_this select 0) select 0];
    ctrlShow [9000,false];
     waitUntil {
    private["_Display", "_result", "_Side", "_SideNum", "_Upgrades", "_UpgradesRun", "_FullData", "_Text",    "_AllUpgrades"];
  _Display  = uiNamespace getVariable "WFDisplay_Upgrades";
    _AllUpgrades = call _GetFullCtrlData;
         _UpgradesRun = _AllUpgrades select 0;
         _Upgrades  = _AllUpgrades select 1;
           _result   = false;
                      {
   private["_UpName", "_Updated", "_UpSupply", "_UpMoney", "_UpTime", "_UpMustBe", "_UpIDC", "_UpAvailable",     "_UpEnough", "_UpFullName", "_UpDescript"];
   _UpName   = _x select 0;
        _Updated  = _x select 1;
        _UpSupply  = _x select 2;
        _UpMoney  = _x select 3;
        _UpTime   = _x select 4;
        _UpMustBe  = _x select 5;
        _UpFullName  = _x select 6;
        _UpDescript  = _x select 7;
        _UpIDC   = _x select 8;
        _UpControl  = _Display displayCtrl _UpIDC;
    _UpAvailable = _x select 9;
        _UpEnough  = _x select 10;
                       _UpControl ctrlRemoveAllEventHandlers "MouseEnter";
    _UpControl ctrlRemoveAllEventHandlers "MouseExit";
    _UpControl ctrlRemoveAllEventHandlers "MouseMoving";
    _UpControl ctrlRemoveAllEventHandlers "MouseButtonDblClick";
       if (_UpName == _UpgradesRun) then      {
    _UpControl ctrlSetTextColor [1,1,0,1];
    _UpControl ctrlSetActiveColor [1,1,0,1];
   }   else   {
             _UpControl ctrlAddEventHandler ["MouseEnter","[_this, 'Enter'] spawn Compile preprocessFileLineNumbers 'GUI\GUI_WFUpgrades.sqf'"];
     _UpControl ctrlAddEventHandler ["MouseExit","[_this, 'Exit'] spawn Compile preprocessFileLineNumbers 'GUI\GUI_WFUpgrades.sqf'"];
     _UpControl ctrlAddEventHandler ["MouseMoving","[_this, 'MouseMove'] spawn Compile preprocessFileLineNumbers 'GUI\GUI_WFUpgrades.sqf'"];
                 if (_Updated) then         {
     _UpControl ctrlSetTextColor [0,0.7,0,1];
     _UpControl ctrlSetActiveColor [0,0.7,0,1];
    }    else        {
     if ((!_UpAvailable) || (!_UpEnough)) then           {
      _UpControl ctrlSetTextColor [0.6,0,0,1];
      _UpControl ctrlSetActiveColor [0.6,0,0,1];
     }     else          {
      _UpControl ctrlSetTextColor [0.2588, 0.7137, 1, 1];
      _UpControl ctrlSetActiveColor [1,0.5,0,1];
                  if (_UpgradesRun == "") then      {
        _UpControl ctrlAddEventHandler ["MouseButtonDblClick","[_this, 'Start'] spawn Compile preprocessFileLineNumbers 'GUI\GUI_WFUpgrades.sqf'"];
      
};

      
};

    
};

   
};

  } forEach _Upgrades;
      private["_SupMon", "_Supply", "_Money", "_Text"];
  _SupMon  = Player call GetPlayerSupplyMoney;
      _Supply  = _SupMon select 0;
          _Money  = _SupMon select 1;
           _Text = format["<t align='left' size='%1' color='#ff9100' >Supply: <t align='right'>%2</t></t>",0.95,_Supply] + "<br />" + format["<t align='left' size='%1' color='#00ff00' >Money: <t align='right'>%2</t></t>",0.95,_Money];
;
  (_Display displayCtrl 8000) ctrlSetStructuredText  parseText _Text;
       _Text = if (_UpgradesRun != "") then {
format["<t color='#ffff00'>Upgrading: %1</t>", _UpgradesRun]} else {
"<t color='#00ff00'>Can Upgrade</t>"
};

  (_Display displayCtrl 8001) ctrlSetStructuredText  parseText _Text;
    sleep 0.2;
  (isNull _Display) 
};


};

_MouseMove ={
 private["_Display", "_MouseX", "_MouseY"];
 _Display = uiNamespace getVariable "WFDisplay_Upgrades";
    _MouseX  = (_this select 0) select 1;
 _MouseY  = (_this select 0) select 2;
   _Width  = 0.17;
 _Height = 0.3;
 _NewPos = [_MouseX + 0.01, _MouseY + 0.01, _Width, _Height];
  (_Display displayCtrl 9000) ctrlSetBackgroundColor [0.2,0.2,0.2,0.9];
 (_Display displayCtrl 9000) ctrlSetPosition _NewPos;
 (_Display displayCtrl 9000) ctrlCommit 0.0001;

};

_Enter ={
 private["_Display", "_AllUpgrades", "_UpgradesRun", "_Upgrades", "_Control", "_Idc", "_UpName", "_Updated",   "_UpSupply", "_UpMoney", "_UpTime", "_UpMustBe", "_UpIDC", "_UpAvailable", "_UpEnough","_UpgradeData"];
 _Display  = uiNamespace getVariable "WFDisplay_Upgrades";
   _AllUpgrades = call _GetFullCtrlData;
        _UpgradesRun = _AllUpgrades select 0;
        _Upgrades  = _AllUpgrades select 1;
         _Control  = (_this select 0) select 0;
       _Idc   =  ctrlIDC _Control;
          _UpgradeData = [];
               {
  private["_UpIDC"];
  _UpIDC = _x select 8;
  if (_Idc == _UpIDC) exitWith {
_UpgradeData = _x
};

 } forEach _Upgrades;
  _UpName   = _UpgradeData select 0;
   _Updated  = _UpgradeData select 1;
   _UpSupply  = _UpgradeData select 2;
   _UpMoney  = _UpgradeData select 3;
   _UpTime   = _UpgradeData select 4;
   _UpMustBe  = _UpgradeData select 5;
   _UpFullName  = _UpgradeData select 6;
   _UpDescript  = _UpgradeData select 7;
   _UpIDC   = _UpgradeData select 8;
   _UpAvailable = _UpgradeData select 9;
   _UpEnough  = _UpgradeData select 10;
      private["_FormName", "_FormLine", "_Text"];
 _FontSize  = 0.8;
 _FormName  = format["<t align='center' color='#ffff00'>%2</t><br />",_FontSize, _UpFullName];
 _FormLine  = format["<t align='center'>-----------------------------</t><br />",_FontSize];
 _Text   = _FormName + _FormLine;
  if (!_Updated) then {
  private["_MustBeText", "_FormCost", "_FormTime", "_FormMustBe", "_FormEnough"];
    _UpMustBe  = [_UpMustBe, _Upgrades] call _GetFullName;
  _MustBeText = "";
  {
   _MustBeText = _MustBeText + format["%1<br />", _x];
  } forEach _UpMustBe;
   _FormCost  = format["<t align='left'>Cost:</t><t align='right'><t color='#ff9100'>%2</t>/<t color='#00ff00'>%3</t></t><br />",_FontSize, _UpSupply, _UpMoney];
  _FormTime  = format["<t align='left'>Time:</t><t align='right' color= '#ffffff'>%2</t><br />",_FontSize, _UpTime];
  _FormMustBe  = "";
  _FormEnough  = "";
  if (!_UpAvailable) then {
_FormMustBe = format["<t align='left'>Need Upgrade:</t><br /><t align='right' color='#ff0000'>%2</t><br />",_FontSize, _MustBeText]
};

  if (!_UpEnough) then {
_FormEnough = "<t align='left' color='#ff0000'>Can't Pay for this Upgrade<br />"
};

  _Text = _Text + _FormCost + _FormTime + _FormMustBe + _FormEnough;
 } else {
  _Text = _Text + "<br /><t align='Center' color='#00ff00'>UPGRADED</t><br />";
 
};

  _Text = "<t size='0.9' color='#88ffffff'>" + _Text + "</t>";
 (_Display displayCtrl 9000) ctrlSetStructuredText  parseText _Text;
   ctrlShow [9000, true];

};

_Exit ={
  ctrlShow [9000,false];

};

_StartUpgrade ={
 disableSerialization;
 private["_Display", "_AllUpgrades", "_UpgradesRun", "_Upgrades", "_Control", "_Idc", "_UpName", "_Updated",   "_UpSupply", "_UpMoney", "_UpTime", "_UpMustBe", "_UpIDC", "_UpAvailable", "_UpEnough","_UpgradeData",   "_Script", "_SendParameters"];
 _Display  = uiNamespace getVariable "WFDisplay_Upgrades";
   _AllUpgrades = call _GetFullCtrlData;
        _UpgradesRun = _AllUpgrades select 0;
        _Upgrades  = _AllUpgrades select 1;
         _Control  = (_this select 0) select 0;
       _Idc   =  ctrlIDC _Control;
          _UpgradeData = [];
               {
  private["_UpIDC"];
  _UpIDC = _x select 8;
  if (_Idc == _UpIDC) exitWith {
_UpgradeData = _x
};

 } forEach _Upgrades;
  _UpName   = _UpgradeData select 0;
   _Updated  = _UpgradeData select 1;
   _UpSupply  = _UpgradeData select 2;
   _UpMoney  = _UpgradeData select 3;
   _UpTime   = _UpgradeData select 4;
   _UpFullName  = _UpgradeData select 6;
    [Player, - _UpSupply, - _UpMoney] call SetPlayerSupplyMoney;
   _Control ctrlSetTextColor [1, 1, 0, 1];
 _Control ctrlSetActiveColor [1, 1, 0, 1];
    private["_Side", "_SideNum", "_UpgradeVar", "_Upgrades", "_UpgradesRun1", "_PublicArray", "_ServerCode"];
 _Side   = side Player;
         _Upgrades  = if (side Player == west) then {
Public_UpgradesBF} else {
Public_UpgradesOF
};

  _UpgradesRun1 = _Upgrades select 0;
       _PublicArray = _Upgrades select 1;
           [side Player, _UpName, _UpTime, _UpFullName] spawn Compile preprocessFileLineNumbers "Functions\RunUpgrade.sqf";
 
};

_Function = switch (_Question) do{
    case "onLoad"  : {
_onLoad
};

 case "MouseMove" : {
_MouseMove
};

 case "Enter"  : {
_Enter
};

 case "Exit"   : {
_Exit
};

 case "Start"  : {
_StartUpgrade
};


};

call _Function;
