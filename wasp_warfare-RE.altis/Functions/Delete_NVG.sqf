 private["_Unit"];
_Unit = _this;
if ((side _Unit) == west)   then {
_Unit unassignItem "NVGoggles";
 _Unit removeItem "NVGoggles"
};

if ((side _Unit) == east)   then {
_Unit unassignItem "NVGoggles_OPFOR";
 _Unit removeItem "NVGoggles_OPFOR"
};

if ((side _Unit) == resistance) then {
_Unit unassignItem "NVGoggles_INDEP";
 _Unit removeItem "NVGoggles_INDEP"
};

