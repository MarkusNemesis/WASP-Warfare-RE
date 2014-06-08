//// RSC Titles
//// Debug Titlse "Show when Debug on"
//// DeraKOren
//////////////////////////////////////

class Debug_Titles {
	idd = 68791007;
	objects[] = {};
	movingEnable = false;
	duration = 15000;
	//onLoad = "DebugDisplay = _this;";
	
	controls[] = {};
	controlsBackground[] = 	{DebugText};
	
		class DebugText: RscText {
			idc = 1000;
			text = "DEBUG ON";
			x = 0.335938 * safezoneW + safezoneX;
			y = 0.024 * safezoneH + safezoneY;
			w = 0.321562 * safezoneW;
			h = 0.168 * safezoneH;
			colorText[] = {1,1,1,0.2};
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = 0.2;
		};	
};
