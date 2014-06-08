 private ["_Sniper","_AT","_Repair","_MG","_Inf1","_Inf2","_Inf3","_Inf4","_this","_Guard","_All","_Random"];
_Sniper = ["B_soldier_M_F","B_soldier_M_F","B_medic_F"];
            _AT  = ["B_Soldier_SL_F","B_Soldier_LAT_F","B_Soldier_LAT_F","B_Soldier_F","B_medic_F"];
  _Repair = ["B_soldier_exp_F","B_soldier_repair_F","B_soldier_repair_F","B_medic_F"];
   _MG  = ["B_Soldier_SL_F","B_Soldier_AR_F","B_Soldier_AR_F","B_Soldier_F","B_medic_F"];
   _Inf1 = ["B_Soldier_SL_F","B_Soldier_F","B_Soldier_F","B_Soldier_GL_F","B_medic_F"];
   _Inf2 = ["B_Soldier_SL_F","B_Soldier_AR_F","B_Soldier_LAT_F","B_Soldier_F","B_medic_F"];
   _Inf3 = ["B_Soldier_SL_F","B_Soldier_AR_F","B_soldier_M_F","B_Soldier_GL_F","B_medic_F"];
  _Inf4 = ["B_Soldier_SL_F","B_soldier_M_F","B_Soldier_LAT_F","B_Soldier_GL_F","B_medic_F"];
  _Guard = ["B_Soldier_F","B_Soldier_LAT_F"];
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

 case "Random" : {
_Random
};


};

_result