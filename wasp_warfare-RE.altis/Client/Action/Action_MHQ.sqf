private ["_this", "_CheckCommander", "_ActionText"];
_CheckCommander =  {
	private ["_this", "_reuslt", "_MHQ", "_Distance"];
	_PlayerInf  = ["Name", name Player] call GetPlayerInfo;
	_isCommander = if (count(_PlayerInf) > 0) then {
		_PlayerInf select 9} else  {
		false
	};
	_MHQ    = if (side _target == west) then {
		Public_MHQ_BF} else {
		Public_MHQ_OF
	};
	_Distance  = _MHQ distance _target;
	_isCommander && (Alive _MHQ) && (_Distance < 5)  
};
_ActionText = "<t color='#00ff00' align='left'>Build Base</t><t color='#00ff00' align='right'>[MHQ]  </t>";
_this addAction [_ActionText,Construction_Start,"", 6, true, true, "teamSwitchPrev",format ["_this Call %1", _CheckCommander]];
_LockUnlockScript ={
	private["_MHQ", "_Locked", "_Player"];
	_Player = _this select 0;
	_MHQ = if (vehicle _Player != _Player) then {
		vehicle _Player} else {
		cursorTarget
	};
	_Locked = switch (locked _MHQ) do {
	case 2 : {
			true
		};
	case 3 : {
			true
		};
		default   {
			false
		};
	};
	if (_Locked) then {
		["All", [_MHQ, {_this lock 0}], ObjNull] call Send_Run;
	}  else {
		["All", [_MHQ, {_this lock 2}], ObjNull] call Send_Run;
	};
};
_CheckLock ={
	private["_Player", "_Result", "_MHQ"];
	_Player  = _this;
	_MHQ = if (vehicle _Player != _Player) then {
		vehicle _Player} else {
		cursorTarget
	};
	_Result  = false;
	_Result = switch (locked _MHQ) do {
	case 2 : {
			true
		};
	case 3 : {
			true
		};
		default   {
			false
		};
	};
	_Result
};
_LockText = "<t color='#ffff00' align='left'>Lock</t><t color='#ffff00' align='right'>[MHQ]  </t>";
_UnLockText = "<t color='#ffff00' align='left'>UnLock</t><t color='#ffff00' align='right'>[MHQ]  </t>";
_this addAction [_LockText, _LockUnlockScript, "", 6, true, true,"teamSwitchPrev",  format["(!(_this call %1) && (_this call %2))", _CheckLock, _CheckCommander]];
_this addAction [_UnLockText, _LockUnlockScript, "", 6, true, true, "teamSwitchPrev", format["((_this call %1) && (_this call %2))", _CheckLock, _CheckCommander]];
_CanRestoreMHQ ={
	private["_Player", "_MHQ", "_SideMHQ", "_RepTruck", "_Distance"];
	_Player  = _this;
	_MHQ  = cursorTarget;
	_SideMHQ = if ((side _Player) == west) then {
		Public_MHQ_BF} else {
		Public_MHQ_OF
	};
	_RepTruck = nearestObjects [player, ["B_Truck_01_Repair_F","I_Truck_02_box_F","O_Truck_02_box_F"], 30];
	_Distance = _Player distance _MHQ;
	_isMHQ  = if (_MHQ == _SideMHQ) then {
		true} else {
		false
	};
	_isNear  = if (_Distance < 10) then {
		true} else {
		false
	};
	_isRepair = if (count _RepTruck > 0) then {
		true} else {
		false
	};
	(_isMHQ && _isRepair && _isNear && !Alive _MHQ)
};
_RestoreMHQScript ={
	private["_SupMon", "_Supply", "_Money", "_CanPay", "_MHQVar", "_SCost", "_MCost"];
	_SupMon  = Player call GetPlayerSupplyMoney;
	_Supply  = _SupMon select 0;
	_Money  = _SupMon select 1;
	_MHQVar  = if ((side Player) == west) then {
		"Public_MHQ_BF"} else {
		"Public_MHQ_OF"
	};
	_SCost  = 3000;
	_MCost  = 5000;
	_CanPay  = if ((_Supply >= _SCost) && (_Money >= _MCost)) then {
		true} else {
		false
	};
	if (_CanPay) then {
		private["_MHQ", "_MHQType", "_MHQPos", "_MHQDir"];
		_MHQ  = cursorTarget;
		_MHQType = typeOf _MHQ;
		_MHQPos  = getPosASL _MHQ;
		_MHQDir  = getDir _MHQ;
		deleteVehicle _MHQ;
		hint parseText "<t align='center'><t color='#00ff00'>MHQ RESTORE A <t color='#ffff00'>1</t> MIN</t>";
		sleep 60;
		_MHQ = _MHQType createVehicle _MHQPos;
		_MHQ setDir _MHQDir;
		_MHQ setPosASL [_MHQPos select 0, _MHQPos select 1,  (getTerrainHeightASL [_MHQPos select 0, _MHQPos select 1])];
		_MHQ setVectorUp (surfaceNormal _MHQPos);
		missionNamespace setVariable [_MHQVar, _MHQ];
		[_MHQVar, _MHQ] call Send_All_Data;
	} else {
		hint parseText format["<t align='center'><t color='#ff0000'>YOU HAVE NOT ENOUGH FUNDS</t><br /><t >YOU NEED:</t><br /><t color='#ffe600'>%1S</t> / <t color='#00ff00'>%2$</t></t>", _SCost, _MCost];
	};
};
_this addAction ["<t color='#ffff00'>Restore<t align='right'>[MHQ]</t></t>", _RestoreMHQScript,"", 6, true, true,"teamSwitchPrev", format["_this call %1", _CanRestoreMHQ]];
