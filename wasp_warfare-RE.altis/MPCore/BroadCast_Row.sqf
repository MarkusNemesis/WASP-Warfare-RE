private["_VariableName", "_ArrayRow", "_Data", "_LocalVariable", "_AccessArray", "_VarRowArray"];
_VariableName = _this select 0;
_ArrayRow  = _this select 1;
_AccessArray = _this select 2;
_Data   = _this select 3;
_LocalVariable = MissionNameSpace getVariable _VariableName;
if (typeName (_ArrayRow) == "STRING") then {if (toLower(_ArrayRow) == "end") then {_ArrayRow = count(_LocalVariable)}};
_LocalVariable  set [_ArrayRow, _Data];
MissionNameSpace setVariable [_VariableName, _LocalVariable];
if (isMultiplayer) then{
	Packet_ArrayRow = [ _VariableName, _ArrayRow, _Data];
	{
		private["_PlayerObj", "_PlayerInGame", "_PlayerSide", "_Access"];
		_PlayerObj  = _x select 2;
		_PlayerInGame = _x select 3;
		_Access   = switch (side _PlayerObj) do   {
		case west   : {
				_AccessArray select 0
			};
		case east   : {
				_AccessArray select 1
			};
		case resistance  : {
				_AccessArray select 2
			};
		};
		if ((isPlayer _PlayerObj) && _PlayerInGame && _Access) then {
			(owner _PlayerObj) publicVariableClient "Packet_ArrayRow";
		};
	} forEach Public_PlayerList;
	if (!isDedicated) then {
		publicVariableServer "Packet_ArrayRow";
	};
	diag_log format["Packet_ArrayRow From: %1 Access: %2 Data: %3", if (isDedicated) then {"Server"} else {name Player}, _AccessArray, Packet_ArrayRow];
};
