KK_fnc_distanceASL = {
 private ["_v0","_v1"];
 _v0 = _this select 0;
 _v1 = _this select 1;
 sqrt ( ((_v0 select 0) - (_v1 select 0)) ^ 2 + ((_v0 select 1) - (_v1 select 1)) ^ 2 + ((_v0 select 2) - (_v1 select 2)) ^ 2 ) 
};

