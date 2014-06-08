//// RSC Titles
//// Loading Titles (On Mission Load)
//// DeraKOren
//////////////////////////////////////

#define	LW			0.9
#define	LX 			0.5 * safezoneW + safezoneX - LW / 2
#define	LY 			0.5 * safezoneH + safezoneY - LW / 2

class Loading_Titles {
	idd = 68791008;
	objects[] = {};
	movingEnable = false;
	duration = 15000;
	//onLoad = "DebugDisplay = _this;"; text = "GUI\Images\Loading\WASPWarfareInterlogo512.paa";
	
	controls[] = {};
	controlsBackground[] = {BG, LoadingScreen};
	
	class BG: RscText
	{
		idc = -1;
		x = 0 * safezoneW + safezoneX;
		y = 0 * safezoneH + safezoneY;
		w = 1 * safezoneW;
		h = 1 * safezoneH;
		colorBackground[] = {-1,-1,-1, -1};
		//colorBackground[] = {0.029,0.156,0.298,1};
	};
	class LoadingScreen: RscPictureKeepAspect
	{
		idc = 1200;
		text = "GUI\Images\Loading\WASPWarfareInterlogo256.paa";
		x = LX;
		y = LY;
		w = LW;
		h = LW;
		colorText[] = {1,1,1,1};
		colorBackground[] = {-1,-1,-1,-1};
	};
};
