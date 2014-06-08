 private ["_this", "_obj", "_unit", "_xyz", "_sizeMin", "_sizeMax", "_size", "_unitToWallPos", "_result"];
  _obj     = _this select 0;
   _unit    = _this select 1;
   _xyz     = boundingBox _obj;
   _sizeMin = _xyz select 0;
   _sizeMax = _xyz select 1;
   _result = false;
      _size = [(_sizeMax select 0) - (_sizeMin select 0),(_sizeMax select 1) - (_sizeMin select 1),(_sizeMax select 2) - (_sizeMin select 2)];
  _unitToWallPos = _obj worldToModel (getPosATL  _unit);
   _UX = _unitToWallPos select 0;
      _UY = _unitToWallPos select 1;
        if ((_UX > _sizeMin select 0) && (_UX < _sizeMax select 0) && (_UY > _sizeMin select 1) && (_UY < _sizeMax select 1)) then {
_result = true
};

    _result;
