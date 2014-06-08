  private ["_Sniper","_AT","_Repair","_MG","_Inf1","_Inf2","_Inf3","_Inf4","_this","_Guard","_All","_Random"];
 _Sniper = ["O_soldier_M_F","O_soldier_M_F","O_medic_F"];
   _AT  = ["O_Soldier_SL_F","O_Soldier_LAT_F","O_Soldier_LAT_F","O_Soldier_F","O_medic_F"];
  _Repair = ["O_soldier_exp_F","O_soldier_repair_F","O_soldier_repair_F","O_medic_F"];
  _MG  = ["O_Soldier_SL_F","O_Soldier_AR_F","O_Soldier_AR_F","O_Soldier_F","O_medic_F"];
  _Inf1 = ["O_Soldier_SL_F","O_Soldier_F","O_Soldier_F","O_Soldier_GL_F","O_medic_F"];
  _Inf2 = ["O_Soldier_SL_F","O_Soldier_AR_F","O_Soldier_LAT_F","O_Soldier_F","O_medic_F"];
  _Inf3 = ["O_Soldier_SL_F","O_Soldier_AR_F","O_soldier_M_F","O_Soldier_GL_F","O_medic_F"];
  _Inf4 = ["O_Soldier_SL_F","O_soldier_M_F","O_Soldier_LAT_F","O_Soldier_GL_F","O_medic_F"];
  _Guard = ["O_Soldier_SL_F","O_Soldier_LAT_F","O_medic_F"];
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