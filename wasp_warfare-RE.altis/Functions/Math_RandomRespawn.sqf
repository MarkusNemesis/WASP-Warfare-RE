     private["_this", "_Positon", "_Range", "_Direction", "_Distance"];
_Positon  = _this select 0;
  _Range  = _this select 1;
  _MinRange = 0;
     _Direction = 0;
     _Distance = 0;
     if (count (_this) > 2) then {
 if (typeName(_this select 2) == "SCALAR") then {
  _MinRange = _this select 2;
 
};


};

waitUntil {
 _Direction = floor (random 360);
 _Distance = floor (random (_Range));
 (_Distance >= _MinRange && _Distance <= _Range)
};

 _RespawnPos = [ (_Positon select 0) + sin _Direction * _Distance, (_Positon select 1) + cos _Direction * _Distance,  _Positon select 2];
_RespawnPos