Public_ServerInit  = false;
   Public_PlayerList  = [];
    Public_Supply   = [];
    Public_TownsArray  = [];
    Public_CampsArray  = [];
     Public_VoteBF   = [];
    Public_VoteOF   = [];
    Public_BaseAreaBF  = [];
    Public_BaseAreaOF  = [];
    Public_BuyTurn   = [];
    Public_BuyTurnNumber = [];
    Public_VehMarkers  = [];
    Public_UpgradesBF  = [];
    Public_UpgradesOF  = [];
    Public_MHQ_BF   = west_mhq;
 west_mhq = nil;
Public_MHQ_OF   = east_mhq;
 east_mhq = nil;
Public_Time    = 0;
    AreaRadius    = 100;
    Debug     = false;
    GameOver     = false;
   Garbage_TimeMark  = if (Debug) then {
10} else {
30
};

    Garbage_TimeDelete  = if (Debug) then {
300} else {
600
};

    Data_B     = compile preprocessFileLineNumbers "Data\Data_Units.sqf";
Data_LF     = compile preprocessFileLineNumbers "Data\Data_LVehicles.sqf";
Data_HF     = compile preprocessFileLineNumbers "Data\Data_HVehicles.sqf";
Data_AF     = compile preprocessFileLineNumbers "Data\Data_AVehicles.sqf";
Data_BF     = compile preprocessFileLineNumbers "Data\Data_BVehicles.sqf";
Data_TC     = compile preprocessFileLineNumbers "Data\Data_TVehicles.sqf";
Data_Cons    = compile preprocessFileLineNumbers "Data\Data_Construction.sqf";
Data_Ambulance   = compile preprocessFileLineNumbers "Data\Data_Ambulance.sqf";
GetPlayerInfo   = Compile preprocessFileLineNumbers "Functions\Get_PlayerInfo.sqf";
SetPlayerInfo   = Compile preprocessFileLineNumbers "Functions\Set_PlayerInfo.sqf";
SetPlayerSupplyMoney = Compile preprocessFileLineNumbers "Functions\Set_Supply_Money.sqf";
GetPlayerSupplyMoney = Compile preprocessFileLineNumbers "Functions\Get_Supply_Money.sqf";
DeleteNVG    = Compile preprocessFileLineNumbers "Functions\Delete_NVG.sqf";
GetEquipment   = Compile preprocessFileLineNumbers "Functions\Get_Equipment.sqf";
SetEquipment   = Compile preprocessFileLineNumbers "Functions\Set_Equipment.sqf";
 EH_KilledVehicle  = Compile preprocessFileLineNumbers "Events\EH_Killed_Vehicle.sqf";
EH_KilledUnit   = Compile preprocessFileLineNumbers "Events\EH_Killed_Unit.sqf";
EH_KilledHQ    = Compile preprocessFileLineNumbers "Events\EH_Killed_HQ.sqf";
EH_KIlledBld   = Compile preprocessFileLineNumbers "Events\EH_Killed_Bld.sqf";
EH_Respawn    = Compile preprocessFileLineNumbers "Events\EH_Respawn.sqf";
 EH_DamageHQ    = Compile preprocessFileLineNumbers "Events\EH_Damage_HQ.sqf";
EH_DamageBld   = Compile preprocessFileLineNumbers "Events\EH_Damage_Bld.sqf";
Fun_NormalTimeFormat = Compile preprocessFileLineNumbers "Functions\TimeFormat.sqf";
Fun_AddToLog   = Compile preprocessFileLineNumbers "Functions\AddToLog.sqf";
   Fun_AreasAndBuildings = Compile preprocessFileLineNumbers  "Functions\All_Area_Bld.sqf";
Fun_GetUnitNumberGroup = Compile preprocessFileLineNumbers  "Functions\Get_UnitNumberInGroup.sqf";
Fun_GetBldInf   = Compile preprocessFileLineNumbers "Functions\Get_BuildingInf.sqf";
Fun_GetAllAreaAndBld = Compile preprocessFileLineNumbers "Functions\All_Area_Bld.sqf";
Fun_GetRespawnPoints = Compile preprocessFileLineNumbers "Functions\Get_RespawnPoint.sqf";
 Fun_CalculatePayment = Compile preprocessFileLineNumbers "Functions\Math_Payment.sqf";
Fun_CalcRandomRespawn = Compile preprocessFileLineNumbers "Functions\Math_RandomRespawn.sqf";
Fun_CalcDirection  = Compile preprocessFileLineNumbers "Functions\Math_Direction.sqf";
