 private["_this", "_BldData", "_Question", "_result"];
_Question = _this;
      _result  = [];
       _BldData = "Buildings" call Data_Cons;
 {
 private["_Type", "_Abr"];
 _Type = _x select 2;
   _Abr = _x select 6;
    if (_Question == _Type or _Question == _Abr) exitWith {
  _result = _x;
 
};

} forEach _BldData;
_result