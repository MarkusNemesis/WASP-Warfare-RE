 private ["_TurnAll", "_SelectedTurn", "_SelectedId", "_Building", "_FactoryType", "_result"];
_TurnAll = Public_BuyTurn;
_result  = [];
_FactoryType = _this select 0;
 _Building  = _this select 1;
  if (_FactoryType == "TC") then {
 _Building = [_Building select 0, _Building select 1, "", "", "", ""];

};

_Selected = switch (_FactoryType) do{
    case "B" : {
[_TurnAll select 0, 0]
};

 case "LF" : {
[_TurnAll select 1, 1]
};

 case "HF" : {
[_TurnAll select 2, 2]
};

 case "AF" : {
[_TurnAll select 3, 3]
};

 case "BF" : {
[_TurnAll select 4, 4]
};

 case "TC" : {
[_TurnAll select 5, 5]
};


};

_SelectedTurn = _Selected select 0;
 _SelectedId  = _Selected select 1;
 if ((count(_SelectedTurn)) > 0) then{
 for "_i" from 0 to (count(_SelectedTurn)-1) do  {
   private ["_TurnFObj", "_BldObj", "_TurnFactory"];
      _TurnFactory = _SelectedTurn select _i;
      _TurnFObj  = _TurnFactory select 0;
      _BldObj   = _Building select 1;
         if (_BldObj == _TurnFObj) then    {
        _VehTurn = _TurnFactory select 2;
    _result  = _VehTurn;
   
};

  
};

}else{
   _result = [];

};

_result