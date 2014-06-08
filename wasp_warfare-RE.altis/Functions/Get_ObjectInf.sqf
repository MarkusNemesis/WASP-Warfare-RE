 private["_AllData", "_Sides", "_Type", "_Result"];
 _Sides  = [west,east,resistance];
 _Type  = _this;
     _Result  = [];
_AllData = [];
 {
 _AllData = _AllData + (_x call Data_B) + (_x call Data_LF) + (_x call Data_HF) + (_x call Data_AF) + (_x call Data_BF) + (_x call Data_TC);
} forEach _Sides;
 {
if (_Type in _x) exitWith {
_Result = _x}} forEach _AllData;
hint format["Result: %1", _Result];
_Result 