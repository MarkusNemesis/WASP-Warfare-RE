["CLIENT INIT", "SET STANDART VIEW DISTANCE"] spawn Fun_AddToLog;
profileNamespace setVariable ["WF_Current_View_Distance", 2000];
    profileNamespace setVariable ["WF_Current_Terrain_Grid_View_Distance", 50];
  profileNamespace setVariable ["WF_Current_Object_View_Distance", 2000];
   setViewDistance (profileNamespace getVariable "WF_Current_View_Distance");
setTerrainGrid  (profileNamespace getVariable "WF_Current_Terrain_Grid_View_Distance");
setObjectViewDistance (profileNamespace getVariable "WF_Current_Object_View_Distance");
