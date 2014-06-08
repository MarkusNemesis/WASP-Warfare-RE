private ["_Side", "_Unit", "_AllAreasBld", "_Areas", "_Buildings", "_B", "_LF", "_HF", "_AF", "_CC", "_S", "_BF", "_TC", "_BW", "_MaxDist", "_MinDist", "_result",   "_ObjCC", "_ObjB", "_ObjLF", "_ObjHF", "_ObjAF", "_ObjBF", "_ObjS", "_ObjTC", "_ObjBW"];
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
 _ObjCC  = [];
 _ObjB  = [];
 _ObjLF  = [];
 _ObjHF  = [];
 _ObjAF  = [];
 _ObjBF  = [];
 _ObjS  = [];
 _ObjTC  = [];
 _ObjBW  = [];
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
  private ["_Bld", "_BldAbr", "_Dist", "_Pos"];
     _Bld  = _Buildings select _i;
    _BldAbr = _Bld select 4;
     _Pos = _Bld select 3;
     _Dist = _Unit distance _Pos;
       if (_Dist < _MaxDist && _BldAbr == "B" ) then {
_B  = true;
 _ObjB  set[count(_ObjB) , _Bld]
};

  if (_Dist < _MaxDist && _BldAbr == "LF") then {
_LF  = true;
 _ObjLF set[count(_ObjLF), _Bld]
};

  if (_Dist < _MaxDist && _BldAbr == "HF") then {
_HF = true;
 _ObjHF set[count(_ObjHF), _Bld]
};

  if (_Dist < _MaxDist && _BldAbr == "AF") then {
_AF = true;
 _ObjAF set[count(_ObjAF), _Bld]
};

  if (_Dist < _MaxDist && _BldAbr == "BF") then {
_BF = true;
 _ObjBF set[count(_ObjBF), _Bld]
};

    if (_Dist < (_MinDist * 2) && _BldAbr == "S" ) then {
_S  = true;
 _ObjS set[count(_ObjS), _Bld]
};

    if (_Dist < (_MinDist * 5) && _BldAbr == "B" ) then {
_BW = true;
 _ObjBW set[count(_ObjBW), _Bld]
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

      if (_Dist < _MinDist * 3 && _Friendly) then   {
   private ["_Bld", "_TownDir", "_Dis", "_RespawnPos"];
      _TC = true;
         _TownDir = getDir (_Town select 1)  - 180;
   _Dis  = 10;
   _RespawnPos = [(_TownPos select 0) + sin _TownDir * _Dis, (_TownPos select 1) + cos _TownDir * _Dis, _TownPos select 2];
         _Bld = [_Town select 0, _Town select 1, _Town select 2, _TownPos, "TC", _RespawnPos];
      _ObjTC set[count(_ObjTC), _Bld];
  
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

      if (_Dist < (_MinDist / 2) && _Friendly) then {
_BW = true;
 _ObjBW set[count(_ObjBW), _Camp]
};

 
};

_result = [[_CC, _B, _LF, _HF, _AF, _BF, _S, _TC, _BW],[_ObjCC, _ObjB, _ObjLF, _ObjHF, _ObjAF, _ObjBF, _ObjS, _ObjTC, _ObjBW]];
_result 