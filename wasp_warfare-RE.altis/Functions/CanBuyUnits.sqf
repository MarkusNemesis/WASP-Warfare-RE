 private["_this", "_Group", "_UnitsInGroup", "_CountUnits", "_MaxUnits", "_result"];
_Group   = group _this;
    _UnitsInGroup = units _Group;
    _CountUnits  = count _UnitsInGroup;
  _MaxUnits  = 10;
      _result = if (_CountUnits <= _MaxUnits) then {
true} else {
false
};

  _result