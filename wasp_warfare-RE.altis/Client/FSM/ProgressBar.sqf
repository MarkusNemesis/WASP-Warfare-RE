private ["_WWTowns"];
disableSerialization;
 _ShowPB  = player getVariable "Progress Bar";
 _WWTowns  = Public_TownsArray;
     _WWCamps = Public_CampsArray;
     _ProgBarA = [];
         _TownCheck = false;
        _CampCheck = false;
        _NearestTown = [0,10000];
for "_i" from 0 to (count(_WWTowns)-1) do {
 _Town   = _WWTowns select _i;
 _TownPos = getPosATL (_Town select 1);
 _TownID  = _Town select 0;
 _Dis  = floor (getPosATL  (player) distance _TownPos);
 if ((_NearestTown select 1) > _Dis) then {
_NearestTown = [_TownID,_Dis];

};


};

 _nearestCamp = [0,10000];
for "_i" from 0 to (count(_WWCamps)-1) do {
 _Camp   = _WWCamps select _i;
 _CampPos = getPosATL (_Camp select 1);
 _CampID  = _Camp select 0;
 _Dis  = floor (getPosATL  (player) distance _CampPos);
   if ((_nearestCamp select 1) > _Dis) then {
_nearestCamp = [_CampID,_Dis];

};


};

  private ["_Town","_TownPos","_TownPoints","_TownSize","_TownRange","_MaxPoints","_Dis"];
 _Town   = _WWTowns select(_NearestTown select 0);
_TownPos = getPosATL (_Town select 1);
_TownSide = _Town select 7;
_TownPoints = _Town select 8;
_TownSize = _Town select 3;
 _TownRange = 150 + (20 * _TownSize);
_MaxPoints = _Town select 6;
 _Dis = (getPosATL  player) distance _TownPos;
 if (_Dis <= _TownRange) then{
      _ProgBarA = [format["%1 %2/%3", _Town select 2, _TownPoints, _MaxPoints],_TownSide,_TownPoints,_MaxPoints];
 _TownCheck = true;
}else {
 _TownCheck = false
};

private ["_Camp","_CampPos","_CampSide","_CampPoints","_MaxPoints","_CampRange","_Dis"];
 _Camp  = _WWCamps select(_nearestCamp select 0);
_CampPos = getPosATL  (_Camp select 1);
_CampSide = _Camp select 3;
_CampPoints = _Camp select 4;
_MaxPoints = _Camp select 5;
_CampRange = _Camp select 6;
 _Dis = (getPosATL  player) distance _CampPos;
 if (_Dis <= _CampRange) then{
       _ProgBarA = ["Camp",_CampSide,_CampPoints,_MaxPoints];
 _CampCheck = true;
}else {
 _CampCheck = false
};

   if ((_TownCheck || _CampCheck ) && !(_ShowPB)) then{
 disableSerialization;
 6879 cutRsc ["ProgressBar_Dialog","PLAIN",3];
      _ShowPB = true;

};

if ((_TownCheck || _CampCheck ) && _ShowPB) then{
 private ["_Display","_BGcontrol","_BGposSize","_CtrlLine", "_CtrlLine"];
   _Display  = WWDisplay select 0;
 _BGcontrol  = _Display DisplayCtrl 1001;
 _BGposSize  = ctrlPosition _BGcontrol;
   _CtrlLine  = _Display DisplayCtrl 1002;
 _CtrlLine ctrlShow true;
   _MaxWidth  = _BGposSize select 2;
 _Width   = (1/(_ProgBarA select 3))*(_ProgBarA select 2);
   _Color = switch (true) do     {
    case ((_ProgBarA select 1) == resistance ) : {
[0,0,1,0.4]
};

    case (side player == (_ProgBarA select 1)) : {
[0,1,0,0.4]
};

    case (side player != (_ProgBarA select 1)) : {
[1,0,0,0.4]
};

    
};

   _BGcontrol ctrlSetBackgroundColor _Color;
 _CtrlLine  ctrlSetTextColor _Color;
 _BGcontrol ctrlSetStructuredText parseText format["<t align ='center' size='0.8'>%1</t>",_ProgBarA select 0];
  _CtrlLine progressSetPosition _Width;
 _CtrlLine ctrlCommit 1;
  
};

if (!(_TownCheck) && !(_CampCheck) ) then{
 _ShowPB = false;
 6879 cutText ["","PLAIN",0];

};

  player setVariable ["Progress Bar",_ShowPB,false];
