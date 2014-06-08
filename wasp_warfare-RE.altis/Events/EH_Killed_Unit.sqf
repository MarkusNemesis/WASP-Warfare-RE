#include "EH_Functions.sqf"private ["_DeadBody","_Killer","_DeadBodyName","_Group","_Units", "_PlayersWhoKill", "_DeadBodyPrice",   "_DeadBodyEnemy"];
_DeadBody   = _this select 0;
_Killer   = _this select 1;
_DeadBodySide = _DeadBody call _GetDeadBodySide;
_DeadBodyName = getText (configFile >> "CfgVehicles" >> (typeof _DeadBody) >> "displayName");
_PlayersWhoKill = _Killer call _KillerManOrVehicleCrew;
_DeadBodyPrice = _DeadBody call _UnitPriceFromData;
_DeadBodyEnemy = if (side _Killer != _DeadBodySide) then {
	true
} else {
	false
};
if (_Killer != _DeadBody) then{
	if (count _PlayersWhoKill > 0) then {
		{
			private["_Price", "_Text", "_KisP", "_Text2"];
			_KisP = [_Killer, _x] call _KillerIsPlayer;
			_Price = (_DeadBodyPrice select 1) / (count _PlayersWhoKill);
			_Price = if (isPlayer _DeadBody) then {
				500
			} else {
				_Price
			};
			_Price = if (_DeadBodyEnemy) then {
				_Price
			} else {
				-_Price
			};
			_Text = if (_DeadBodyEnemy) then {
				"KILL"
			} else {
				"TEAM KILL"
			};
			_Text2 = if (_KisP) then {
				"YOU"
			} else {
				""
			};
			if (!isNull _x) then   {
				["Kill", _x, [_DeadBody, _Price, _DeadBodyEnemy, _KisP]] call Send_EventHandler;
			};
		} forEach _PlayersWhoKill;
	};
};
_DeadBody spawn _DeleteDeadBody;
