     private["_this", "_Question", "_Function", "_result", "_EnemySides", "_Vehicles", "_Man", "_Car", "_Boat", "_Tank", "_Heli", "_Plane"];
_Question = _this select 0;
 _Object  = _this select 1;
 _Range  = _this select 2;
 _EnemySides = _this select 3;
 _Man ={
 private ["_AllMan", "_Obj", "_Dis", "_Sides", "_Enemy"];
  _Obj = _this select 0;
  _Dis = _this select 1;
 _Sides = _this select 2;
 _AllMan = [];
 _Enemy = 0;
    _AllMan = nearestObjects [_Obj, ["Man"], _Dis];
  if (count(_AllMan) > 0) then {
  {
_Enemy = _Enemy + (_x countSide _AllMan);
} forEach _Sides;
 
};

 _Enemy
};

_Vehicles ={
  private ["_AllMan", "_AllVeh", "_Obj", "_Dis", "_Sides", "_Enemy"];
  _Obj = _this select 0;
  _Dis = _this select 1;
 _Sides = _this select 2;
 _Type = _this select 3;
 _Enemy = 0;
 _AllMan = [];
  _AllVeh = nearestObjects [_Obj, [_Type], _Dis];
   if (count (_AllVeh) > 0) then {
    {
if (count (crew _x) > 0) then {
_AllMan = _AllMan + (crew _x)
};

} forEach _AllVeh;
    {
_Enemy = _Enemy + (_x countSide _AllMan);
} forEach _Sides;
 
};

 _Enemy
};

_Car ={
 private["_Enemy", "_Obj", "_Dis", "_Sides", "_Type"];
 _Obj = _this select 0;
 _Dis = _this select 1;
 _Sides = _this select 2;
 _Enemy = 0;
 _Enemy = [_Obj, _Dis, _Sides, "Car"] call _Vehicles;
 _Enemy  = _Enemy + ([_Obj, _Dis, _Sides] call _Man);
 _Enemy
};

_Boat ={
 private["_Enemy", "_Obj", "_Dis", "_Sides", "_Type"];
 _Obj = _this select 0;
 _Dis = _this select 1;
 _Sides = _this select 2;
 _Enemy = 0;
 _Enemy = [_Obj, _Dis, _Sides, "Ship"] call _Vehicles;
 _Enemy  = _Enemy + ([_Obj, _Dis, _Sides, "Car"] call _Car);
 _Enemy
};

_Tank ={
 private["_Enemy", "_Obj", "_Dis", "_Sides", "_Type"];
 _Obj = _this select 0;
 _Dis = _this select 1;
 _Sides = _this select 2;
 _Enemy = 0;
 _Enemy = [_Obj, _Dis, _Sides, "Tank"] call _Vehicles;
 _Enemy  = _Enemy + ([_Obj, _Dis, _Sides, "Ship"] call _Boat);
 _Enemy
};

_Heli ={
 private["_Enemy", "_Obj", "_Dis", "_Sides", "_Type"];
 _Obj = _this select 0;
 _Dis = _this select 1;
 _Sides = _this select 2;
 _Enemy = 0;
 _Enemy = [_Obj, _Dis, _Sides, "Helicopter"] call _Vehicles;
 _Enemy  = _Enemy + ([_Obj, _Dis, _Sides, "Tank"] call _Tank);
 _Enemy
};

_Plane ={
 private["_Enemy", "_Obj", "_Dis", "_Sides", "_Type"];
 _Obj = _this select 0;
 _Dis = _this select 1;
 _Sides = _this select 2;
  _Enemy = 0;
 _Enemy = [_Obj, _Dis, _Sides, "Air"] call _Vehicles;
 _Enemy  = _Enemy + ([_Obj, _Dis, _Sides, "Helicopter"] call _Heli);
 _Enemy
};

_Function = switch (_Question) do{
    case "Man"  : {
_Man
};

 case "Car"  : {
_Car
};

 case "Boat"  : {
_Boat
};

 case "Tank"  : {
_Tank
};

 case "Heli"  : (_Heli);
 case "Plane" : (_Plane);

};

_result =  [_Object, _Range, _EnemySides] call _Function;
 _result 