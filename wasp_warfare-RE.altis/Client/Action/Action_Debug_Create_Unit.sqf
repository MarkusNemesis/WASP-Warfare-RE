_UnitType = "";
if (side player == west) then {
 _UnitType = "Random" call Compile preprocessFileLineNumbers "Server\AI\WEST\West_Groups.sqf";
}else {
 _UnitType = "Random" call Compile preprocessFileLineNumbers "Server\AI\EAST\East_Groups.sqf";

};

for "_j" from 0 to (count(_UnitType)-1) do {
 _Unit  = group player createUnit [_UnitType select _j, getPosATL  player, [], 10, "FORM"] ;
   _Unit setSkill 0.23;

};

hint format["UNIT CREATED: %1",group Player];
