private["_AllMachines", "_AllPublicVar", "_MaxPC", "_PC", "_PrimeData", "_Text"];
_AllPublicVar = [      "Public_Supply", "Public_TownsArray", "Public_CampsArray", if (side Player == west) then {
"Public_VoteBF"} else {
"Public_VoteOF"}, if (side Player == west) then {
"Public_BaseAreaBF"} else {
"Public_BaseAreaOF"}, if (side Player == west) then {
"Public_UpgradesBF"} else {
"Public_UpgradesOF"}, if (side Player == west) then {
"Public_MHQ_BF"} else {
"Public_MHQ_OF"}, "Public_BuyTurn", "Public_VehMarkers"];
["Init_MPData.sqf", "Server Available"] spawn Fun_AddToLog;
_Text = "<t align='center' color='#00addd'>SERVER AVAILABLE</t><br />";
hint parseText _Text;
{
 missionNamespace setVariable [format["Done_%1", _x], false];
} forEach _AllPublicVar;
_Text = _Text + "<t align='center' color='#00addd'>PLAYERLIST RECEIVED</t><br />";
hint parseText _Text;
_AllMachines = ["Server"];
  _MaxPC  = count (_AllMachines) - 1;
_PC  = 0;
{
 private["_Machine"];
  waitUntil {
  _Machine = _AllMachines select _PC;
  _PC   = if (_PC >= _MaxPC) then {
0} else {
_PC + 1
};

  (typeName _Machine == "OBJECT") or (typeName _Machine == "STRING") 
};

    [_Machine, _x] call Send_Request;
 sleep 0.5;
} forEach _AllPublicVar;
["Init_MPData.sqf", "Server Data Request Sent, wait Answer"] spawn Fun_AddToLog;
_Text = _Text + "<t align='center' color='#00addd'>SERVER DATA REQEUST</t><br />";
hint parseText _Text;
waitUntil {
 private["_FullDataReceived", "_Done"];
 _FullDataReceived = true;
   {
  _Done = missionNamespace getVariable format["Done_%1", _x];
  if (!_Done) then {
_FullDataReceived = false} } forEach _AllPublicVar;
  sleep 1;
   _FullDataReceived
};

["Init_MPData.sqf", "Data Received"] spawn Fun_AddToLog;
_Text = _Text + "<t align='center' color='#00addd'>DATA RECEIVED</t><br />";
hint parseText _Text;
