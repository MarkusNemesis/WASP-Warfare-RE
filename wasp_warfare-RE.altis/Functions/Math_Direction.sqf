    private["_FirstPos", "_SecondPos", "_Sides", "_Dir", "_DirWord"];
_FirstPos = _this select 0;
   _SecondPos = _this select 1;
   _Sides  = 4;
      _DirWord = ["",""];
     if (count _this > 2) then {
_Sides = _this select 1
};

_Dir  = ((_FirstPos select 0) - (_SecondPos select 0)) atan2 ((_FirstPos select 1) - (_SecondPos select 1));
Switch _Sides do {
 case 4 : {
    _DirWord = switch true do {
   case ((_Dir  >= -45) && (_Dir  <= 45))  : {
["North", "N"]
};

   case ((_Dir  > 45) && (_Dir  < 135))  : {
["East", "E"]
};

   case ((_Dir  >= 135) && (_Dir  <= -135)) : {
["South", "S"]
};

      case ((_Dir  > -135) && (_Dir  < -45))  : {
["West", "W"]
};

  
};

 
};

  case 8  : {
    _DirWord = switch true do {
   case ((_Dir  >= -45) && (_Dir  <= 45))  : {
["North", "N"]
};

   case ((_Dir  > 45) && (_Dir  < 135))  : {
["East", "E"]
};

   case ((_Dir  >= 135) && (_Dir  <= -135)) : {
["South", "S"]
};

      case ((_Dir  > -135) && (_Dir  < -45))  : {
["West", "W"]
};

  
};

  
};


};

[_Dir, _DirWord select 0, _DirWord select 1]