private ["_this", "_StPos" ,"_EndPos" ,"_WhatBuild" ,"_size" ,"_dir" ,"_disM" ,"_num" ,"_dis" ,"_pos" ,"_obj" ,"_help" ,"_up" ,"_down", "_HelpObj"];
_StPos      = _this select 0;
_EndPos     = _this select 1;
_WhatBuild  = _this select 2;
_size       = _this select 3;
_down      = _this select 4;
_HelpObj  = Cons_Array select 7;
_dir  = ((_EndPos select 0) - (_StPos select 0)) atan2 ((_EndPos select 1) - (_StPos select 1));
_disM = _StPos distance _EndPos;
_num  = (_disM - (_size/2)) / _size;
_dis = _size/2;
for "_i" from 1 to (_num) do   {
	_pos = [(_StPos select 0) + sin _dir * _dis, (_StPos select 1) + cos _dir * _dis,(_StPos select 2) - _down];
	_obj = _WhatBuild createVehicleLocal (_pos);
	_help = "Land_HelipadCircle_F" createVehicleLocaL (_pos);
	_help setPosATL  _pos;
	_up = vectorUp _help;
	deleteVehicle _help;
	_obj setPosATL _pos;
	_obj setDir (_dir-90);
	_obj setVectorUp _up;
	_dis = _dis + _size;
	_obj setObjectTexture [0,'#(argb,8,8,3)color(1,0,0,0.2)'];
	_HelpObj set[count(_HelpObj),_obj];
};
_dis = _disM - _size/2;
_pos = [(_StPos select 0) + sin _dir * _dis, (_StPos select 1) + cos _dir * _dis,(_StPos select 2) - _down];
_obj = _WhatBuild createVehicleLocal (_pos);
_help = "Land_HelipadCircle_F" createVehicleLocal (_pos);
_help setPosATL  _pos;
_up = vectorUp _help;
deleteVehicle _help;
_obj setPosATL _pos;
_obj setDir (_dir-90);
_obj setVectorUp _up;
_obj setObjectTexture [0,'#(argb,8,8,3)color(1,0,0,0.2)'];
_HelpObj set[count(_HelpObj),_obj];
Cons_Array set [7,_HelpObj];
