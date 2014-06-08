private ["_Side", "_Unit", "_AllAreasBld", "_Areas", "_Buildings", "_B", "_LF", "_HF", "_AF", "_CC", "_S", "_BF", "_TC", "_BW", "_MaxDist", "_MinDist", "_result"];
_Side   = _this select 0;
_Unit   = _this select 1;
_AllAreasBld  = [_Side] call Fun_GetAllAreaAndBld;
_Areas    = _AllAreasBld select 0;
_Buildings  = _AllAreasBld select 1;
_CC  = false;
 _B  = false;
 _LF  = false;
 _HF  = false;
 _AF  = false;
 _BF  = false;
 _S  = false;
 _TC  = false;
 _BW  = false;
 _MinDist = 10;
  if (((_Buildings select 0) select 0) >= 0) then {
  for "_i" from 0 to (count(_Buildings)-1) do {
  private ["_Bld", "_BldAbr"];
     _Bld  = _Buildings select _i;
    _BldAbr = _Bld select 4;
     _CC  = if (_BldAbr == "CC") then {
true} else {
_CC
};

 
};

  _MaxDist = if (_CC) then {
10000} else {
50
};

  for "_i" from 0 to (count(_Buildings)-1) do {
  private ["_Bld", "_BldAbr", "_Dist", "_Pos", "_BldObj"];
     _Bld  = _Buildings select _i;
    _BldObj = _Bld select 1;
     _BldAbr = _Bld select 4;
     _Pos = _Bld select 3;
     _Dist = _Unit distance _Pos;
       _B = if (_Dist < _MaxDist && _BldAbr == "B" && Alive _BldObj) then {
true} else {
_B
};

    _LF = if (_Dist < _MaxDist && _BldAbr == "LF" && Alive _BldObj) then {
true} else {
_LF
};

  _HF = if (_Dist < _MaxDist && _BldAbr == "HF" && Alive _BldObj) then {
true} else {
_HF
};

  _AF = if (_Dist < _MaxDist && _BldAbr == "AF" && Alive _BldObj) then {
true} else {
_AF
};

  _BF = if (_Dist < _MaxDist && _BldAbr == "BF" && Alive _BldObj) then {
true} else {
_BF
};

    _S = if (_Dist < (_MinDist * 2) && _BldAbr == "S" && Alive _BldObj) then {
true} else {
_S
};

    _BW = if (_Dist < (_MinDist * 5) && _BldAbr == "B" && Alive _BldObj) then {
true} else {
_BW
};

   
};


};

private ["_WWTowns", "_WWCamps"];
 _WWTowns = Public_TownsArray;
_WWCamps = Public_CampsArray;
for "_i" from 0 to (count(_WWTowns)-1) do {
  private["_Town", "_TownPos", "_TownSide", "_Dist", "_Friendly"];
     _Town  = _WWTowns select _i;
  _TownPos = getPosATL  (_Town select 1);
  _TownSide = _Town select 7;
  _Dist  = _Unit distance _TownPos;
          _Friendly = if (_Side == _TownSide) then {
true} else {
false
};

      _TC = if (_Dist < _MinDist && _Friendly) then {
true} else {
_TC
};

 
};

 for "_i" from 0 to (count(_WWCamps)-1) do {
  private["_Camp", "_CampPos", "_CampSide", "_Dist", "_Friendly"];
     _Camp  = _WWCamps select _i;
  _CampPos = getPosATL  (_Camp select 1);
  _CampSide = _Camp select 3;
  _Dist  = _Unit distance _CampPos;
          _Friendly = if (_Side == _CampSide) then {
true} else {
false
};

      _BW = if (_Dist < (_MinDist / 2) && _Friendly) then {
true} else {
_BW
};

 
};

_result = [_CC, _B, _LF, _HF, _AF, _BF, _S, _TC, _BW];
_result 