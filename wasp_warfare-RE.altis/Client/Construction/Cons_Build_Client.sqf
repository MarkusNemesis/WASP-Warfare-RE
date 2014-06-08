  private["_Parameters", "_Script", "_ObjectType", "_SupplyCost", "_MoneyCost"];
_Parameters  = _this + [Player];
_Script   = {
_this spawn Construction_Build_Server
};

_ObjectType  = (_this select 0) select 0;
["Server", [_Parameters, _Script], Player] call Send_Run;
_SupplyCost = (_this select 0) select 1;
_MoneyCost = (_this select 0) select 2;
[Player, -_SupplyCost, - _MoneyCost] call SetPlayerSupplyMoney;
_ObjectType spawn {
 sleep 0.2;
 if ((_this == "Flag_NATO_F") || (_this == "Flag_CSAT_F")) then {
 [] call Construction_Exit}
};

