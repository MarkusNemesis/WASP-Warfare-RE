 private ["_this", "_Module", "_Text", "_Time", "_Fps", "_FullText"];
_Module  = format["%1:", _this select 0];
_Text  = _this select 1;
_Time  = (diag_tickTime call Fun_NormalTimeFormat) select 3;
_FullText = format[">>> %1 %2 %3", _Time, _Module, _Text];
diag_log _FullText;
