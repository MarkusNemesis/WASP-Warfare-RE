 private["_Unit", "_UnitIdString", "_UnitIdArray", "_StartWrite", "_StopWrite", "_NumberArray", "_result"];
_Unit   = _this;
_UnitIdString = str _Unit;
_UnitIdArray = toArray _UnitIdString;
_StartWrite  = false;
_StopWrite  = false;
_NumberArray = [];
{
 if (_StartWrite && !_StopWrite) then {
  if (_x == 32) then {
_StopWrite = true} else {
_NumberArray set [count _NumberArray, _x]
};

 
};

  if (_x == 58) then  {
_StartWrite = true
};

} forEach _UnitIdArray;
_result = parseNumber (toString _NumberArray);
_result 