private["_BasePos", "_BSide", "_BBase", "_BlueForPos", "_OSide", "_Obase", "_OpforPos"];
 _BasePos = [ ["basepos_1", "basepos_2", "basepos_3", "basepos_4"],   ["basepos_5", "basepos_6", "basepos_7", "basepos_8"]     ];
    _BSide   = floor (random 1);
_BBase  = floor (random 3);
_BlueForPos = getMarkerPos((_BasePos select _BSide) select _BBase);
 _OSide  = 0;
if (_BSide == 0) then {
_OSide = 1} else {
_OSide = 0
};

  _Obase  = floor random (3);
 _OpforPos = getMarkerPos((_BasePos select _OSide) select _Obase);
 Public_MHQ_BF setPosATL _BlueForPos;
Public_MHQ_OF setPosATL _OpforPos;
Public_MHQ_BF lock 2;
Public_MHQ_OF lock 2;
 Public_MHQ_BF addEventHandler ["Killed",{
_this call EH_KilledHQ}];
Public_MHQ_OF addEventHandler ["Killed",{
_this call EH_KilledHQ}];
 Public_MHQ_BF addEventHandler ["HandleDamage",{
_this call EH_DamageHQ}];
Public_MHQ_OF addEventHandler ["HandleDamage",{
_this call EH_DamageHQ}];
 