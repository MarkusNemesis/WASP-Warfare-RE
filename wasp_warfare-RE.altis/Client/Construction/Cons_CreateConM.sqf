private["_GetSupplyMoney","_InBaseArea","_Exec"];
_InBaseArea = {
 private ["_this", "_MHQ", "_Side", "_result", "_NearestArea", "_AreaID", "_AreaDist", "_InArea"];
  _Side  = _this;
    _result = [0,0];
    _MHQ  = switch (_Side) do    {
   case west: {
Public_MHQ_BF
};

   case east: {
Public_MHQ_OF
};

  
};

   _NearestArea  = [_Side, _MHQ] call Compile preprocessFileLineNumbers "Functions\Nearest_Base_Area.sqf";
  _AreaID  = _NearestArea select 0;
   if (_AreaID >= 0) then {
  _AreaDist = _NearestArea select 1;
  _InArea  = _NearestArea select 2;
      private ["_i","_NearestArea","_NearestDist","_Area","_Dist"];
  if (_InArea) then  {
      _result = [1,0];
  }    else  {
      _result = [0,1];
  
};

  } else {
    _result = [0,1];
 
};

 _result  
};

 _Exec = {
 private ["_this","_LocalObj","_KursorPos","_ObjType", "_Abr"];
 player sidechat "OBJECT CREATED";
   hint str(_this);
 _KursorPos = Cons_Array select 4;
 _ObjType = _this select 0;
 _CostSupply = _this select 1;
 _CostMoney = _this select 2;
 _Time  = _this select 3;
 _Abr  = _this select 4;
 _LocalObj = _ObjType createVehicleLocal _KursorPos;
 _LocalObj setPosATL _KursorPos;
      Cons_Array set [5,_LocalObj];
           Cons_Array set [6,[_ObjType,_CostSupply,_CostMoney,_Time, _Abr]];
  _LocalObj spawn Construction_Arrow;
  
};

 private ["_BuildMenuData","_BuildMenu"];
_BuildMenuData = "Buildings" call Data_Cons;
   BuildMenu = [];
_color   = "#ffffff";
 _color1  = "#ffe600";
 _color2  = "#00ff00";
  for "_i" from 0 to (count(_BuildMenuData)-1) do {
 private ["_MenuItem","_Text","_Text1","_Text2","_SupMon","_Supply","_Money","_Active","_Script"];
     _MenuItem  = _BuildMenuData select (_i);
   _SupMon = Player call GetPlayerSupplyMoney;
 _Supply = _SupMon select 0;
 _Money  = _SupMon select 1;
 _Active = "1";
   if ((_Supply < (_MenuItem select 3)) or (_Money < (_MenuItem select 4))) then  {
  _Active = "0";
  _Color  = "#c9c9c9";
  _Color1 = "#c9c9c9";
  _Color2 = "#c9c9c9";
 
};

       _Text1 = format["<t size='%1' color='%2' align='left'>%3</t>",1,_color,_MenuItem select 0];
 _Text2 = format["<t size='%1' color='%2' align='right'> S:%4<t color='%3'> $:%5</t></t>",1,_color1,_color2,_MenuItem select 3,_MenuItem select 4];
 _Text = format["%1%2",_Text1,_Text2];
 _Text = composeText[parseText _Text];
  _Script = format["_Exec = %1;
 ['%2',%3,%4,%5,'%6'] call _Exec;
",_Exec,_MenuItem select 2,_MenuItem select 3,_MenuItem select 4,_MenuItem select 5, _MenuItem select 6];
     BuildMenu set [_i,[_Text,[_MenuItem select 1], "", -5, [["expression", _Script ]], "1", _Active]];

};

 BuildMenu = [["MAIN BUILDINGS",true]] + BuildMenu;
private ["_this","_MainMenu", "_MainMenuData", "_color", "_color2", "_Wall"];
_MainMenuData = [                 ["Main buildings"  ,  2  ,"#USER:BuildMenu" , 0   , 0   ],     ["Defences"   ,  3  ,""     , 0   , 0   ],     ["Walls"    ,  4  ,""     , 0   , 0   ],     [""     ,  0  ,""     , 0   , 0   ],     ["Deploy Base Area" ,  10 ,""     , 0   , 200   ]    ];
  MainMenu = [];
for "_i" from 0 to (count(_MainMenuData)-1) do {
 private ["_MenuItem","_Text","_Text2","_Active","_Script"];
  _Text2  = "";
 _Active  = (side player) call _InBaseArea;
  _MenuItem  = _MainMenuData select (_i);
    if ((_MenuItem select 0) == "Deploy Base Area") then {
_Active = str(_Active select 1)} else {
_Active = str(_Active select 0)
};

  if (_Active == "1") then {
_color = "#00ff00"} else {
_Color  = "#c9c9c9";

};

 _Text = format["<t size='%1' color='%2' align='left'>%3   </t>",1,_color,_MenuItem select 0];
  if (_Active == "0" && (_MenuItem select 0) != "") then  {
  private ["_Word"];
    if (_MenuItem select 0 == "Deploy Base Area") then {
_Word = "IN BASE AREA"} else {
_Word = "NO BASE NEAR"
};

  _Text2 = format["<t size='%1' color='%2' align='right'>%3</t>", 0.6, "#ff0000", _Word];
 } else  {
    if ((_MenuItem select 4) > 0) then {
_Text2 = format["<t size='%1' color='%2' align='right'>S:%3</t>",1,"#ffe600",_MenuItem select 4]
};

 
};

 _Text = _Text + _Text2;
 _Text = composeText[parseText _Text];
  if (_MenuItem select 0 == "Deploy Base Area") then  {
  private ["_Flag"];
    _Flag = if (side player == west) then {
"Flag_NATO_F"} else {
"Flag_CSAT_F"
};

   _Script = format["_Exec = %1;
 ['%2',%3,%4,%5] call _Exec;
",_Exec,_Flag,_MenuItem select 4,0,1,""];
 }  else  {
  hint str(_MenuItem select 0);
  _Script = format["player sideChat 'Sub menu: %1'",_MenuItem select 0];
 
};

    MainMenu set [_i,[_Text,[_MenuItem select 1],_MenuItem select 2, -5, [["expression", _Script]], "1", _Active]];

};

 MainMenu = [["CONSTRUCTION MENU",true]] + MainMenu;
    showCommandingMenu "#USER:MainMenu";
