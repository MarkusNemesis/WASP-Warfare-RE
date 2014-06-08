  private["_Question", "_CreatePlayerVehicleArray", "_onLoad", "_RearmVehicle", "_RefuelVehicle", "_RepairVehicle",   "_HealVehicle", "_SearchNearestService", "_SelectVehicle"];
disableSerialization;
_Question = _this select 1;
 _CreatePlayerVehicleArray ={
    private["_this", "_Player", "_Units", "_Vehicles", "_Result"];
 _Player  = _this;
      _Units  = units group _Player;
   _Vehicles = [];
       _Result  = [];
         {
  if (vehicle _x != _x) then  {
   if not ((vehicle _x) in _Vehicles) then   {
    private["_Name"];
    _Name  = if (isPlayer _x) then {
name _x} else {
"AI"
};

    _Vehicles  set [count _Vehicles, vehicle _x];
    _Result  set [count _Result, [vehicle _x, _x call Fun_GetUnitNumberGroup, _Name]];
   
};

  
};

 } forEach _Units;
   _Result
};

_SearchNearestService ={
     private["_this", "_VehiclesArray", "_Side", "_Result", "_MaxDistance"];
 _VehiclesArray  = _this select 0;
   _Side    = _this select 1;
   _Result    = [];
      _MaxDistance  = 50;
       {
  private["_VehArray", "_Vehicle", "_AllAvailable"];
  _VehArray  = _x;
  _Vehicle   = _x select 0;
  _AllAvailable = false;
       {
   private["_TownObject", "_TownSide"];
   _TownObject = _x select 1;
   _TownSide = _x select 7;
         if (_TownSide == _Side) then   {
    private["_Distance"];
    _Distance = _Vehicle distance _TownObject;
        if (_Distance <= _MaxDistance) then    {
          _Result set [count _Result, _VehArray + [true,true,true,true]];
     _AllAvailable = true;
     
};

   
};

  } forEach Public_TownsArray;
                if (!_AllAvailable) then  {
   private["_TrucksType", "_NearService"];
   _NearService = [false, false, false, false];
   _TrucksType  = switch _Side do    {
    case west : {
["B_Truck_01_ammo_F","B_Truck_01_fuel_F","B_Truck_01_Repair_F","B_Truck_01_medical_F"]
};

    case east : {
["O_Truck_02_Ammo_F","O_Truck_02_fuel_F","O_Truck_02_repair_F","O_Truck_02_medical_F"]
};

       
};

         {
    private["_x", "_forEachIndex"];
    if (count(nearestObjects [_Vehicle, [_x], _MaxDistance]) > 0) then {
          _NearService set [_forEachIndex, true];
    }   } forEach _TrucksType;
         _Result set [count _Result, _VehArray + _NearService];
  
};

 } forEach _VehiclesArray;
    _Result
};

_VehicleArrayShow = {
    private["_this", "_Result"];
 _Result  = [];
 {
  private["_NearestService"];
  _NearestService = [_x select 3, _x select 4, _x select 5, _x select 6];
        if (true in _NearestService) then {
_Result set [count _Result, _x]
};

 } forEach _this;
   _Result
};

_onLoad ={
 private["_VehiclesArray", "_VehiclesArrayServ", "_FillArray"];
 uiNameSpace setVariable ["WFService_Display", (_this select 0) select 0];
  _VehiclesArray  = [];
               _VehiclesArrayServ = [];
              _Display   = uiNameSpace getVariable "WFService_Display";
     {
ctrlEnable [_x, false]} forEach [1600, 1601, 1602, 1603];
   _VehiclesArray = Player call _CreatePlayerVehicleArray;
   _VehiclesArrayServ = [_VehiclesArray, Side Player] call _SearchNearestService;
   _FillArray = _VehiclesArrayServ call _VehicleArrayShow;
 {
       private["_Vehicle", "_Text", "_Image", "_Name"];
  _Vehicle = _x select 0;
  _Text  = getText (configFile >>  "CfgVehicles" >> (typeOf _Vehicle) >> "displayName");
  _Image  = getText (configFile >>  "CfgVehicles" >> (typeOf _Vehicle) >> "picture");
  _Name  = if ((_x select 2) == "AI") then {
format["AI [%1]", _x select 1]} else {
_x select 2
};

      lnbAddRow   [1500, [str(_Vehicle),_Text,_Name]];
  lnbSetPicture  [1500, [_forEachIndex, 1], _Image ];
  lnbSetColor  [1500, [_forEachIndex, 2],if ((_x select 2) != "AI") then {
[0,1,0,1]}];
   } forEach _FillArray;
   if (count _FillArray > 0) then {
lnbSetCurSelRow [1500,0]
};

   uiNameSpace setVariable ["WFService_FillArray", _FillArray];

};

