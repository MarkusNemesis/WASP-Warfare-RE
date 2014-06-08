private["_WWTowns", "_WWCamps"];
{
	private ["_Count", "_Town", "_Id", "_TownMarker", "_TSize"];
	_Count = _forEachIndex;
	_Town = _x;
	_Id  = _Town select 0;
	_TSize = _Town select 3;
	_MSize = if (_TSize < 4) then {
		(_TSize * 0.2) + 0.8} else {
		1.4
	};
	_TownMarker = Format ["WW_TownMarker_%1",_Id];
	createMarkerLocal [_TownMarker,getPosATL  ( _Town select 1)];
	_TownMarker setMarkerTypeLocal "n_unknown";
	_TownMarker setMarkerColorLocal "ColorBlue";
	_TownMarker setMarkerSizeLocal [_MSize,_MSize];
	if (Debug) then  {
		_TownRange = 150 + (20 * _TSize);
		_SpotRange = _TownRange + 400;
		_TownRadName = Format ["TownRadius%1",_Id];
		createMarkerLocal [_TownRadName,getPosATL  ( _Town select 1)];
		_TownRadName setMarkerShapeLocal "ELLIPSE";
		_TownRadName setMarkerBrushLocal "Border";
		_TownRadName setMarkerColorLocal "ColorBlue";
		_TownRadName setMarkerSizeLocal [_TownRange,_TownRange];
		_TownSpotName = Format ["TownSpot%1",_Id];
		createMarkerLocal [_TownSpotName,getPosATL  ( _Town select 1)];
		_TownSpotName setMarkerShapeLocal "ELLIPSE";
		_TownSpotName setMarkerBrushLocal "Border";
		_TownSpotName setMarkerColorLocal "ColorRed";
		_TownSpotName setMarkerSizeLocal [_SpotRange,_SpotRange];
	};
} forEach Public_TownsArray;
{
	private ["_Count", "_Camps", "_Id", "_CampMarker"];
	_Count = _forEachIndex;
	_Camps = _x;
	_Id  = _Camps select 0;
	_CampMarker = Format ["WW_CampMarker_%1",_Id];
	createMarkerLocal [_CampMarker,getPosATL  ( _Camps select 1)];
	_CampMarker setMarkerTypeLocal "o_unknown";
	_CampMarker setMarkerColorLocal "ColorBlue";
	_CampMarker setMarkerSizeLocal [0.5,0.5];
} forEach Public_CampsArray;
_lastUpdate  = time;
_PrgBarUpdate = time;
waitUntil
{
	if ((time - _PrgBarUpdate) > 1) then {
		[] call ClientFSM_ProgressBar;
		[] call ClientFSM_UpgradeBar;
	};
	[] call ClientFSM_EconomyBar;
	[] call ClientFSM_UpdateTownMarkers;
	[] call ClientFSM_UpdateCampMarkers;
	[] call ClientFSM_UpdateBldMarkers;
	[] call ClientFSM_UpdateMHQMarker;
	[] call ClientFSM_UpdateVehMarkers;
	[] call ClientFSM_UpdateAITL;
	[] call ClientFSM_UpdateGroupMarkers;
	[] call ClientFSM_UpdatePlrMarkers;
	_lastUpdate = time;
	
	// Markus - Leave last
	false
};
