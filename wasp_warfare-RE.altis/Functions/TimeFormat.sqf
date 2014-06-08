 private["_TimeInSec", "_Hours", "_Minets", "_HT", "_MT", "_ST"];
 _TimeInSec = _this;
_Hours  = 0;
_Minets  = 0;
if ((_TimeInSec / 3600) > 1) then{
 _Hours  = floor (_TimeInSec / 3600);
 _TimeInSec = _TimeInSec - _Hours * 3600;

};

if ((_TimeInSec / 60) > 1) then{
 _Minets  = floor (_TimeInSec / 60);
 _TimeInSec = _TimeInSec - _Minets * 60;

};

_TimeInSec = floor (_TimeInSec);
 _HT = if (_Hours > 9)   then {
format["%1", _Hours]} else {
format["0%1", _Hours]
};

_MT = if (_Minets > 9)   then {
format[":%1", _Minets]} else {
format[":0%1", _Minets]
};

_ST = if (_TimeInSec > 9)  then {
format[":%1", _TimeInSec]} else {
format[":0%1", _TimeInSec]
};

[_Hours, _Minets, _TimeInSec, _HT+_MT+_ST]