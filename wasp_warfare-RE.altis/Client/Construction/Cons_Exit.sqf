private ["_Camera", "_keypress", "_MouseMove", "_MouseClick", "_LocalObj", "_HelpObj"];
_Camera  = Cons_Array select 0;
_keypress = Cons_Array select 1;
_MouseMove = Cons_Array select 2;
_MouseClick = Cons_Array select 3;
_LocalObj = Cons_Array select 5;
 (findDisplay 46) displayRemoveEventHandler ["KeyDown",_keypress];
                     (findDisplay 46) displayRemoveEventHandler ["MouseMoving",_MouseMove];
                (findDisplay 46) displayRemoveEventHandler ["MouseButtonClick",_MouseClick];
          player cameraEffect ["terminate","back"];
            6881 cutText ["","PLAIN",0];
               showCommandingMenu "";
                  deleteVehicle _LocalObj;
Cons_Array set[5,objNull];
  Cons_Array set[6,[]];
private ["_HelpObj", "_i"];
 _HelpObj = Cons_Array select 7;
for "_i" from 0 to (count(_HelpObj)-1) do {
 deleteVehicle (_HelpObj select _i);

};

Cons_Array set[7,[]];
 Cons_Array = nil;
