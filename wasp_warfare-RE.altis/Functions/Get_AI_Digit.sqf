Private ["_i","_Split","_Unit","_Yield"];
_Unit = _this;
if (_Unit == leader (group _Unit)) exitWith {
"Leader"
};

_Split = toArray(str _Unit);
_find = _Split find 58;
_Yield = [];
if (_find != -1) then {
 for '_i' from (_find+1) to count(_Split)-1 do {
  if ((_Split select _i) == 65 || (_Split select _i) == 32) exitWith {

};

  _Yield = _Yield + [_Split select _i];
 
};


};

if (count _Yield == 0) exitWith {
"0"
};

toString(_Yield)