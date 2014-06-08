 private["_Unit", "_Equpment", "_Prime", "_Second", "_HandGun", "_Uniform", "_Vest", "_BackPack", "_Helmet", "_Goggles", "_BasicItem"];
_Unit  = _this;
_Prime  = ["", ["","",""], []];
  _Second  = ["", ["","",""], []];
  _HandGun = ["", ["","",""], []];
  _Uniform = ["", [], 0];
    _Vest  = ["", [], 0];
    _BackPack = ["", [], 0];
     _Helmet  = "";
      _Goggles = "";
      _BasicItem = [];
       private["_Rifle", "_RPG", "_Pistol", "_UniformA", "_VestA", "_BackPackA"];
_Rifle = primaryWeapon _Unit;
if (_Rifle != "") then {
_Prime = [_Rifle, primaryWeaponItems _Unit, primaryWeaponMagazine _Unit]
};

_RPG = secondaryWeapon  _Unit;
if (_RPG != "") then {
_Second = [_RPG, secondaryWeaponItems _Unit, secondaryWeaponMagazine _Unit]
};

_Pistol = handgunWeapon _Unit;
if (_Pistol != "") then {
_HandGun = [_Pistol, handgunItems _Unit, handgunMagazine _Unit]
};

_UniformA = uniform _Unit;
if (_UniformA != "") then {
_Uniform = [_UniformA, uniformItems _Unit, loadUniform _Unit]
};

_VestA = vest _Unit;
if (_VestA != "") then {
_Vest = [_VestA, vestItems _Unit, loadVest _Unit]
};

_BackPackA = backpack _Unit;
if (_BackPackA != "") then {
_BackPack = [_BackPackA, backpackItems _Unit, loadBackpack _Unit]
};

_Helmet = headgear _Unit;
_Goggles = goggles _Unit;
_BasicItem = assignedItems _Unit;
   _Equpment = [_Prime, _Second, _HandGun, _Uniform, _Vest, _BackPack, _Helmet, _Goggles, _BasicItem, load _Unit];
_Equpment