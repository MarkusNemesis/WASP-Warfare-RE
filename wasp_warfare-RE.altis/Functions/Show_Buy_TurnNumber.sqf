  private ["_Building", "_BuildObj", "_result"];
_BuildObj = _this;
  _result  = 0;
if (typeName _BuildObj == "OBJECT") then{
  if (count (Public_BuyTurnNumber) > 0) then {
  {
   private["_FactoryObj"];
   _FactoryObj = _x select 0;
   if (_BuildObj == _FactoryObj) then {
_result = _x select 1}  } forEach Public_BuyTurnNumber;
 
};


};

_result 