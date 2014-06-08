  private["_Vehicle", "_Lock", "_Condition", "_LockScript"];
_Vehicle = _this select 0;
 _Lock  = _this select 1;
 _Condition = {
 private["_Result", "_Distance", "_MaxDis"];
 _Result  = false;
 _Distance = _target distance _this;
 _MaxDis  = if (isPlayer _this) then {
6} else {
15
};

 _Result  = if ((owner _target == 0) && (_Distance < 5) && (alive _target)) then {
true} else {
false
};

 _Result
};

_LockScript ={
 private["_Vehicle", "_Player", "_ActId", "_Lock", "_Text"];
 _Vehicle = _this select 0;
 _Player  = _this select 1;
 _ActId  = _this select 2;
 _Lock  = switch (locked _Vehicle) do {
  case 2 : {
true
};

  case 3 : {
true
};

  default   {
false
};

 
};

   _Vehicle lock (if (_Lock) then {
0} else {
2});
   _Text = format   [    "<t color='#ffff00' align='left'>%1<t align='right'>%2  </t></t>",    if (_Lock) then {
"Lock"} else {
"Unlock"},    getText (configFile >> 'CfgVehicles' >> (typeOf _Vehicle) >> "displayName")   ];
    _Vehicle setUserActionText [_ActId, _Text];

};

_LockText = format["<t color='#ffff00' align='left'>%1<t align='right'>%2  </t></t>",     if (_Lock) then {
"Unlock"} else {
"Lock"},     getText (configFile >> 'CfgVehicles' >> (typeOf _Vehicle) >> "displayName")     ];
_Vehicle addAction [_LockText, _LockScript,"", 6, true, true,"teamSwitchPrev", format["_this call %1", _Condition]];
