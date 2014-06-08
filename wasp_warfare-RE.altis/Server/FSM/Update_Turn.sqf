 if ((typeName Public_BuyTurn == "ARRAY") && count(Public_BuyTurn) > 0) then{
 {
  if (!isNil "_x") then  {
   if ((typeName _x == "ARRAY") && (count _x > 9)) then   {
    private["_BuildingObject", "_Type", "_VehType", "_VehRank", "_CreateScript", "_Group", "_Group", "_Driver", "_Driver",      "_Commander", "_Lock", "_CreateParam", "_RespawnPos", "_FactoryInTurn", "_Purchase"];
    _Purchase  = _x;
    _BuildingObject = _Purchase select 0;
      _VehType  = _Purchase select 1;
    _VehRank  = _Purchase select 2;
    _CreateScript = _Purchase select 5;
    _Group   = _Purchase select 6;
    _Driver   = _Purchase select 7;
      _Guner   = _Purchase select 8;
      _Commander  = _Purchase select 9;
      _Lock   = _Purchase select 10;
      _RespawnPos  = _Purchase select 11;
        _FactoryInTurn = false;
                     _Purchase set[3, time];
                       {
     private["_x", "_forEachIndex"];
     if (typeName _x == "ARRAY") then     {
      private["_FactoryObj", "_FactoryTurn"];
      _FactoryObj = _x select 0;
            if (!_FactoryInTurn && _FactoryObj == _BuildingObject) exitWith       {
                     private[];
       _FactoryInTurn  = true;
           _FactoryTurn = _x select 1;
                     _FactoryTurn  set [count(_FactoryTurn), _Purchase];
       _x set [1, _FactoryTurn];
       Server_BuyTurn set [_forEachIndex, _x];
      
};

     
};

    } forEach Server_BuyTurn;
                if (!_FactoryInTurn) then    {
          Server_BuyTurn set [count(Server_BuyTurn), [_BuildingObject, [_Purchase]] ];
    }   }  } } forEach Public_BuyTurn;

};

 Public_BuyTurn = [];
{
 if (typeName _x == "ARRAY") then {
  private["_Factory", "_FactoryTurn"];
  _Factory  = _x select 0;
  _FactoryTurn = _x select 1;
    if (typeName _FactoryTurn == "ARRAY") then  {
   if (count _FactoryTurn == 0) then   {
            Server_BuyTurn set [_forEachIndex, -1];
    Server_BuyTurn = Server_BuyTurn - [-1];
   }   else   {
            private["_FirstVehicle", "_Time", "_TimeCreate"];
    _FirstVehicle = _FactoryTurn select 0;
        if (typeName _FirstVehicle == "ARRAY") then    {
     _Time   = _FirstVehicle select 3;
        _TimeCreate  = _FirstVehicle select 4;
                 if ((time >= (_Time + _TimeCreate))) then     {
      private["_BuildingObject", "_Type", "_VehType", "_VehRank", "_CreateScript", "_Group", "_Group", "_Driver", "_Driver",        "_Commander", "_Lock", "_RespawnPos", "_SecondVehicle", "_Owner"];
      _BuildingObject = _FirstVehicle select 0;
        _VehType  = _FirstVehicle select 1;
      _VehRank  = _FirstVehicle select 2;
      _CreateScript = _FirstVehicle select 5;
      _Group   = _FirstVehicle select 6;
      _Driver   = _FirstVehicle select 7;
        _Guner   = _FirstVehicle select 8;
        _Commander  = _FirstVehicle select 9;
        _Lock   = _FirstVehicle select 10;
        _RespawnPos  = _FirstVehicle select 11;
            _Owner   = (units _Group) select 0;
                        if (_VehType isKindOf "Man") then {
                     [_Owner, [[_VehType, _VehRank, _Group, _RespawnPos], {
_this call Create_Unit}], ObjNull] call Send_Run;
      }       else {
                     [_Owner, [[_BuildingObject, _VehType, _VehRank, _Group, _RespawnPos, _Driver, _Guner, _Commander, _Lock], {
_this call Create_Vehicle}], ObjNull] call Send_Run;
      
};

                        if (count _FactoryTurn > 1) then      {
       _SecondVehicle = _FactoryTurn select 1;
       if (isNil "_SecondVehicle") then       {
        if (typeName _SecondVehicle == "ARRAY") then        {
         _SecondVehicle set [3, time];
         _FactoryTurn set [1, _SecondVehicle];
        
};

       
};

      
};

                        _FactoryTurn set [0,"Empty"];
      _FactoryTurn = _FactoryTurn - ["Empty"];
     
};

    }    else    {
               _FactoryTurn set [0, "Delete"];
     _FactoryTurn = _FactoryTurn - ["Delete"];
     Server_BuyTurn set [_forEachIndex, [_x select 0, _FactoryTurn]];
    
};

                if (count (_FactoryTurn) == 0) then     {
     Server_BuyTurn set [_forEachIndex, -1];
     Server_BuyTurn = Server_BuyTurn - [-1];
    
};

   
};

  
};

 
};

} forEach Server_BuyTurn;
Public_BuyTurnNumber = [];
if (count Server_BuyTurn > 0) then{
 {
  private["_Factory", "_FactoryObject", "_FactoryTurn"];
    _Factory  = _x;
           _FactoryObject = _Factory select 0;
       _FactoryTurn = _Factory select 1;
         if (count(_FactoryTurn) > 0) then {
   Public_BuyTurnNumber set [count(Public_BuyTurnNumber), [_FactoryObject, count(_FactoryTurn)]]  } } forEach Server_BuyTurn;

};

