 private ["_Camera","_KeyPress","_MouseMove","_MouseClick","_Key","_this","_Button","_KursorPos","_LocalObj","_ObjData"];
 _Camera  = Cons_Array select 0;
_KeyPress = Cons_Array select 1;
_MouseMove = Cons_Array select 2;
_MouseClick = Cons_Array select 3;
_KursorPos = Cons_Array select 4;
_LocalObj = Cons_Array select 5;
 _Button  = _this select 1;
    if ((_Button == 0) && !(isNull _LocalObj)) then{
 private["_ObjType","_CostSupply","_CostMOney", "_Abr"];
  _ObjData  = Cons_Array select 6;
 _ObjType = _ObjData select 0;
 _CostSupply = _ObjData select 1;
 _CostMOney = _ObjData select 2;
 _Abr  = _ObjData select 4;
        [_ObjData,getPosATL _LocalObj,getDir _LocalObj, _ObjData select 4] call Construction_Build_Client;
    deleteVehicle _LocalObj;
 Cons_Array set[5,objNull];
   Cons_Array set[6,[]];
      [] call Construction_CreateMenu;
   showCommandingMenu "#USER:MainMenu";

};

 if ((_Button == 1) && !(isNull _LocalObj)) then{
  deleteVehicle _LocalObj;
 Cons_Array set[5,objNull];
   Cons_Array set[6,[]];
    [] spawn  {
   sleep 0.1;
    showCommandingMenu "#USER:MainMenu";
 
};


};

