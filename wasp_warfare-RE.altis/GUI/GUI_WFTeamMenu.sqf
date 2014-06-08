private["_Question","_Side", "_Function", "_onLoad", "_VdTgOvChange", "_ChangeSliderParameters", "_FillUnitsList",  "_DeleteAI", "_FillPlayerListTransfer"];
_Question  = _this select 1;
_Side    = Side Player;
_ChangeSliderParameters ={
	private["_ViewDistance","_TerrainGrid", "_ViewObject"];
	_ViewDistance = profileNamespace getVariable "WF_Current_View_Distance";
	_TerrainGrid = profileNamespace getVariable "WF_Current_Terrain_Grid_View_Distance";
	_ViewObject  = profileNamespace getVariable "WF_Current_Object_View_Distance";
	sliderSetPosition [1900, _ViewDistance];
	sliderSetPosition [1901, _TerrainGrid];
	sliderSetPosition [1902, _ViewObject];
	ctrlSetText [1010, format["%1", _ViewDistance]];
	ctrlSetText [1011, format["%1", _TerrainGrid]];
	ctrlSetText [1012, format["%1", _ViewObject]];
};
_FillUnitsList ={
	private["_Units"];
	_Units = units (group Player);
	_Units = _Units - [Player];
	lbClear 1500;
	{
		private["_UnitName", "_VehicleN"];
		_UnitName = getText (configFile >> 'CfgVehicles' >> (typeOf _x) >> "displayName");
		_VehicleN = if (vehicle _x != _x) then {
			format ["(%1)", getText (configFile >> 'CfgVehicles' >> (typeOf (vehicle _x)) >> "displayName")]}   else {
			""
		};
		LbAdd [1500, format ["[%1] %2 %3",_x call Fun_GetUnitNumberGroup, _UnitName, _VehicleN]];
	} forEach _Units;
};
_PlayerListTransfer ={
	private[];
	_PlayerList = + Public_PlayerList;
	_FriendList = [];
	{
		private["_Side", "_InGame"];
		_Side = _x select 4;
		_InGame = _x select 3;
		if (_InGame && {
					side Player == _Side}) then {
			_FriendList set [count _FriendList, _x]
		};
	} forEach _PlayerList;
	_FriendList
};
_FillPlayerList ={
	private["_PlayerList"];
	_PlayerList = call _PlayerListTransfer;
	lbClear 1501;
	{ // Markus - Hide player from the list so that they cannot transfer to themselves. There's no need to have them in here anyway.
		if (_x select 1 != (name player)) then {
			LbAdd [1501, format ["[%1] %2", _forEachIndex, _x select 1]];
		};
		/// - Markus
	} forEach _PlayerList;
};
_UpgradeTransfer ={
	private["_PlrMoney", "_this"];
	_PlrMoney = _this;
	[] call _FillPlayerList;
	ctrlSetText [1009, format["%1$ [ %2$ ]", round (_PlrMoney / 2), round (_PlrMoney)]];
	sliderSetRange [1903, 0, _PlrMoney - 1];
	sliderSetPosition [1903, _PlrMoney / 2];
	sliderSetspeed [1903, 500, 10];
};
_onLoad ={
	uiNamespace setVariable ["WFDisplay_Team", (_this select 0) select 0];
	sliderSetRange [1900, 1000, 4000];
	sliderSetRange [1901, 1, 50];
	sliderSetRange [1902, 500, 3000];
	[] call _ChangeSliderParameters;
	[] call _FillUnitsList;
	((Player call GetPlayerSupplyMoney) select 1) call _UpgradeTransfer;
};
_VdTgOvChange ={
	private ["_Value", "_Idc"];
	_Idc  = ctrlIDC ((_this select 0) select 0);
	_Value  = round ((_this select 0) select 1);
	switch _Idc do {
	case 1900 : {
			setViewDistance _Value;
			profileNamespace setVariable ["WF_Current_View_Distance", _Value];
		};
	case 1901 : {
			setTerrainGrid _Value;
			profileNamespace setVariable ["WF_Current_Terrain_Grid_View_Distance", _Value];
		};
	case 1902 : {
			setObjectViewDistance _Value;
			profileNamespace setVariable ["WF_Current_Object_View_Distance", _Value];
		};
	};
	[] call _ChangeSliderParameters;
};
_DeleteAI ={
	private["_Select", "_Units"];
	_Select = lbCurSel 1500;
	if (_Select == -1) then {
		hint format["! NO ONE SELECTED !\nPlease select a Unit in the list who you want to delete"];
	} else {
		_Units = units (group Player);
		_Units = _Units - [Player];
		deleteVehicle (_Units select _Select);
		[] call _FillUnitsList;
	};
};
_SelectPlayer ={};
_SetMoney ={
	private["_MoneySel", "_PlrMoney"];
	_PlrMoney = (Player call GetPlayerSupplyMoney) select 1;
	_MoneySel = (_this select 0) select 1;
	ctrlSetText [1009, format["%1$ [ %2$ ]", round (_MoneySel), round (_PlrMoney)]];
};
_TransferMoneyS ={
	private["_Selected"];
	_Selected =  lbCurSel 1501;
	if (_Selected == -1) then {
		hint format["! NO ONE SELECTED !\nPlease select a player in the list of who you want to transfer your money"];
	} else {
		private["_SelInf", "_PlrTo", "_PlrFrom", "_Money"];
		_SelInf  = ([] call _PlayerListTransfer) select _Selected;
		_PlrTo  = ["UID", getPlayerUID ((_SelInf) select 2)] call GetPlayerInfo;
		_PlrFrom = ["UID", getPlayerUID Player] call GetPlayerInfo;
		_Money  = sliderPosition 1903;
		_Money = round (_Money);
		if (((Player call GetPlayerSupplyMoney) select 1) > _Money) then   {
			["Server", [[Player,_SelInf select 2, _Money], {
				_this spawn Fun_TransferMoney}], objNull] call Send_Run;
			["", format["You Sent Money for %1",name (_SelInf select 2)], - _Money] spawn HintMSG_Pay;
			((Player call GetPlayerSupplyMoney) select 1) call _UpgradeTransfer;
		}  else  {
			hint parseText format ["<t align='center' color='#ff0000'>%1</t><br /><t align='center'></t>", toUpper  "You do not have enough money"];
		};
	};
};
_Function = switch (_Question) do{
case "onLoad"   :{
		_onLoad
	};
case "VdTgOvChange"  :{
		_VdTgOvChange
	};
case "DeleteAI"   :{
		_DeleteAI
	};
case "SelectPlayer"  :{
		_SelectPlayer
	};
case "SetMoney"   :{
		_SetMoney
	};
case "Transfer"   :{
		_TransferMoneyS
	};
};
call _Function;