_SelectVehicle ={
 private["_Ctrl", "_Select", "_Vehicles", "_SelVehicle", "_Vehicle", "_VehDataInf", "_VehType", "_Cost", "_Money",   "_SerCosts"];
 _Ctrl  = _this select 0 select 0;
        _Select  = _this select 0 select 1;
        _Vehicles = uiNameSpace getvariable "WFService_FillArray";
  _SelVehicle = _Vehicles select _Select;
        _Vehicle = vehicle (_SelVehicle select 0);
      _Money  = (Player call GetPlayerSupplyMoney) select 1;
   _SerCosts = [0,0,0,0];
             _VehDataInf = (typeOf _Vehicle) call GetObjectInfFromData;
 _VehType = _VehDataInf select 1;
 _Cost  = _VehDataInf select 4;
       if (_SelVehicle select 3) then {
  private["_VehicleAmmoCfg"];
  _VehicleAmmoCfg = getArray (configFile >> "CfgVehicles" >> (typeOf _Vehicle) >> "Turrets" >> "MainTurret" >> "magazines");
    if (count _VehicleAmmoCfg > 0) then  {
   private["_VehicleAmmo", "_MagazinesCount", "_Percent", "_RearmCost"];
   _VehicleAmmo = magazines _Vehicle;
           _MagazinesCount = count (_VehicleAmmoCfg) - count (_VehicleAmmo);
    _Percent  = 100 / count (_VehicleAmmoCfg);
              _RearmCost  = (_MagazinesCount * _Percent) * (_Cost * 0.1 / 100) + 100;
              if (_Money >= _RearmCost) then   {
    ctrlEnable  [1600, true];
    ctrlSetText [1600, format["Rearm %1$", _RearmCost]];
    _SerCosts set [0, _RearmCost];
       
};

  
};

 
};

    if (_SelVehicle select 4) then {
  private["_Fuel", "_FuelCost"];
  _Fuel  = fuel _Vehicle;
  _FuelCost = if (_Fuel < 1) then {
(_Cost * 0.05)} else {
0
};

  _FuelCost = round (_FuelCost);
        if (_Money >= _FuelCost) then  {
   ctrlEnable  [1601, true];
   ctrlSetText [1601, format["Refuel %1$", _FuelCost]];
   _SerCosts set [1, _FuelCost];
     
};

 
};

   if (_SelVehicle select 5) then {
  private["_Dammage", "_DamCost"];
  _Dammage =  getDammage _Vehicle;
  _DamCost = round(_Cost * _Dammage);
      if (_Money >= _DamCost) then  {
   ctrlEnable  [1602, true];
   ctrlSetText [1602, format["Repair %1$", _DamCost]];
   _SerCosts set [2, _DamCost];
     
};

 
};

   if (_SelVehicle select 6) then {
  private["_Crew", "_HealCost"];
  _Crew  = crew _Vehicle;
  _HealCost = 0;
      {
   private["_UnitCost", "_UnitDam"];
   _UnitCost = (( typeOf vehicle _x) call GetObjectInfFromData) select 4;
   _UnitDam = getDammage _x;
   _HealCost = _HealCost + _UnitCost * _UnitDam;
  } forEach _Crew;
  _HealCost = round (_HealCost);
     if (_Money >= _HealCost) then  {
   ctrlEnable  [1603, true];
   ctrlSetText [1603, format["Heal %1$", _HealCost]];
   _SerCosts set [3, _HealCost];
  
};

 
};

    uiNameSpace setVariable ["WFService_Costs", _SerCosts];
 
};

_RearmVehicle ={
 private["_Cost", "_Select", "_SelVehicle", "_Vehicle", "_VehicleAmmoCfg"];
 _Cost  = (uiNameSpace getVariable "WFService_Costs") select 0;
 _Select  = lnbCurSelRow 1500;
 _SelVehicle = (uiNameSpace getvariable "WFService_FillArray") select _Select;
  _Vehicle = vehicle (_SelVehicle select 0);
            [Player, 0, - _Cost] call SetPlayerSupplyMoney;
   _VehicleAmmoCfg = getArray (configFile >> "CfgVehicles" >> (typeof _Vehicle) >> "Turrets" >> "MainTurret" >> "magazines");
   {
  _Vehicle removeMagazine _x;
 } forEach (magazines _Vehicle);
   {
  _Vehicle addMagazine _x;
  } forEach _VehicleAmmoCfg;
  hint "REARM";

};

_RefuelVehicle ={
 private["_Cost", "_Select", "_SelVehicle", "_Vehicle"];
 _Cost  = (uiNameSpace getVariable "WFService_Costs") select 1;
 _Select  = lnbCurSelRow 1500;
 _SelVehicle = (uiNameSpace getvariable "WFService_FillArray") select _Select;
  _Vehicle = vehicle (_SelVehicle select 0);
            [Player, 0, - _Cost] call SetPlayerSupplyMoney;
   _Vehicle setFuel 1;
  
};

_RepairVehicle ={
 private["_Cost", "_Select", "_SelVehicle", "_Vehicle"];
 _Cost  = (uiNameSpace getVariable "WFService_Costs") select 2;
 _Select  = lnbCurSelRow 1500;
 _SelVehicle = (uiNameSpace getvariable "WFService_FillArray") select _Select;
  _Vehicle = vehicle (_SelVehicle select 0);
            [Player, 0, - _Cost] call SetPlayerSupplyMoney;
   _Vehicle setDammage 0;
  
};

_HealVehicle ={
 private["_Cost", "_Select", "_SelVehicle", "_Vehicle"];
 _Cost  = (uiNameSpace getVariable "WFService_Costs") select 3;
 _Select  = lnbCurSelRow 1500;
 _SelVehicle = (uiNameSpace getvariable "WFService_FillArray") select _Select;
  _Vehicle = vehicle (_SelVehicle select 0);
            [Player, 0, - _Cost] call SetPlayerSupplyMoney;
   {
  _x setDammage 0;
 } forEach (crew _Vehicle);
  
};

_Function = switch (_Question) do{
    case "onLoad"   : {
_onLoad
};

 case "Click"   : {
_SelectVehicle
};

 case "Rearm"   : {
_RearmVehicle
};

 case "Refuel"   : {
_RefuelVehicle
};

 case "Repair"   : {
_RepairVehicle
};

 case "Heal"    : {
_HealVehicle
};


};

call _Function;
