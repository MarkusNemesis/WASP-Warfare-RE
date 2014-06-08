 private["_this", "_Camera", "_Unit", "_UnitPos", "_Time"];
_Unit  = _this select 0;
  _Time  = _this select 1;
  _UnitPos = getPosATL  _Unit;
  showCinemaBorder false;
               _Camera = "Camera" camCreate [_UnitPos select 0, _UnitPos select 1, 2];
   _Camera cameraEffect ["INTERNAL", "BACK TOP"];
         _Camera camSetTarget _Unit;
              _Camera camSetPos [_UnitPos select 0, _UnitPos select 1, _Time/2];
    _Camera camCommit _Time;
              cameraEffectEnableHUD false;
             10001 cutText ["","BLACK OUT",_Time*0.75];
          [_Unit, _Camera] spawn {
 private["_this", "_Unit", "_Camera"];
 _Unit  = _this select 0;
 _Camera = _this select 1;
 waitUntil {
  sleep 1;
  camCommitted _Camera   
};

 _Unit cameraEffect ["terminate","back"];
  10001 cutFadeOut 0.1;
      
};

