 private["_TownCaptured", "_TownLost", "_TownEnemySpot", "_CampCaptured", "_CampLost", "_UpgradeStart",  "_UpgradeAvailable"];
  _TownCaptured  = {
 private["_this", "_TownName"];
 _TownName = (Public_TownsArray select _this) select 2;
 ["Green", "Town", format["<t size='1.2'>%1</t><br />Captured", _TownName], "", 0, -1, ""] spawn HintMSG_Complete;
 Player sideRadio "Town";
 Player sideRadio "Captured";

};

_TownLost   = {
 private["_this", "_TownName"];
 _TownName = (Public_TownsArray select _this) select 2;
 ["Red", "Town", format["<t size='1.2'>%1</t><br />Lost", _TownName], "", 0, -1, ""] spawn HintMSG_Complete;
 Player sideRadio "Town";
 Player sideRadio "Lost";

};

_TownEnemySpot  = {
 private["_this", "_TownName"];
 _TownName = (Public_TownsArray select _this) select 2;
 ["Blue", "Town", format["<t size='1.2'>Hostile detected near</t><br />%1", _TownName], "", 0, -1, ""] spawn HintMSG_Complete;
 Player sideRadio "Hostile";
 Player sideRadio "Town";

};

_CampCaptured  = {
 private["_this", "_TownName"];
 _TownName = (Public_TownsArray select _this) select 2;
 ["Green", "StrongPoint", format["StrongPoint Captured<br /><t size='1.2'>%1</t>", _TownName], "", 1, -1, ""] spawn HintMSG_Complete;
 Player sideRadio "StrongPoint";
 Player sideRadio "Captured";

};

_CampLost   = {
 private["_this", "_TownName"];
 _TownName = (Public_TownsArray select _this) select 2;
 ["Red", "StrongPoint", format["StrongPoint Lost<br /><t size='1.2'>%1</t>", _TownName], "", 1, -1, ""] spawn HintMSG_Complete;
 Player sideRadio "StrongPoint";
 Player sideRadio "Lost";

};

_UpgradeStart  = {

};

_UpgradeAvailable = {
 ["Yellow", "New Intel Available", format['<t size="1.2">%1</t><br />is Available', _this], "", 1, -1, ""] spawn HintMSG_Complete;
 Player sideRadio "NewIntel";

};

private["_MsgName", "_MsgData", "_Function"];
_MsgName = _this select 0;
_MsgData = _this select 1;
_Function = switch _MsgName do {
 case "TownCapt"  : {
_TownCaptured
};

 case "TownLost"  : {
_TownLost
};

 case "TownEnem"  : {
_TownEnemySpot
};

 case "CampCapt"  : {
_CampCaptured
};

 case "CampLost"  : {
_CampLost
};

 case "UpgradeS"  : {

};

 case "UpgradeA"  : {
_UpgradeAvailable
};


};

if (!isNil "_Function") then {
_MsgData call _Function
};

