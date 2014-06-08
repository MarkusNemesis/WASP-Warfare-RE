[] call Compile preprocessFileLineNumbers "Variables\Variable_Server_Global.sqf";
["Server_Init.sqf", "Add Server Global Variable"] call Fun_AddToLog;
[] call Compile preprocessFileLineNumbers "Variables\Variable_Server_Public.sqf";
["Server_Init.sqf", "Add Public Variable"] call Fun_AddToLog;
onPlayerDisconnected "[_id, _name, _uid] call Compile preprocessFileLineNumbers 'Server\PlayerDisconnected.sqf'";
["Server_Init.sqf", "PlayerDisconnect Script"] call Fun_AddToLog;
[] call Compile preprocessFileLineNumbers "Server\Add_Towns_data.sqf";
["Server_Init.sqf", "Add Towns Data"] call Fun_AddToLog;
[] call Compile preprocessFileLineNumbers "Server\Add_Camp_data.sqf";
["Server_Init.sqf", "Add Camps Data"] call Fun_AddToLog;
[] call Compile preprocessFileLineNumbers "Server\Respawn_MHQ.sqf";
["Server_Init.sqf", "Choose base for sides, Respawn MHQ"] call Fun_AddToLog;
west call Compile preprocessFileLineNumbers "Server\Respawn_Vehicles.sqf";
east call Compile preprocessFileLineNumbers "Server\Respawn_Vehicles.sqf";
["Server_Init.sqf", "Respawn Vehicles near MHQ"] call Fun_AddToLog;
[] spawn Compile preprocessFileLineNumbers "Server\FSM\Server_Loop_Debug.sqf";
["Server_Init.sqf", "Debug loop - Spawn"] call Fun_AddToLog;
["Server_Init.sqf", "Main Server loop - Spawn"] call Fun_AddToLog;
[] spawn Compile preprocessFileLineNumbers "Server\FSM\Server_Loop.sqf";
["Server_Init.sqf", "Server loop"] call Fun_AddToLog;
[] spawn{
	sleep 40;
	_TimeEnd = Public_VoteBF select 1;
	if (_TimeEnd == -1) then {
		["Public_VoteBF", 0, [true,false,false], "nobody"] call Send_ArrayRow;
		["Public_VoteBF", 1, [true,false,false], Public_Time + (if (debug) then {
			20
		} else {
			60
		})] call Send_ArrayRow;
		["Public_VoteBF", 2, [true,false,false], []] call Send_ArrayRow;
		["Public_VoteBF", 3, [true,false,false], 1] call Send_ArrayRow;
		[west, [[], {
			createDialog 'WFVote'
		}], objNull] call Send_Run;
	};
	sleep 0.2;
	_TimeEnd = Public_VoteOF select 1;
	if (_TimeEnd == -1) then {
		["Public_VoteOF", 0, [false,true,false], "nobody"] call Send_ArrayRow;
		["Public_VoteOF", 1, [false,true,false], Public_Time + (if (debug) then {
			20
		} else {
			60
		})] call Send_ArrayRow;
		["Public_VoteOF", 2, [false,true,false], []] call Send_ArrayRow;
		["Public_VoteOF", 3, [false,true,false], 1] call Send_ArrayRow;
		[east, [[], {
			createDialog 'WFVote'
		}], objNull] call Send_Run;
	};
	["Server_Init.sqf", "Start vote for booth team"] call Fun_AddToLog;
};
[] call Compile preprocessFileLineNumbers "AI\AI_Init.sqf";
Public_ServerInit = true;
["Server_Init.sqf", "Server init Complete"] call Fun_AddToLog;
