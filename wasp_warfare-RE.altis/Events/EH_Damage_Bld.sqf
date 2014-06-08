 private[];
 _OldDamage = _this select 2;
_Damage  = _OldDamage * 0.40;
if (_OldDamage > 0) then {
hint format["Hit\nOld: %1\nNew: %2", _OldDamage, _Damage]
};

_Damage