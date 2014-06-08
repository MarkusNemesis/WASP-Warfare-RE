  private["_this", "_Question", "_Value", "_Function", "_result", "_Id", "_Name", "_Object", "_Commander", "_PlayerList", "_Sid", "_Uid"];
_PlayerList = + Public_PlayerList;
_Question = _this select 0;
_Value  = _this select 1;
_Id  ={
 private ["_IdResult"];
 _IdResult = [];
  {
   if (((typeName _x) == "ARRAY") && (count _x > 11)) then {
   if (_Value ==  _forEachIndex) exitWith {
_IdResult = _x
};

  
};

 } forEach _PlayerList;
 _IdResult
};

_Name ={
 private ["_NameResult", "_PlrName"];
 _NameResult = [];
  {
  if (((typeName _x) == "ARRAY") && (count _x > 11)) then {
   _PlrName = _x select 1;
   if (_Value == _PlrName) exitWith {
_NameResult = _x
};

  
};

 } forEach _PlayerList;
 _NameResult
};

_Object ={
 private ["_ObjResult", "_PlrObj"];
 _ObjResult = [];
  {
  if (((typeName _x) == "ARRAY") && (count _x > 11)) then {
   _PlrObj = _x select 2;
   if (_Value == _PlrObj) exitWith {
_ObjResult = _x
};

  
};

 } forEach _PlayerList;
 _ObjResult
};

_Commander ={
 private ["_ComResult", "_PlrCom", "_PlrSide"];
 _ComResult = [];
  {
  if (((typeName _x) == "ARRAY") && (count _x > 11)) then {
   _PlrSide = _x select 4;
   _PlrCom  = _x select 9;
   if (_PlrCom  && (_PlrSide == (side _Value))) exitWith {
_ComResult = _x
};

  
};

 } forEach _PlayerList;
 _ComResult
};

_Sid ={
 private ["_SidResult", "_PlrSID"];
 _SidResult = [];
  {
  if (((typeName _x) == "ARRAY") && (count _x > 11)) then {
   _PlrSID = _x select 10;
   if (_PlrSID == _Value) exitWith {
_SidResult = _x
};

  
};

 } forEach _PlayerList;
 _SidResult
};

_Uid ={
 private ["_UidResult", "_PlrUID"];
 _UidResult = [];
  {
  if (((typeName _x) == "ARRAY") && (count _x > 11)) then {
   _PlrUID = _x select 11;
   if (_PlrUID == _Value) exitWith {
_UidResult = _x
};

  
};

 } forEach _PlayerList;
 _UidResult
};

_Function = switch (_Question) do{
    case "Id"  : {
_Id
};

 case "Name"  : {
_Name
};

 case "Object" : {
_Object
};

 case "Commander": {
_Commander
};

 case "SID"  : {
_Sid
};

 case "UID"  : {
_Uid
};


};

_result = call _Function;
_result