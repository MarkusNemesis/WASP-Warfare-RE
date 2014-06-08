private["_AllSupply", "_WESTSupply", "_EASTSupply", "_PlayerList"];
_AllSupply  = + Public_Supply;
       _WESTSupply  = _AllSupply select 0;
      _EASTSupply  = _AllSupply select 1;
      _WESTPayment = west call Fun_CalculatePayment;
   _EASTPayment = east call Fun_CalculatePayment;
   _AllSupply   = [_WESTSupply + round(_WESTPayment select 0),_EASTSupply + round(_EASTPayment select 0)];
["Public_Supply", _AllSupply] call Send_All_Data;
 _PlayerList = + Public_PlayerList;
{
 private ["_Player","_PlayerSide","_InGame","_PlayerID","_PlayerM","_PlayerObj"];
   if (!isNil "_x") then  {
  private["_PlayerInfo", "_PlayerID", "_PlayerSide", "_InGame", "_PlayerM", "_PlayerObj"];
  _PlayerInfo     = _x;
 _PlayerID = _forEachIndex;
  _PlayerSide = _PlayerInfo select 4;
  _InGame  = _PlayerInfo select 3;
  _PlayerM = _PlayerInfo select 5;
  _PlayerObj = _PlayerInfo select 2;
    if (!isNil "_PlayerM") then    {
    if ((_PlayerSide == West) && _InGame) then {
    _PlayerM = _PlayerM + round(_WESTPayment select 1);
     _PlayerInfo set [5,_PlayerM];
    
};

   if ((_PlayerSide == East) && _InGame) then {
    _PlayerM = _PlayerM + round(_EASTPayment select 1);
    _PlayerInfo set [5,_PlayerM];
   
};

         _PlayerInfo call SetPlayerInfo;
    
};

 
};

} forEach _PlayerList;
