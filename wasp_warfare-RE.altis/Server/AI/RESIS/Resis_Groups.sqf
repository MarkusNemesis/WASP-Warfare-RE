 private ["_Sniper","_AT","_Repair","_MG","_Inf1","_Inf2","_Inf3","_Inf4","_this","_Guard","_All","_Random"];
_Sniper = ["I_Sniper_F"   ,"I_Spotter_F"   ,"I_medic_F"  ];
            _AT  = ["I_Soldier_SL_F"  ,"I_Soldier_AT_F"  ,"I_Soldier_LAT_F" ,"I_Soldier_AAT_F" ,"I_medic_F"];
   _Repair = ["I_Soldier_exp_F" ,"I_Soldier_repair_F" ,"I_engineer_F"  ,"I_medic_F"  ];
      _MG  = ["I_Soldier_SL_F"  ,"I_Soldier_AR_F"  ,"I_Soldier_AR_F" ,"I_Soldier_AAR_F" ,"I_medic_F"];
    _Inf1 = ["I_Soldier_SL_F"  ,"I_Soldier_F"   ,"I_Soldier_F"  ,"I_Soldier_GL_F" ,"I_medic_F"];
   _Inf2 = ["I_Soldier_SL_F"  ,"I_Soldier_AR_F"  ,"I_Soldier_LAT_F" ,"I_Soldier_F"  ,"I_medic_F"];
    _Inf3 = ["I_Soldier_SL_F"  ,"I_Soldier_AR_F"  ,"I_soldier_M_F" ,"I_Soldier_GL_F" ,"I_medic_F"];
    _Inf4 = ["I_Soldier_SL_F"  ,"I_soldier_M_F"  ,"I_Soldier_LAT_F" ,"I_Soldier_GL_F" ,"I_medic_F"];
    _Guard = ["I_Soldier_SL_F"  ,"I_Soldier_LAT_F"  ,"I_Soldier_M_F" ];
            _Guard2 = ["I_Soldier_SL_F"  ,"I_Soldier_LAT_F"  ,"I_Soldier_AR_F" ];
           _All = [_Sniper,_AT,_Repair,_MG,_Inf1,_Inf2,_Inf3,_Inf4];
                 _Random = _All select (random(count(_All)-1));
 _result = switch (_this) do{
    case "Sniper" : {
_Sniper
};

    case "AT"  : {
_AT
};

 case "Repair" : {
_Repair
};

 case "MG"  : {
_MG
};

 case "Inf1"  : {
_Inf1
};

 case "Inf2"  : {
_Inf2
};

 case "Inf3"  : {
_Inf3
};

 case "Inf4"  : {
_Inf4
};

 case "Guard" : {
_Guard
};

 case "Guard2" : {
_Guard2
};

 case "Random" : {
_Random
};


};

_result