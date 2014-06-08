sleep 7;
waitUntil {
["Server", "Public_ServerInit", Player] call Send_Request;
 Public_ServerInit
};

[] call Compile preprocessFileLineNumbers "Variables\Variable_Client_Global.sqf";
[] call Compile preprocessFileLineNumbers "Client\Init\Init_PlayerInf.sqf";
[] call Compile preprocessFileLineNumbers "Client\Init\Init_MPData.sqf";
[] call Compile preprocessFileLineNumbers "Client\Init\Init_SetViewDistance.sqf";
[] call Compile preprocessFileLineNumbers "Client\Init\Init_Respawn.sqf";
[] call Compile preprocessFileLineNumbers "Client\Init\Init_Markers.sqf";
[] call Compile preprocessFileLineNumbers "Client\Init\Init_KeyPress.sqf";
[] spawn Compile preprocessFileLineNumbers "Client\Respawn\Respawn.sqf";
[] spawn Compile preprocessFileLineNumbers "Client\FSM\Client_Loop.sqf";
12452 cutText ["","BLACK IN",2];
