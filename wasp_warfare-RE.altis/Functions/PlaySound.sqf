private["_TownCaptured"];
_TownCaptured ={
 Player sideRadio "Town";
 Player sideRadio "Captured";

};

_TownHostile ={
 Player sideRadio "Hostile";
 Player sideRadio "Town";

};

_TownUnderAttack ={
 Player sideRadio "Town";
 Player sideRadio "Underattack";

};

_TownLost ={
 Player sideRadio "Town";
 Player sideRadio "Lost";

};

_CampCaptured ={
 Player sideRadio "StrongPoint";
 Player sideRadio "Captured";

};

_CampLost ={
 Player sideRadio "StrongPoint";
 Player sideRadio "Lost";

};

 [] spawn _CampCaptured;
