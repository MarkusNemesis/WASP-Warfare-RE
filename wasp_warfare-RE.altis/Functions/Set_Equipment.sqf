private["_this", "_Equipment", "_Prime", "_Second", "_HandGun", "_Uniform", "_Vest", "_BackPack", "_Helmet", "_Goggles",  "_BasicItem", "_GetCfgName"];
_Unit  = _this select 0;
_Equipment = _this select 1;
_Prime  = _Equipment select 0;
_Second  = _Equipment select 1;
_HandGun = _Equipment select 2;
_Uniform = _Equipment select 3;
_Vest  = _Equipment select 4;
_BackPack = _Equipment select 5;
_Helmet  = _Equipment select 6;
_Goggles = _Equipment select 7;
_BasicItem = _Equipment select 8;
if (isnil ("_BasicItem")) then {
	_BasicItem = []
};
_GetCfgName ={
	private["_this", "_CfgName"];
	_CfgName = switch (true) do  {
	case (isClass (configFile >> "cfgVehicles" >> _this)) : {
			"cfgVehicles"
		};
	case (isClass (configFile >> "CfgWeapons" >> _this)) : {
			"CfgWeapons"
		};
	case (isClass (configFile >> "CfgMagazines" >> _this)) : {
			"CfgMagazines"
		};
	case (isClass (configFile >> "CfgGlasses" >> _this)) : {
			"CfgGlasses"
		};
	};
	_CfgName
};
removeAllItemsWithMagazines _Unit;
if(primaryWeapon _Unit   != "") then {
	_Unit removeWeapon (primaryWeapon _Unit)
};
if(secondaryWeapon _Unit  != "") then {
	_Unit removeWeapon (secondaryWeapon _Unit)
};
if(handGunWeapon _Unit   != "") then {
	_Unit removeWeapon (handGunWeapon _Unit)
};
if(uniform _Unit    != "") then {
	removeUniform _Unit
};
if(vest _Unit     != "") then {
	removeVest _Unit
};
if(backpack _Unit    != "") then {
	removebackpack _Unit
};
removeAllAssignedItems _Unit;
if ((_Uniform select 0) != "") then  {
	_Unit addUniform (_Uniform select 0);
	if (count (_Uniform select 1) > 0) then {
		{
			if ((_x != "") && (_Unit canAddItemToUniform _x)) then    {
				switch (_x call _GetCfgName) do     {
				case "CfgMagazines" : {
						(uniformContainer _Unit) addMagazineCargoGlobal [_x, 1]
					};
					default      {
						_Unit addItemToUniform _x
					};
				};
			};
		} forEach (_Uniform select 1);
	};
};
if ((_Vest select 0) != "") then  {
	_Unit addVest (_Vest select 0);
	if (count (_Vest select 1) > 0) then {
		{
			if ((_x != "") && (_Unit canAddItemToVest _x)) then    {
				switch (_x call _GetCfgName) do     {
				case "CfgMagazines" : {
						(vestContainer _Unit) addMagazineCargoGlobal [_x, 1]
					};
					default      {
						_Unit addItemToVest _x
					};
				};
			};
		} forEach (_Vest select 1);
	};
};
if ((_BackPack select 0) != "") then  {
	private["_OldBackPack"];
	_oldBackPack = unitBackpack _Unit;
	removeBackpack _Unit;
	deleteVehicle _OldBackPack;
	_Unit addBackpack (_BackPack select 0);
	if (count (_BackPack select 1) > 0) then {
		{
			if ((_x != "") && (_Unit canAddItemToBackpack _x)) then    {
				switch (_x call _GetCfgName) do     {
				case "CfgMagazines" : {
						(backpackContainer _Unit) addMagazineCargoGlobal [_x, 1]
					};
					default      {
						_Unit addItemToBackpack _x
					};
				};
			};
		} forEach (_BackPack select 1);
	};
};
if ((_Prime select 0) != "") then{
	if (count(_Prime select 2) > 0) then {
		_Unit addMagazine ((_Prime select 2) select 0);
	};
	_Unit addWeapon (_Prime select 0);
	{
		if (_x != "") then  {
			_Unit addPrimaryWeaponItem _x;
		};
	} forEach (_Prime select 1);
	reload _Unit;
};
if ((_Second select 0) != "") then{
	if (count(_Second select 2) > 0) then {
		_Unit addMagazine ((_Second select 2) select 0);
	};
	_Unit addWeapon (_Second select 0);
	{
		if (_x != "") then  {
			_Unit addSecondaryWeaponItem _x;
		};
	} forEach (_Second select 1);
	reload _Unit;
};
if ((_HandGun select 0) != "") then{
	if (count(_HandGun select 2) > 0) then {
		_Unit addMagazine ((_HandGun select 2) select 0);
	};
	_Unit addWeapon (_HandGun select 0);
	{
		if (_x != "") then  {
			_Unit addHandgunItem _x;
		};
	} forEach (_HandGun select 1);
	reload _Unit;
};
if (_Helmet != "") then{
	_Unit addHeadgear _Helmet;
};
if (_Goggles != "") then{
	_Unit addGoggles _Goggles;
};
if (count(_BasicItem) > 0) then{
	private["_RemoveItems"];
	_RemoveItems = assignedItems _Unit;
	{
		_Unit unassignItem _x;
		_Unit removeItem _x;
	} forEach _RemoveItems;
	{
		if (_x in ["Binocular", "Rangefinder", "Laserdesignator"]) then  {
			_Unit addWeapon _x;
			_Unit assignItem _x;
		}  else  {
			_Unit addItem _x;
			_Unit assignItem _x;
		};
	} forEach _BasicItem;
};
