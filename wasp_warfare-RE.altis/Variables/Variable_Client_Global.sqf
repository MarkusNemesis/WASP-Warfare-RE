Control_KeyPress    = [];
Control_MouseMove    = [];
Control_MousePress    = [];
Control_MouseZChange   = [];
Markers_Areas      = [];
Markers_Buildings     = [];
Markers_Vehicles    = [];
Markers_GroupUnits    = [];
GetTeamMoneyIncome     = compile preprocessFileLineNumbers "Functions\Get_Team_Money_Income.sqf";
GetConfigInfo     = compile preprocessFileLineNumbers "Functions\Get_Config_Info.sqf";
GetAIDigit      = compile preprocessFileLineNumbers "Functions\Get_AI_Digit.sqf";
GetObjectInfFromData   = compile preprocessFileLineNumbers "Functions\Get_ObjectInf.sqf";
PlayerInputControl    = compile preprocessFileLineNumbers "Functions\PlayerInputControl.sqf";
Create_Unit      = compile preprocessFileLineNumbers "Functions\Create_Unit.sqf";
Create_Vehicle     = compile preprocessFileLineNumbers "Functions\Create_Vehicle.sqf";
UnflipCar      = compile preprocessFileLineNumbers "Functions\Unflip_Car.sqf";
Get_Upgrade_Data    = compile preprocessFileLineNumbers "Functions\Get_Upgrade_Data.sqf";
Calculate_EnemyNear    = compile preprocessFileLineNumbers "Functions\EnemyNear.sqf";
Respawn_Update     = compile preprocessFileLineNumbers "Client\Respawn\Update_Respawn.sqf";
Respawn_CameraEffect   = compile preprocessFileLineNumbers "Client\Respawn\CameraEffect.sqf";
Respawn_Run      = compile preprocessFileLineNumbers "Client\Respawn\Respawn.sqf";
GUI_UpdateTurn     = compile preprocessFileLineNumbers "Functions\Show_Buy_TurnNumber.sqf";
ClientFSM_UpdateTownMarkers  = compile preprocessFileLineNumbers "Client\FSM\Markers_Towns.sqf";
ClientFSM_UpdateCampMarkers  = compile preprocessFileLineNumbers "Client\FSM\Markers_Camps.sqf";
ClientFSM_UpdateBldMarkers  = compile preprocessFileLineNumbers "Client\FSM\Markers_Buildings.sqf";
ClientFSM_UpdateMHQMarker  = compile preprocessFileLineNumbers "Client\FSM\Markers_MHQ.sqf";
ClientFSM_UpdateVehMarkers  = compile preprocessFileLineNumbers "Client\FSM\Markers_Vehicles.sqf";
ClientFSM_UpdatePlrMarkers  = compile preprocessFileLineNumbers "Client\FSM\Markers_Players.sqf";
ClientFSM_UpdateGroupMarkers = compile preprocessFileLineNumbers "Client\FSM\Markers_GroupUnits.sqf";
ClientFSM_UpdateAITL   = compile preprocessFileLineNumbers "Client\FSM\Markers_AITL.sqf";
ClientFSM_ProgressBar   = compile preprocessFileLineNumbers "Client\FSM\ProgressBar.sqf";
ClientFSM_EconomyBar   = compile preprocessFileLineNumbers "Client\FSM\EconomyBar.sqf";
ClientFSM_UpgradeBar   = compile preprocessFileLineNumbers "Client\FSM\UpgradeBar.sqf";
HintMSG_Complete    = compile preprocessFileLineNumbers "Functions\HintMSG_Complete.sqf";
HintMSG_KillPay     = compile preprocessFileLineNumbers "Functions\HintMSG_KillPay.sqf";
HintMSG_Pay      = compile preprocessFileLineNumbers "Functions\HintMSG_Pay.sqf";
Pay_Array      = [];
KillPay_Array     = [];
SayMSG_All      = compile preprocessFileLineNumbers "Functions\SayMSG_All.sqf";
// Markus - Temporary fix for the unit purchase overload issue
BuyButtonCooldown = time;
/// Markus
with missionNamespace do {
	if (isNil "MP_TeamUpgrades") then {
		MP_TeamUpgrades = 1
	};
};
