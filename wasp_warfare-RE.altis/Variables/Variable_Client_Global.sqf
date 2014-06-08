Control_KeyPress    = [];
   Control_MouseMove    = [];
   Control_MousePress    = [];
   Control_MouseZChange   = [];
   Markers_Areas      = [];
   Markers_Buildings     = [];
   Markers_Vehicles    = [];
   Markers_GroupUnits    = [];
   GetTeamMoneyIncome     = Compile preprocessFileLineNumbers "Functions\Get_Team_Money_Income.sqf";
GetConfigInfo     = Compile preprocessFileLineNumbers "Functions\Get_Config_Info.sqf";
GetAIDigit      = Compile preprocessFileLineNumbers "Functions\Get_AI_Digit.sqf";
GetObjectInfFromData   = Compile preprocessFileLineNumbers "Functions\Get_ObjectInf.sqf";
PlayerInputControl    = Compile preprocessFileLineNumbers "Functions\PlayerInputControl.sqf";
Create_Unit      = Compile preprocessFileLineNumbers "Functions\Create_Unit.sqf";
 Create_Vehicle     = Compile preprocessFileLineNumbers "Functions\Create_Vehicle.sqf";
UnflipCar      = Compile preprocessFileLineNumbers "Functions\Unflip_Car.sqf";
Get_Upgrade_Data    = Compile preprocessFileLineNumbers "Functions\Get_Upgrade_Data.sqf";
Calculate_EnemyNear    = Compile preprocessFileLineNumbers "Functions\EnemyNear.sqf";
Respawn_Update     = Compile preprocessFileLineNumbers "Client\Respawn\Update_Respawn.sqf";
Respawn_CameraEffect   = Compile preprocessFileLineNumbers "Client\Respawn\CameraEffect.sqf";
Respawn_Run      = Compile preprocessFileLineNumbers "Client\Respawn\Respawn.sqf";
GUI_UpdateTurn     = Compile preprocessFileLineNumbers "Functions\Show_Buy_TurnNumber.sqf";
ClientFSM_UpdateTownMarkers  = Compile preprocessFileLineNumbers "Client\FSM\Markers_Towns.sqf";
ClientFSM_UpdateCampMarkers  = Compile preprocessFileLineNumbers "Client\FSM\Markers_Camps.sqf";
ClientFSM_UpdateBldMarkers  = Compile preprocessFileLineNumbers "Client\FSM\Markers_Buildings.sqf";
ClientFSM_UpdateMHQMarker  = Compile preprocessFileLineNumbers "Client\FSM\Markers_MHQ.sqf";
ClientFSM_UpdateVehMarkers  = Compile preprocessFileLineNumbers "Client\FSM\Markers_Vehicles.sqf";
ClientFSM_UpdatePlrMarkers  = Compile preprocessFileLineNumbers "Client\FSM\Markers_Players.sqf";
ClientFSM_UpdateGroupMarkers = Compile preprocessFileLineNumbers "Client\FSM\Markers_GroupUnits.sqf";
ClientFSM_UpdateAITL   = Compile preprocessFileLineNumbers "Client\FSM\Markers_AITL.sqf";
ClientFSM_ProgressBar   = Compile preprocessFileLineNumbers "Client\FSM\ProgressBar.sqf";
ClientFSM_EconomyBar   = Compile preprocessFileLineNumbers "Client\FSM\EconomyBar.sqf";
ClientFSM_UpgradeBar   = Compile preprocessFileLineNumbers "Client\FSM\UpgradeBar.sqf";
HintMSG_Complete    = Compile preprocessFileLineNumbers "Functions\HintMSG_Complete.sqf";
HintMSG_KillPay     = Compile preprocessFileLineNumbers "Functions\HintMSG_KillPay.sqf";
HintMSG_Pay      = Compile preprocessFileLineNumbers "Functions\HintMSG_Pay.sqf";
  Pay_Array      = [];
 KillPay_Array     = [];
 SayMSG_All      = Compile preprocessFileLineNumbers "Functions\SayMSG_All.sqf";
with missionNamespace do {
 if (isNil "MP_TeamUpgrades") then {
MP_TeamUpgrades = 1
};


};

