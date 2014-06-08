Private ["_Element", "_From","_Object"];
_Object = _this select 0;
_Element = _this select 1;
_From = if (count _this > 2) then {
_this select 2} else {
'CfgVehicles'
};

if (typeName _Object == 'OBJECT') then {
_Object = typeOf(_Object)
};

getText (configFile >> _From >> _Object >> _Element)