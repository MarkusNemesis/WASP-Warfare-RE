private ["_this", "_Function", "_Question", "_SetImage", "_onLoad", "_ComboSelect", "_GetCfgName", "_StuffSelect",   "_UpdateItemSlots", "_FillWeaponSlots", "_UpdateProgressBar", "_UpdateShopList", "_ShopSelect", "_UpdateUnitList",   "_TextResize", "_MouseMove", "_TakeItemType", "_DropSlotScript", "_DBClick", "_Buy", "_Close"];
 disableSerialization;
_Question = _this select 1;
_TextResize = {
 private["_Text", "_TextArray", "_Length", "_SpacePos", "_NewText"];
 _Text  = _this;
 _TextArray  = toArray _Text;
  _Length  = 20;
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

_GetCfgName ={
 private["_this", "_CfgName"];
  _CfgName = switch (true) do  {
  case (isClass (configFile >> "CfgGlasses" >> _this)) : {
"CfgGlasses"
};

  case (isClass (configFile >> "cfgVehicles" >> _this)) : {
"cfgVehicles"
};

  case (isClass (configFile >> "CfgWeapons" >> _this)) : {
"CfgWeapons"
};

  case (isClass (configFile >> "CfgMagazines" >> _this)) : {
"CfgMagazines"
};

 
};

 _CfgName
};

_SetImage ={
 private["_this", "_Filled", "_Idc", "_Type", "_Image", "_EmptyImage"];
  _Path  = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\";
 _Idc  = _this select 0;
 _Type  = _this select 1;
 _Filled  = if (_Type != "") then {
true} else {
false
};

 _EmptyImage = switch (true) do  {
  case (_idc == 4101)  : {
"ui_gear_uniform_gs"
};

  case (_idc == 4102)  : {
"ui_gear_vest_gs"
};

  case (_idc == 4103)  : {
"ui_gear_backpack_gs"
};

  case (_idc == 4201)  : {
"ui_gear_binocular_gs"
};

  case (_idc == 4202)  : {
"ui_gear_nvg_gs"
};

  case (_idc == 4203)  : {
"ui_gear_glasses_gs"
};

  case (_idc == 4204)  : {
"ui_gear_helmet_gs"
};

  case (_idc == 4205)  : {
"ui_gear_map_gs"
};

  case (_idc == 4206)  : {
"ui_gear_gps_gs"
};

  case (_idc == 4207)  : {
"ui_gear_radio_gs"
};

  case (_idc == 4208)  : {
"ui_gear_compass_gs"
};

  case (_idc == 4209)  : {
"ui_gear_watch_gs"
};

  case (_idc == 5101)  : {
"ui_gear_primary_gs"
};

  case (_idc == 5201)  : {
"ui_gear_secondary_gs"
};

  case (_idc == 5301)  : {
"ui_gear_hgun_gs"
};

  case ((_idc == 5102) || (_idc == 5202) || (_idc == 5302))  : {
"ui_gear_muzzle_gs"
};

  case ((_idc == 5103) || (_idc == 5203) || (_idc == 5303))  : {
"ui_gear_side_gs"
};

  case ((_idc == 5104) || (_idc == 5204) || (_idc == 5304))  : {
"ui_gear_top_gs"
};

  case ((_idc == 5105) || (_idc == 5205) || (_idc == 5305))  : {
"ui_gear_magazine_gs"
};

 
};

  _Image = if (_Filled) then {
getText (configFile >> (_Type call _GetCfgName) >> _Type >> "picture")}    else {
format["%1%2.paa", _Path, _EmptyImage]
};

 _Type = if (_Type != "") then {
_Type} else {
""
};

  lnbClear _idc;
  lnbAddRow [_idc,[_Type,""]];
 lnbSetPicture [_Idc, [0, 1], _Image];

};

_SummItemsInStorage ={
 private["_this", "_GearList", "_StuffList"];
 _GearList = _this;
 _StuffList = [];
 {
  private["_StuffFound"];
  _StuffFound = false;
   if ((count _StuffList) > 0) then  {
   for "_i" from 0 to (count (_StuffList) - 1) do   {
    private["_StuffItem"];
    _StuffItem = _StuffList select _i;
    if (_x == (_StuffItem select 0)) then    {
     _StuffItem set [1, (_StuffItem select 1) + 1];
     _StuffList set [_i, _StuffItem];
     _StuffFound = true;
    
};

   
};

   if (!_StuffFound) then {
_StuffList set[count _StuffList, [_x, 1]]
};

  }  else  {
   _StuffList set[count _StuffList, [_x, 1]];
  
};

 } forEach _GearList;
 _StuffList
};

_FillWeaponSlots ={
 private["_this","_Idc", "_GearArray", "_Muzzel", "_Laser", "_Optics", "_Magazine"];
 _Idc  = _this select 0;
 _GearArray = _this select 1;
 _Muzzel  = (_GearArray select 1) select 0;
 _Laser  = (_GearArray select 1) select 1;
 _Optics  = (_GearArray select 1) select 2;
 _Magazine = if (count(_GearArray select 2) > 0) then {
(_GearArray select 2) select 0} else {
""
};

    [_Idc  , _GearArray select 0] call _SetImage;
 [_Idc + 1 , _Muzzel] call _SetImage;
 [_Idc + 2 , _Laser] call _SetImage;
 [_Idc + 3 , _Optics] call _SetImage;
 [_Idc + 4 , _Magazine] call _SetImage;
   
};

_UpdateItemSlots ={
 private["_Display", "_result", "_Equpment", "_Prime", "_Second", "_HandGun", "_Uniform", "_Vest", "_BackPack", "_Helmet",   "_Goggles", "_BasicItem", "_Storage"];
    _Display = uiNamespace getVariable "WFDisplay_GearMenu";
 _Equipment = uiNamespace getVariable "Equipment";
 _Storage = uiNamespace getVariable "WF_Gear_StorageSelected";
   _Prime  = _Equipment select 0;
   _Second  = _Equipment select 1;
   _HandGun = _Equipment select 2;
   _Uniform = _Equipment select 3;
   _Vest  = _Equipment select 4;
   _BackPack = _Equipment select 5;
    _Helmet  = _Equipment select 6;
       _Goggles = _Equipment select 7;
        _BasicItem = _Equipment select 8;
       [5101, _Prime] call _FillWeaponSlots;
 [5201, _Second] call _FillWeaponSlots;
  [5301, _HandGun] call _FillWeaponSlots;
     private["_Bin", "_NVG", "_BinArray", "_NVGArray"];
 _Bin   = "";
 _NVG   = "";
 _BinArray = ["Binocular", "Rangefinder", "Laserdesignator"];
 _NVGArray = ["NVGoggles", "NVGoggles_OPFOR", "NVGoggles_INDEP"];
   {
  if (_x in _BasicItem) then {
_Bin = _x
};

 } forEach _BinArray;
 [4201, _Bin] call _SetImage;
   {
  if (_x in _BasicItem) then {
_NVG = _x
};

 } forEach _NVGArray;
 [4202, _NVG] call _SetImage;
   if ( "ItemMap"   in _BasicItem) then {
[4205, "ItemMap"] call _SetImage} else {
[4205, ""] call _SetImage
};

 if ( "ItemGPS"   in _BasicItem) then {
[4206, "ItemGPS"] call _SetImage} else {
[4206, ""] call _SetImage
};

 if ( "ItemRadio"  in _BasicItem) then {
[4207, "ItemRadio"] call _SetImage} else {
[4207, ""] call _SetImage
};

 if ( "ItemCompass"  in _BasicItem) then {
[4208, "ItemCompass"] call _SetImage} else {
[4208, ""] call _SetImage
};

 if ( "ItemWatch"  in _BasicItem) then {
[4209, "ItemWatch"] call _SetImage} else {
[4209, ""] call _SetImage
};

   [4101, _Uniform select 0] call _SetImage;
  [4102, _Vest select 0] call _SetImage;
  [4103, _BackPack select 0] call _SetImage;
    [4204, _Helmet] call _SetImage;
  [4203, _Goggles] call _SetImage;

};

_UpdateProgressBar ={
 private["_Display", "_Equipment", "_Uniform", "_Vest", "_BackPack"];
 _Display = uiNamespace getVariable "WFDisplay_GearMenu";
 _Equipment = uiNamespace getVariable "Equipment";
  _Uniform = _Equipment select 3;
   _Vest  = _Equipment select 4;
   _BackPack = _Equipment select 5;
     (_Display displayCtrl 2300) progressSetPosition (_Equipment select 9);
   (_Display displayCtrl 2301) progressSetPosition (_Uniform select 2);
  (_Display displayCtrl 2302) progressSetPosition (_Vest select 2);
  (_Display displayCtrl 2303) progressSetPosition (_BackPack select 2);

};

_UpdateShopList ={
 private["_this", "_ShopGears"];
  _ShopGears = _this;
   lbClear 1510;
          {
  private["_ItemType", "_Text", "_Image"];
   _ItemType  = _x select 0;
  _Text  = getText (configFile >> (_ItemType call _GetCfgName) >> _ItemType >> "displayName");
  _Image  = getText (configFile >> (_ItemType call _GetCfgName) >> _ItemType >> "picture");
  lnbAddRow [1510,[_ItemType,_Text,format["%1$", _x select 1]]];
  lnbSetPicture [1510, [_forEachIndex, 1], _Image ];
  lnbSetColor [1510,[_forEachIndex, 2],[0,1,0,1]];
     } forEach _ShopGears;

};

_UpdateUnitList ={
 private["_GearList", "_Display", "_Equipment", "_Storage", "_StuffList", "_SumGearList"];
 _Display = uiNamespace getVariable "WFDisplay_GearMenu";
 _Equipment = uiNamespace getVariable "Equipment";
 _Storage = uiNamespace getVariable "WF_Gear_StorageSelected";
  _Uniform = _Equipment select 3;
   _Vest  = _Equipment select 4;
   _BackPack = _Equipment select 5;
    _GearList  = switch _Storage do {
  case 4101 : {
_Uniform select 1
};

  case 4102 : {
_Vest select 1
};

  case 4103 : {
_BackPack select 1
};

 
};

   _SumGearList = _GearList call _SummItemsInStorage;
     lbClear 1511;
   {
  private["_ItemType", "_Text"];
   _ItemType  = _x select 0;
  _Text  = getText (configFile >> (_ItemType call _GetCfgName) >> _ItemType >> "displayName");
  _Text  = _Text call _TextResize;
   lnbAddRow [1511,[_ItemType, format["%1",_Text],format["%1",_x select 1]]];
  lnbSetPicture [1511, [_forEachIndex, 1], getText (configFile >> (_ItemType call _GetCfgName) >> _ItemType >> "picture")]  } forEach _SumGearList;

};

_UpdateCostMoney ={
 private["_this", "_Cost", "_Display","_Control", "_Text", "_Color"];
 _Cost   = _this;
 _Display  = uiNamespace getVariable "WFDisplay_GearMenu";
 _Control  = _Display displayCtrl 1100;
       _Money   = (Player call GetPlayerSupplyMoney) select 1;
 _Color   = if (_Cost <= 0) then {
"#3caa3c"} else {
"#c41e3a"
};

   if (_Money < _Cost) then {
ctrlEnable [2401, false]} else {
ctrlEnable [2401, true]
};

  _Text = parseText format["<t align='left'>Cost: <t color ='%1'>%2$</t></t><t align='right'>Money: <t color='#3caa3c'>%3$</t></t>", _Color, _Cost, _Money];
 _Control ctrlSetStructuredText _Text;

};

_TakeItemType ={
 private["_this", "_ItemType", "_GearType"];
 _ItemType = _this;
 _GearsArray = ["Primary", "Secondary", "HandGun", "Ammunition", "Muzzles", "Optics", "Acc", "Uniform", "Vest",       "Backpack", "Glasses", "Helmet", "Item", "Ammo"];
 _GearType = "";
 {
  private["_Gear", "_NewGear"];
  _Gear  = ["All", _x] call Compile preprocessFileLineNumbers "Functions\Prepare_Gear_Data.sqf";
  _NewGear = [];
      for "_i" from 0 to (count (_Gear) - 1) do  {
   _NewGear = _NewGear + [(_Gear select _i) select 0];
  
};

      if (_ItemType in _NewGear) exitWith {
_GearType = _x
};

 } forEach _GearsArray;
  if (_GearType == "Item") then {
  _GearType = switch (_ItemType) do   {
      case "Binocular"   : {
"Binocular"
};

   case "Rangefinder"   : {
"Binocular"
};

   case "Laserdesignator"  : {
"Binocular"
};

      case "NVGoggles"   : {
"NVGoggles"
};

   case "NVGoggles_OPFOR"  : {
"NVGoggles"
};

   case "NVGoggles_INDEP"  : {
"NVGoggles"
};

      case "ItemMap"    : {
"ItemMap"
};

   case "ItemGPS"    : {
"ItemGPS"
};

   case "ItemRadio"   : {
"ItemRadio"
};

   case "ItemCompass"   : {
"ItemCompass"
};

   case "ItemWatch"   : {
"ItemWatch"
};

  
};

 
};

   _GearType
};

_AddToSellingList ={
 private["_this", "_PreSell", "_PreBuy", "_SellList", "_GearsArray", "_Cost"];
 _PreSell = _this select 0;
         _PreBuy  = _this select 1;
         _SellList = uiNamespace getVariable "Sell_List";
    _GearsArray = ["Primary", "Secondary", "HandGun", "Ammunition", "Muzzles", "Optics", "Acc", "Uniform", "Vest",       "Backpack", "Glasses", "Helmet", "Item", "Ammo"];
 _Cost  = 0;
  {
  private["_Gears", "_NewGear"];
  _Gears  = ["All", _x] call Compile preprocessFileLineNumbers "Functions\Prepare_Gear_Data.sqf";
  _NewGear = [];
        for "_i" from 0 to (count (_Gears) - 1) do  {
   _NewGear = _NewGear + [(_Gears select _i) select 0];
  
};

      for "_i" from 0 to (count (_PreSell) - 1) do  {
   private["_ArrayIndex", "_Item", "_GearItem", "_GearType", "_GearCost"];
   _ArrayIndex = -1;
          _Item  = _PreSell select _i;
      _GearItem = [];
             _ArrayIndex = _NewGear find _Item;
      if (_ArrayIndex != -1) then   {
    _GearItem = _Gears select _ArrayIndex;
    _GearType = _GearItem select 0;
       _GearCost = _GearItem select 1;
               _SellList set [count(_SellList), [_GearType, - (_GearCost * 0.5)]];
   
};

  
};

      for "_i" from 0 to (count (_PreBuy) - 1) do  {
   private["_ArrayIndex", "_Item", "_GearItem", "_GearType", "_GearCost"];
   _ArrayIndex = -1;
          _Item  = _PreBuy select _i;
      _GearItem = [];
             _ArrayIndex = _NewGear find _Item;
      if (_ArrayIndex != -1) then   {
    _GearItem = _Gears select _ArrayIndex;
    _GearType = _GearItem select 0;
       _GearCost = _GearItem select 1;
               _SellList set [count(_SellList), [_GearType, _GearCost]];
   
};

  
};

 } forEach _GearsArray;
   uiNamespace setVariable ["Sell_List", _SellList];
    {
_Cost = _Cost + (_x select 1)} forEach _SellList;
  _Cost call _UpdateCostMoney;

};

_DragSlotScript ={
    private["_this", "_DragSlot", "_Item", "_ItemType", "_Equipment", "_Prime", "_Second", "_HandGun", "_Uniform",   "_Vest", "_BackPack", "_Helmet", "_Goggles", "_BasicItem", "_PreBuy"];
  _DragSlot = _this select 0;
    _Item  = _this select 1;
    _ItemType = _this select 2;
    _Equipment = _this select 3;
    _PreSell = _this select 4;
    _PreBuy  = [];
          _Prime  = _Equipment select 0;
   _Second  = _Equipment select 1;
   _HandGun = _Equipment select 2;
   _Uniform = _Equipment select 3;
   _Vest  = _Equipment select 4;
   _BackPack = _Equipment select 5;
    _Helmet  = _Equipment select 6;
       _Goggles = _Equipment select 7;
        _BasicItem = _Equipment select 8;
     switch (_DragSlot) do  {
      case 4101  : {
      _Uniform = ["", [], 0];
  
};

         case 4102  : {
      _Vest = ["", [], 0];
  
};

         case 4103  : {
      _BackPack = ["", [], 0];
  
};

         case 4201  : {
      {
    if (_x == _Item) exitWith {
_BasicItem set [_forEachIndex, ""]
};

   } forEach _BasicItem;
  
};

         case 4202  : {
       {
    if (_x == _Item) exitWith {
_BasicItem set [_forEachIndex, ""]
};

   } forEach _BasicItem;
  
};

         case 4203  : {
      _Goggles = "";
  
};

         case 4204  : {
      _Helmet = "";
  
};

         case 4205  : {
       {
    if (_x == _Item) exitWith {
_BasicItem set [_forEachIndex, ""]
};

   } forEach _BasicItem;
  
};

         case 4206  : {
       {
    if (_x == _Item) exitWith {
_BasicItem set [_forEachIndex, ""]
};

   } forEach _BasicItem;
  
};

      case 4207  : {
       {
    if (_x == _Item) exitWith {
_BasicItem set [_forEachIndex, ""]
};

   } forEach _BasicItem;
  
};

         case 4208  : {
       {
    if (_x == _Item) exitWith {
_BasicItem set [_forEachIndex, ""]
};

   } forEach _BasicItem;
     
};

      case 4209  : {
       {
    if (_x == _Item) exitWith {
_BasicItem set [_forEachIndex, ""]
};

   } forEach _BasicItem;
     
};

         case 5101  : {
       _Prime = ["", [], []];
  
};

         case 5201  : {
       _Second = ["", [], []];
  
};

         case 5301  : {
       _HandGun = ["", [], []];
  
};

         case 5102  : {
   private["_WeaponItems"];
       _WeaponItems = ["", (_Prime select 1) select 1, (_Prime select 1) select 2];
   _Prime set[1, _WeaponItems];
  
};

         case 5202  : {
   private["_WeaponItems"];
       _WeaponItems = ["", (_Second select 1) select 1, (_Second select 1) select 2];
   _Second set[1, _WeaponItems];
  
};

         case 5302  : {
    private["_WeaponItems"];
       _WeaponItems = ["", (_HandGun select 1) select 1, (_HandGun select 1) select 2];
   _HandGun set[1, _WeaponItems];
  
};

         case 5103  : {
    private["_WeaponItems"];
       _WeaponItems = [(_Prime select 1) select 0, "", (_Prime select 1) select 2];
   _Prime set[1, _WeaponItems];
  
};

         case 5203  : {
    private["_WeaponItems"];
       _WeaponItems = [(_Second select 1) select 0, "", (_Second select 1) select 2];
   _Second set[1, _WeaponItems];
  
};

         case 5303  : {
   private["_WeaponItems"];
       _WeaponItems = [(_HandGun select 1) select 0, "", (_HandGun select 1) select 2];
   _HandGun set[1, _WeaponItems];
  
};

         case 5104  : {
    private["_WeaponItems"];
       _WeaponItems = [(_Prime select 1) select 0, (_Prime select 1) select 1, ""];
   _Prime set[1, _WeaponItems];
  
};

           case 5204  : {
   private["_WeaponItems"];
       _WeaponItems = [(_Second select 1) select 0, (_Second select 1) select 1, ""];
   _Second set[1, _WeaponItems];
  
};

         case 5304 : {
    private["_WeaponItems"];
       _WeaponItems = [(_HandGun select 1) select 0, (_HandGun select 1) select 1, ""];
   _HandGun set[1, _WeaponItems];
  
};

         case 5105  : {
      _Prime set[2, []];
  
};

         case 5205  : {
       _Second set[2, []];
  
};

      case 5305  : {
       _HandGun set[2, []];
  
};

        case 1511  : {
   private["_Storage", "_StorageSel", "_EquipNum", "_Type", "_Stuff", "_Load"];
   _StorageSel = uiNamespace getVariable "WF_Gear_StorageSelected";
   _EquipNum  = switch _StorageSel do   {
    case 4101 : {
3
};

    case 4102 : {
4
};

    case 4103 : {
5
};

   
};

         _Storage = _Equipment select _EquipNum;
     _Type  = _Storage select 0;
       _Stuff  = _Storage select 1;
       _Load  = _Storage select 2;
          {
    if (_x == _Item) exitWith     {
     _Stuff set[_forEachIndex, -1];
     _Stuff = _Stuff - [-1];
    
};

   } forEach _Stuff;
      switch _StorageSel do   {
    case 4101 : {
_Uniform  = [_Type, _Stuff, _Load]
};

    case 4102 : {
_Vest  = [_Type, _Stuff, _Load]
};

    case 4103 : {
_BackPack = [_Type, _Stuff, _Load]
};

   
};

  
};

        case 1510  : {
   _PreBuy = [_Item];
  
};

 
};

    _Equipment = [_Prime, _Second, _HandGun, _Uniform, _Vest, _BackPack, _Helmet, _Goggles, _BasicItem, _Equipment select 9];
  _result  = [_Equipment, _PreBuy, _PreSell];
 _result
};

_DropSlotScript ={
    private["_this", "_Idc", "_SlotType","_Equipment", "_Prime", "_Second", "_HandGun", "_Uniform", "_Vest", "_BackPack",    "_Helmet", "_Goggles", "_BasicItem", "_Item", "_ItemType", "_SellList", "_SlotChange", "_DragSlot",   "_SelectedNum", "_UnitsArray", "_Unit"];
 _Idc  = _this select 0;
    _Item  = _this select 1;
    _ItemType = _this select 2;
    _DragSlot = _this select 3;
    _SlotChange = false;
   _SellList = uiNamespace getVariable "Sell_List";
    _PreSell = [];
             _Equipment = uiNamespace getVariable "Equipment";
    _Prime  = _Equipment select 0;
   _Second  = _Equipment select 1;
   _HandGun = _Equipment select 2;
   _Uniform = _Equipment select 3;
   _Vest  = _Equipment select 4;
   _BackPack = _Equipment select 5;
    _Helmet  = _Equipment select 6;
       _Goggles = _Equipment select 7;
        _BasicItem = _Equipment select 8;
     _SelectedNum = lbCurSel 2100;
 _UnitsArray  = units Player;
   _Unit   = _UnitsArray select _SelectedNum;
  switch (true) do  {
       case (_idc == 4101)  : {
   private["_CanBe"];
   _CanBe = ["Uniform"];
            if (_ItemType in _CanBe) then    {
        _SlotChange = true;
            _PreSell = _PreSell + [_Uniform select 0] + (_Uniform select 1);
        _Uniform = [_Item, [], -1];
   
};

   
};

         case (_idc == 4102)  : {
    private["_CanBe"];
   _CanBe = ["Vest"];
            if (_ItemType in _CanBe) then    {
        _SlotChange = true;
            _PreSell = _PreSell + [_Vest select 0] + (_Vest select 1);
        _Vest = [_Item, [], -1];
   
};

  
};

         case (_idc == 4103)  : {
    private["_CanBe"];
   _CanBe = ["Backpack"];
         if (_ItemType in _CanBe) then    {
        _SlotChange = true;
            _PreSell = _PreSell + [_BackPack select 0] + (_BackPack select 1);
        _BackPack = [_Item, [], -1];
   
};

  
};

        case (_idc == 4201)  : {
   private["_CanBe","_Num"];
   _CanBe = ["Binocular", "Rangefinder", "Laserdesignator"];
      _Num = -1;
        if (_Item in _CanBe) then    {
    {
     if (_x in _CanBe)  exitWith {
_Num = _forEachIndex
};

    } forEach _BasicItem;
            _SlotChange = true;
    if (_Num != -1) then    {
          _PreSell = _PreSell + [_BasicItem select _Num];
          _BasicItem set [_Num, _Item];
     }    else    {
     _BasicItem set [count (_BasicItem), _Item];
    
};

   
};

  
};

        case (_idc == 4202)  : {
   private["_CanBe","_Num"];
   _CanBe = ["NVGoggles", "NVGoggles_OPFOR", "NVGoggles_INDEP"];
      _Num = -1;
        if (_Item in _CanBe) then    {
    {
     if (_x in _CanBe)  exitWith {
_Num = _forEachIndex
};

    } forEach _BasicItem;
            _SlotChange = true;
    if (_Num != -1) then    {
          _PreSell = _PreSell + [_BasicItem select _Num];
          _BasicItem set [_Num, _Item];
     }    else    {
     _BasicItem set [count (_BasicItem), _Item];
    
};

   
};

  
};

        case (_idc == 4203)  : {
    private["_CanBe"];
   _CanBe = ["Glasses"];
         if (_ItemType in _CanBe) then    {
        _SlotChange = true;
            _PreSell = _PreSell + [_Goggles];
        _Goggles = _Item;
   
};

  
};

        case (_idc == 4204)  : {
   private["_CanBe"];
   _CanBe = ["Helmet"];
          if (_ItemType in _CanBe) then    {
        _SlotChange = true;
            _PreSell = _PreSell + [_Helmet];
        _Helmet = _Item;
   
};

  
};

        case (_idc == 4205)  : {
   private["_CanBe","_Num"];
   _CanBe = ["ItemMap"];
      _Num = -1;
        if (_Item in _CanBe) then    {
    {
     if (_x in _CanBe)  exitWith {
_Num = _forEachIndex
};

    } forEach _BasicItem;
            _SlotChange = true;
    if (_Num != -1) then    {
          _PreSell = _PreSell + [_BasicItem select _Num];
          _BasicItem set [_Num, _Item];
     }    else    {
     _BasicItem set [count (_BasicItem), _Item];
    
};

   
};

  
};

        case (_idc == 4206)  : {
   private["_CanBe","_Num"];
   _CanBe = ["ItemGPS"];
      _Num = -1;
        if (_Item in _CanBe) then    {
    {
     if (_x in _CanBe)  exitWith {
_Num = _forEachIndex
};

    } forEach _BasicItem;
            _SlotChange = true;
    if (_Num != -1) then    {
          _PreSell = _PreSell + [_BasicItem select _Num];
          _BasicItem set [_Num, _Item];
     }    else    {
     _BasicItem set [count (_BasicItem), _Item];
    
};

   
};

  
};

          case (_idc == 4207)  : {
   private["_CanBe","_Num"];
   _CanBe = ["ItemRadio"];
      _Num = -1;
        if (_Item in _CanBe) then    {
    {
     if (_x in _CanBe)  exitWith {
_Num = _forEachIndex
};

    } forEach _BasicItem;
            _SlotChange = true;
    if (_Num != -1) then    {
          _PreSell = _PreSell + [_BasicItem select _Num];
          _BasicItem set [_Num, _Item];
     }    else    {
     _BasicItem set [count (_BasicItem), _Item];
    
};

   
};

  
};

        case (_idc == 4208)  : {
   private["_CanBe","_Num"];
   _CanBe = ["ItemCompass"];
      _Num = -1;
        if (_Item in _CanBe) then    {
    {
     if (_x in _CanBe)  exitWith {
_Num = _forEachIndex
};

    } forEach _BasicItem;
            _SlotChange = true;
    if (_Num != -1) then    {
          _PreSell = _PreSell + [_BasicItem select _Num];
          _BasicItem set [_Num, _Item];
     }    else    {
     _BasicItem set [count (_BasicItem), _Item];
    
};

   
};

  
};

        case (_idc == 4209)  : {
   private["_CanBe","_Num"];
   _CanBe = ["ItemWatch"];
      _Num = -1;
        if (_Item in _CanBe) then    {
    {
     if (_x in _CanBe)  exitWith {
_Num = _forEachIndex
};

    } forEach _BasicItem;
            _SlotChange = true;
    if (_Num != -1) then    {
          _PreSell = _PreSell + [_BasicItem select _Num];
          _BasicItem set [_Num, _Item];
     }    else    {
     _BasicItem set [count (_BasicItem), _Item];
    
};

   
};

  
};

        case (_idc == 5101)  : {
   private["_CanBe"];
   _CanBe = ["Primary"];
           if (_ItemType in _CanBe) then    {
        _SlotChange = true;
            _PreSell = _PreSell + [_Prime select 0];
        _Prime set[ 0, _Item];
   
};

  
};

        case (_idc == 5201)  : {
   private["_CanBe"];
   _CanBe = ["Secondary"];
         if (_ItemType in _CanBe) then    {
        _SlotChange = true;
            _PreSell = _PreSell + [_Second select 0];
        _Second set[ 0, _Item];
   
};

  
};

        case (_idc == 5301)  : {
   private["_CanBe"];
   _CanBe = ["HandGun"];
          if (_ItemType in _CanBe) then    {
        _SlotChange = true;
            _PreSell = _PreSell + [_HandGun select 0];
        _HandGun set[ 0, _Item];
   
};

  
};

        case (_idc == 5102)  : {
   private["_CanBe"];
   _CanBe = getArray (configFile >> "CfgWeapons" >> (_Prime select 0) >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleitems");
         if (_Item in _CanBe) then    {
    private ["_Primeitems"];
                    _SlotChange = true;
            _PreSell = _PreSell + [(_Prime select 1) select 0];
        _Primeitems = [_Item, (_Prime select 1) select 1, (_Prime select 1) select 2];
    _Prime set[ 1, _Primeitems];
           
};

  
};

        case (_idc == 5202)  : {
   private["_CanBe"];
   _CanBe = getArray (configFile >> "CfgWeapons" >> (_Second select 0) >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleitems");
         if (_Item in _CanBe) then    {
    private ["_Seconditems"];
                    _SlotChange = true;
            _PreSell = _PreSell + [(_Second select 1) select 0];
        _Seconditems = [_Item, (_Second select 1) select 1, (_Second select 1) select 2];
    _Second set[ 1, _Seconditems];
           }   else   {
    hint format["YOU CAN'T PUT\n""%1""\n HERE", getText (configFile >> (_Item call _GetCfgName) >> _Item >> "DisplayName")];
   
};

  
};

        case (_idc == 5302)  : {
   private["_CanBe"];
   _CanBe = getArray (configFile >> "CfgWeapons" >> (_HandGun select 0) >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleitems");
               if (_Item in _CanBe) then    {
    private ["_HandGunitems"];
            _SlotChange = true;
            _PreSell = _PreSell + [(_HandGun select 1) select 0];
        _HandGunitems = [_Item, (_HandGun select 1) select 1, (_HandGun select 1) select 2];
    _HandGun set[ 1, _HandGunitems];
   }   else   {
    hint format["YOU CAN'T PUT\n""%1""\n ON THIS SLOT", getText (configFile >> (_Item call _GetCfgName) >> _Item >> "DisplayName")];
   
};

  
};

        case (_idc == 5103)  : {
   private["_CanBe"];
   _CanBe = ["Acc"];
          if (_ItemType in _CanBe) then    {
    private ["_Primeitems"];
        _SlotChange = true;
        _PreSell = _PreSell + [(_Prime select 1) select 1];
        _Primeitems = [(_Prime select 1) select 0, _Item,  (_Prime select 1) select 2];
    _Prime set[ 1, _Primeitems];
   }   else   {
    hint format["YOU CAN'T PUT\n""%1""\n ON THIS SLOT", getText (configFile >> (_Item call _GetCfgName) >> _Item >> "DisplayName")];
   
};

  
};

        case (_idc == 5203)  : {
   private[];
   hint format["Secondary Weapon\n can't have\n IR Pointer and FlashLight"];
  
};

        case (_idc == 5303)  : {
   private[];
   hint format["HandGun Weapon\n can't have\n IR Pointer and FlashLight"];
  
};

        case (_idc == 5104)  : {
   private["_CanBe"];
   _CanBe = ["Optics"];
          if (_ItemType in _CanBe) then    {
    private ["_Primeitems"];
        _SlotChange = true;
        _PreSell = _PreSell + [(_Prime select 1) select 2];
        _Primeitems = [(_Prime select 1) select 0, (_Prime select 1) select 1, _Item];
    _Prime set[ 1, _Primeitems];
   }   else   {
    hint format["YOU CAN'T PUT\n""%1""\n ON THIS SLOT", getText (configFile >> (_Item call _GetCfgName) >> _Item >> "DisplayName")];
   
};

  
};

        case (_idc == 5204)  : {
   private[];
   hint format["Secondary Weapon\n can't have\n Optics"];
  
};

                      case (_idc == 5304)  : {
   private["_CanBe", "_HgPlusO"];
   _CanBe  = ["hgun_Pistol_heavy_01_Foptic_MRD", "hgun_Pistol_heavy_02_Foptic_Yorris"];
      _HgPlusO = (_HandGun select 0) + _Item;
      if (_HgPlusO in _CanBe) then    {
    private ["_HandGunitems"];
        _SlotChange = true;
        _PreSell = _PreSell + [(_HandGun select 1) select 2];
        _HandGunitems = [(_HandGun select 1) select 0, (_HandGun select 1) select 1, _Item];
    _HandGun set[ 1, _HandGunitems];
   }   else   {
    hint format["YOU CAN'T PUT\n""%1""\n ON THIS SLOT", getText (configFile >> (_Item call _GetCfgName) >> _Item >> "DisplayName")];
   
};

  
};

        case (_idc == 5105)  : {
   private["_CanBe"];
   _CanBe = getArray (configFile >> "CfgWeapons" >> (_Prime select 0) >> "magazines");
            if (_Item in _CanBe) then    {
        _SlotChange = true;
        _PreSell = _PreSell + (_Prime select 2);
        _Prime set[ 2, [_Item]];
   }   else   {
    hint format["YOU CAN'T PUT\n""%1""\n ON THIS SLOT", getText (configFile >> (_Item call _GetCfgName) >> _Item >> "DisplayName")];
   
};

  
};

        case (_idc == 5205)  : {
   private["_CanBe"];
   _CanBe = getArray (configFile >> "CfgWeapons" >> (_Second select 0) >> "magazines");
            if (_Item in _CanBe) then    {
        _SlotChange = true;
        _PreSell = _PreSell + (_Second select 2);
        _Second set[ 2, [_Item]];
   }   else   {
    hint format["YOU CAN'T PUT\n""%1""\n ON THIS SLOT", getText (configFile >> (_Item call _GetCfgName) >> _Item >> "DisplayName")];
   
};

  
};

        case (_idc == 5305)  : {
   private["_CanBe"];
   _CanBe = getArray (configFile >> "CfgWeapons" >> (_HandGun select 0) >> "magazines");
            if (_Item in _CanBe) then    {
        _SlotChange = true;
        _PreSell = _PreSell + (_HandGun select 2);
        _HandGun set[ 2, [_Item]];
   }   else   {
    hint format["YOU CAN'T PUT\n""%1""\n ON THIS SLOT", getText (configFile >> (_Item call _GetCfgName) >> _Item >> "DisplayName")];
   
};

  
};

        case (_idc == 1511)  : {
   private["_Storage", "_StorageSel", "_EquipNum", "_Type", "_Stuff", "_Load", "_CantBe", "_CanDropItem"];
   _StorageSel = uiNamespace getVariable "WF_Gear_StorageSelected";
   _EquipNum  = switch _StorageSel do   {
    case 4101 : {
3
};

    case 4102 : {
4
};

    case 4103 : {
5
};

   
};

         _Storage = _Equipment select _EquipNum;
     _Type  = _Storage select 0;
       _Stuff  = _Storage select 1;
       _Load  = _Storage select 2;
          _CanDropItem = switch _StorageSel do   {
    case 4101 : {
_Unit canAddItemToUniform _Item
};

    case 4102 : {
_Unit canAddItemToVest _Item
};

    case 4103 : {
_Unit canAddItemToBackPack _Item
};

   
};

         hint format["CanDrop: %1", _CanDropItem];
       _CantBe  = ["Uniform", "Vest", "Backpack"];
   if ((_CanDropItem) && !(_ItemType in _CantBe)) then   {
    _Stuff set[count(_Stuff), _Item];
       switch _StorageSel do    {
     case 4101 : {
_Uniform  = [_Type, _Stuff, loadUniform _Unit]
};

     case 4102 : {
_Vest  = [_Type, _Stuff, loadVest _Unit]
};

     case 4103 : {
_BackPack = [_Type, _Stuff, loadBackpack _Unit]
};

    
};

            _SlotChange = true;
    
};

  
};

        case (_idc == 1510)  : {
      _PreSell = _PreSell + [_Item];
   switch (_DragSlot) do   {
    case 4101 : {
_PreSell = _PreSell + (_Uniform select 1)
};

    case 4102 : {
_PreSell = _PreSell + (_Vest select 1)
};

    case 4103 : {
_PreSell = _PreSell + (_BackPack select 1)
};

     case 5101 : {
_PreSell = _PreSell + (_Prime select 1) + (_Prime select 2)
};

        case 5201 : {
_PreSell = _PreSell + (_Second select 1) + (_Second select 2)
};

    case 5301 : {
_PreSell = _PreSell + (_HandGun select 1) + (_HandGun select 2)
};

   
};

      _SlotChange = true;
  
};

 
};

   if (_SlotChange) then {
  private["_Result", "_PreBuy"];
    _Equipment = [_Prime, _Second, _HandGun, _Uniform, _Vest, _BackPack, _Helmet, _Goggles, _BasicItem, _Equipment select 9];
      _Result  = [_DragSlot, _Item, _ItemType, _Equipment, _PreSell] call _DragSlotScript;
  _Equipment = _Result select 0;
  _PreBuy  = _Result select 1;
  _PreSell = _Result select 2;
      [_PreSell, _PreBuy] call _AddToSellingList;
      [_Unit, _Equipment] call SetEquipment;
  uiNamespace setVariable ["Equipment", _Unit call GetEquipment];
      [] call _UpdateItemSlots;
    [] call _UpdateProgressBar;
    [] call _UpdateUnitList;
 
};


};

_onLoad ={
 private["_GearData"];
  uiNamespace setVariable ["WFDisplay_GearMenu" , (_this select 0) select 0];
    uiNamespace setVariable ["Equipment"   , Player call GetEquipment];
 uiNamespace setVariable ["Equipment_BackUp"  , Player call GetEquipment];
 uiNamespace setVariable ["Sell_List"   , []];
     uiNamespace setVariable ["WF_Gear_StorageSelected", 4101];
   ctrlShow [1015, false];
 ctrlShow [1016, false];
 ctrlShow [1017, false];
  ctrlShow [2402, false];
 ctrlShow [9001, false];
 ctrlShow [9002, false];
    _UnitsArray = units Player;
   lbClear 2100;
      {
   lbAdd [2100, Format["[%1] %2", _ForEachIndex + 1, name _x]];
  } forEach _UnitsArray;
  lbSetCurSel [2100, 0];
    [] call _UpdateItemSlots;
   [] call _UpdateProgressBar;
   _GearData = [ side Player, "Primary"] call Compile preprocessFileLineNumbers "Functions\Prepare_Gear_Data.sqf";
 _GearData call _UpdateShopList;
   [] call _UpdateUnitList;
   0 call _UpdateCostMoney;

};

_ComboSelect ={
 private["_SelectedNum", "_UnitsArray", "_Unit"];
  _SelectedNum = lbCurSel 2100;
 _UnitsArray  = units Player;
   _Unit   = _UnitsArray select _SelectedNum;
  uiNamespace setVariable ["Equipment"   , _Unit call GetEquipment];
 uiNamespace setVariable ["Equipment_BackUp"  , _Unit call GetEquipment];
   [] call _UpdateItemSlots;
   [] call _UpdateProgressBar;
   [] call _UpdateUnitList;

};

_StorageSelect ={
 private["_IdcClick", "_Display", "_StorageArray"];
  _Display  = uiNamespace getVariable "WFDisplay_GearMenu";
 _IdcClick  = _this select 0;
  _StorageArray = [4051, 4052, 4053];
   {
  (_Display displayCtrl _x) ctrlSetTextColor [1, 1, 1, 0.25];
 } forEach _StorageArray;
   (_Display displayCtrl _IdcClick) ctrlSetTextColor [1, 1, 1, 0.7];
   uiNamespace setVariable ["WF_Gear_StorageSelected", _IdcClick + 50];
   [] call _UpdateUnitList;

};

_ShopSelect ={
 private["_ItemType", "_GearData", "_GearDataScript"];
 _ItemType  = _this select 2;
 _GearData  = [];
 _GearDataScript = Compile preprocessFileLineNumbers "Functions\Prepare_Gear_Data.sqf";
 Switch _ItemType do {
  case "Primary"  : {
_GearData = [side Player, "Primary"] call _GearDataScript
};

  case "Secondary" : {
_GearData = [side Player, "Secondary"] call _GearDataScript
};

  case "Handgun"  : {
_GearData = [side Player, "HandGun"] call _GearDataScript
};

  case "Accessories" : {
_GearData = ([side Player, "Muzzles"] call _GearDataScript)+             ([side Player, "Optics"] call _GearDataScript)+             ([side Player, "Acc"] call _GearDataScript)
};

  case "Ammunition" : {
_GearData = [side Player, "Ammunition"] call _GearDataScript
};

  case "Equipment" : {
_GearData = ([side Player, "Uniform"] call _GearDataScript)+             ([side Player, "Vest"] call _GearDataScript)+             ([side Player, "Backpack"] call _GearDataScript)
};

  case "HeadItem"  : {
_GearData = ([side Player, "Helmet"] call _GearDataScript)+             ([side Player, "Glasses"] call _GearDataScript)+             ([side Player, "Item"] call _GearDataScript)
};

  case "Ammo"   : {
_GearData = [side Player, "Ammo"] call _GearDataScript
};

  case "WPAmmo"  : {
_GearData = [side Player, "Ammo"] call _GearDataScript
};

   
};

   if (_ItemType == "WPAmmo") then {
  private["_Equipment", "_PrimeWP", "_SecondWP", "_HandGunWP", "_CanBe", "_NGearData"];
  _Equipment = uiNamespace getVariable "Equipment";
   _PrimeWP = (_Equipment select 0) select 0;
    _SecondWP = (_Equipment select 1) select 0;
    _HandGunWP = (_Equipment select 2) select 0;
    _CanBe  = [];
           _NGearData = [];
      if (_PrimeWP != "") then {
_CanBe = _CanBe + getArray (configFile >> "CfgWeapons" >> (_PrimeWP) >> "magazines");

};

  if (_SecondWP != "") then {
_CanBe = _CanBe + getArray (configFile >> "CfgWeapons" >> (_SecondWP) >> "magazines");

};

  if (_HandGunWP != "") then {
_CanBe = _CanBe + getArray (configFile >> "CfgWeapons" >> (_HandGunWP) >> "magazines");

};

      {
   private["_GearType"];
   _GearType = _x select 0;
   if (_GearType in _CanBe) then {
_NGearData set[count(_NGearData), _x]
};

  } forEach _GearData;
    _GearData = _NGearData;
 
};

   _GearData call _UpdateShopList;

};

_MouseMove ={
 private["_Display", "_Mx", "_My", "_DragTo", "_DragFrom","_Item"];
 _Display = uiNamespace getVariable "WFDisplay_GearMenu";
 _DragTo  = (_this select 0) select 0;
   _Mx   = (_this select 0) select 1;
 _My   = (_this select 0) select 2;
 _DragFrom = (_this select 0) select 3;
  _Item   = (((_this select 0) select 4) select 0) select 0;
   _Width = 0.2;
 _Height = 0.11;
 _NewPos = [_Mx - (_Width / 2), _My - (_Height / 2), _Width, _Height];
  (_Display displayCtrl 9001) ctrlSetPosition _NewPos;
 (_Display displayCtrl 9001) ctrlCommit 0.0001;
 if (_Item != "Empty") then {
  ctrlSetText [9001, getText (configFile >> (_Item call _GetCfgName) >> _Item >> "picture")];
 
};

 
};

_Drag ={
 private["_Item"];
 _Item  = (((_this select 0) select 1) select 0) select 0;
   if (_Item != "Empty") then {
ctrlShow [9001, true]
};

 
};

_Drop = {
 private["_Display", "_Mx", "_My", "_DragTo", "_DragFrom","_Item", "_DragToIdc", "_GearType"];
 _Display = uiNamespace getVariable "WFDisplay_GearMenu";
 _DragTo  = (_this select 0) select 0;
   _DragToIdc = ctrlIDC _DragTo;
     _DragFrom = (_this select 0) select 3;
  _Item   = (((_this select 0) select 4) select 0) select 0;
 _GearType = "Unknown";
  ctrlShow [9001, false];
    _GearType = _Item call _TakeItemType;
  if (_DragToIdc != _DragFrom) then {
[_DragToIdc, _Item, _GearType, _DragFrom] call _DropSlotScript
};

 
};

_DBClick = {
  private["_Control","_SelectedNum", "_IdcFrom", "_Item", "_ItemType", "_IdcTo"];
 _Control  = (_this select 0) select 0;
    _SelectedNum = (_this select 0) select 1;
    _IdcFrom  = ctrlIDC _Control;
       _Item   = _Control lnbText [_SelectedNum, 0];
  _ItemType  = "";
          _IdcTo   = 1510;
            _ItemType = if (_Item != "") then {
_Item call _TakeItemType
};

   if (_Item != "") then {
  if (_IdcFrom == 1510) then  {
      _IdcTo = switch (_ItemType) do    {
     case "Primary"  : {
5101
};

     case "Secondary" : {
5201
};

     case "HandGun"  : {
5301
};

     case "Ammunition" : {
1511
};

     case "Muzzles"  : {
5102
};

     case "Optics"  : {
5104
};

     case "Acc"   : {
5103
};

     case "Uniform"  : {
4101
};

     case "Vest"   : {
4102
};

     case "Backpack"  : {
4103
};

     case "Glasses"  : {
4203
};

     case "Helmet"  : {
4204
};

     case "Item"   : {
1511
};

     case "Ammo"   : {
1511
};

    
};

   [_IdcTo, _Item, _ItemType, _IdcFrom] call _DropSlotScript;
  }  else  {
      [_IdcTo, _Item, _ItemType, _IdcFrom] call _DropSlotScript;
  
};

 
};


};

_Buy ={
 private["_SellList", "_Cost", "_Money", "_Pay", "_SelectedNum", "_UnitsArray", "_Unit"];
 _SellList  = uiNamespace getVariable "Sell_List";
 _Cost   = 0;
      _Money   = (Player call GetPlayerSupplyMoney) select 1;
  _SelectedNum = lbCurSel 2100;
 _UnitsArray  = units Player;
        _Unit   = _UnitsArray select _SelectedNum;
     _Pay   = {
    [Player, 0, - _Cost]call SetPlayerSupplyMoney;
      _Equipment   = uiNamespace getVariable "Equipment";
    if (isPlayer _Unit) then     {
  profileNamespace setVariable ["WASP_Equipment", _Equipment];
  uiNamespace setVariable ["Equipment_BackUp", _Equipment];
  
};

      uiNamespace  setVariable ["Sell_List", []];
  _Cost = 0;
 
};

   {
_Cost = _Cost + (_x select 1)} forEach _SellList;
   if ((_Cost > 0) && (_Cost >  _Money)) then {
Hint Format["YOU CAN'T PAY FOR THIS"]
};

 if ((_Cost > 0) && (_Cost <= _Money)) then {
[] call _Pay
};

 if (_Cost < 0 ) then {
[] call _Pay
};

   _Cost call _UpdateCostMoney;
 hint format["Buy"];

};

_Close ={
 private["_KeysArray", "_ThisType", "_Key"];
  _KeysArray  = _this select 0;
    _ThisType  = typeName _KeysArray;
    _CloseScript =  {
  private["_Equipment", "_SelectedNum", "_UnitsArray", "_Unit"];
  _Equipment   = uiNamespace getVariable "Equipment_BackUp";
  _SelectedNum = lbCurSel 2100;
  _UnitsArray  = units Player;
    _Unit   = _UnitsArray select _SelectedNum;
      [_Unit, _Equipment] call SetEquipment;
      if (isPlayer _Unit) then  {
   private["_PlayerInfo"];
   _PlayerInfo = ["Name", Name Player] call GetPlayerInfo;
   _PlayerInfo set [6, _Equipment];
   _PlayerInfo call SetPlayerInfo;
  
};

 
};

   if (_ThisType == "ARRAY") then {
  _Key = _KeysArray select 1;
  if (_Key == 1) then {
[] call _CloseScript
};

    
};

   if (_ThisType == "STRING") then {
[] call _CloseScript
};


};

_Function = switch (_Question) do{
    case "onLoad"   : {
_onLoad
};

 case "ComboSelect"  : {
_ComboSelect
};

 case "StorageSelect" : {
_StorageSelect
};

 case "ShopSelect"  : {
_ShopSelect
};

 case "MouseMove"  : {
_MouseMove
};

 case "Drag"    : {
_Drag
};

 case "Drop"    : {
_Drop
};

  case "DBClick"   : {
_DBClick
};

 case "Buy"    : {
_Buy
};

 case "Close"   : {
_Close
};


};

call _Function;
