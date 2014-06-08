 private["_PushBoatCondition", "_PushBoatScript"];
_PushBoatCondition ={
 private["_Boat", "_Player", "_Distance"];
 _Boat   = cursorTarget;
 _Player  = _this;
 _Distance = _Boat distance _Player;
  ((_Boat isKindOf "Ship") && (_Distance < 7))
};

_PushBoatScript ={
 private["_Boat", "_Player", "_Distance", "_BoatPos", "_PlayerPos", "_Dir", "_BoatVel","_Speed"];
 _Boat   = cursorTarget;
 _Player  = _this select 0;
 _BoatPos = getPosASL _Boat;
 _PlayerPos = getPosASL _Player;
 _BoatVel = velocity _Boat;
 _Speed  = 3;
   _Dir  = ((_BoatPos select 0) - (_PlayerPos select 0)) atan2 ((_BoatPos select 1) - (_PlayerPos select 1));
  _Boat setVelocity [(_BoatVel select 0)+(sin _Dir*_Speed),(_BoatVel select 1)+ (cos _Dir*_Speed),(_BoatVel select 2)];
  
};

_this addAction [format["<t color='#ffff00'>Push<t align='right'>%1</t></t>",getText (configFile >> 'CfgVehicles' >> (typeOf cursorTarget) >> "displayName")], _PushBoatScript,"", 6, true, true,"teamSwitchPrev", format["_this call %1", _PushBoatCondition]];
