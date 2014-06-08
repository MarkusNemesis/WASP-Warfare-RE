private ["_this", "_Side", "_BaseArea", "_Bases", "_AllArea", "_AllBuildings", "_i", "_result"];
_Side   = _this select 0;
_Bases   = if (_Side == west) then {
Public_BaseAreaBF} else {
Public_BaseAreaOF
};

        _AllArea  = [];
        _AllBuildings = [];
        if (count(_Bases) > 0) then{
  for "_i" from 0 to (count(_Bases)-1) do {
  private ["_Area", "_BuildArray"];
    _Area  = _Bases select _i;
    _BuildArray = _Area select 3;
        _AllArea set [count(_AllArea), _Area];
     _AllBuildings = _AllBuildings + _BuildArray;
  
};

   private ["_BldData"];
  _BldData = "Buildings" call Data_Cons;
  for "_i" from 0 to (count(_AllBuildings)-1) do {
  private["_Building", "_j"];
    _Building = _AllBuildings select _i;
  for "_j" from 0 to (count(_BldData)-1) do  {
   private ["_BldDataType", "_BldType", "_BldAbriviat"];
      _BldDataType = (_BldData select _j) select 2;
   _BldAbriviat = (_BldData select _j) select 6;
   _BldType   = _Building select 2;
         if (_BldType == _BldDataType) then   {
        _Building set [4, _BldAbriviat];
    _AllBuildings set [_i, _Building];
   
};

  
};

 
};

}else{
  _AllArea  = [[-1]];
 _AllBuildings = [[-1]];

};

_result = [_AllArea, _AllBuildings];
_result 