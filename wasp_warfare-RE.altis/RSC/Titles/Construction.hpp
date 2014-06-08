//// RSC Tiltles
//// Construction Interface
//// DeraKOren
////////////////////////////

#define _Camera_x		safezoneX + 0.5 * safezoneW
#define _Camera_y		safezoneY + 0.5 * safezoneH
#define _Camera_w		safezoneW * 0.8
#define _Camera_h		safezoneH * 0.8

#define _LineBG			{0,1,0,0.8}
#define _LineTHICK		0.002
#define _LineLENGTH		0.3

#define _FormBG			{0,0,0,0}

////---Construction camera view
class ConstructionView {
	idd = 68791005;
	objects[] = {};
	movingEnable = false;
	//enableSimulation = false;
	duration = 15000;
	onLoad = "uiNamespace setVariable ['ConstructionDisplay', _this select 0]";

	//// Background class
	//////////////////////
	class controlsBackground 
	{
	};
	
	//// Control class
	///////////////////
	class controls 
	{
			//// Vertical Line
		class VerticalLeftUp: RscText
		{
			idc = 1001;
			x = 0.01 * safezoneW + safezoneX;
			y = 0.01 * safezoneH + safezoneY;
			w = _LineLENGTH;
			h = _LineTHICK;
			colorBackground[] = _LineBG;
			Text = "";
		};
		
		class VerticalRightUp: VerticalLeftUp
		{
			x = (0.99  * safezoneW + safezoneX) - _LineLENGTH;
		};
		
		class VerticalLeftDown: VerticalLeftUp
		{
			y = 0.99 * safezoneH + safezoneY;
		};
		
		class VerticalRightDown: VerticalRightUp
		{
			y = 0.99 * safezoneH + safezoneY;
		};
		
		//// Horizontal Line
		class HorizontalLeftUp: VerticalLeftUp
		{
			w = _LineTHICK;
			h = _LineLENGTH;
		};
		
		class HorizontalRightUp: HorizontalLeftUp
		{
			x = 0.99  * safezoneW + safezoneX;
		};
		
		class HorizontalLeftDown: HorizontalLeftUp
		{
			y = (0.99 * safezoneH + safezoneY)  - _LineLENGTH;
		};
		
		class HorizontalRightDown: HorizontalLeftDown
		{
			x = 0.99  * safezoneW + safezoneX;
		};
		
		/// Crosshairs
		class crosshairs : RscText 
		{
			idc = 1011;
			colorBackground[] = {0,1,0,0};
			colorBorder[] = {1,0,0,1};
			colorText[] = {0, 1, 0, 1};
			borderSize = 0.1;
			sizeEx = 0.05;			
			text = "+";
			x = _Camera_x - 0.02;
			y = _Camera_y + 0.02;
			w = 0.04;
			h = 0.04;
		};
		
		/// NVG
		class NVG : crosshairs 
		{
			idc = 1012;
			colorBackground[] = {0,1,0,0};
			colorBorder[] = {1,0,0,1};
			colorText[] = {0, 1, 0, 1};
			borderSize = 0.1;
			sizeEx = 0.035;			
			text = "NVG: OFF";
			x = _Camera_x - 0.05;
			y = 0.01;
			w = 0.1;
			h = 0.05;
		};
		
		class BldInformation : RscStructuredText {
			idc = 1100;
			text = "Building INF";
			x = _Camera_x;
			y = _Camera_y + 0.03;
			w = _LineLENGTH*0.75;
			h = _LineLENGTH;
			colorText[] = {-1,1,-1,0.7};
			colorBackground[] = _FormBG;
		};
		
		class ControlHelp : RscStructuredText 
		{
			idc = 1101;
			text = "Control Help"; //--- ToDo: Localize;
			x = (0.99  * safezoneW + safezoneX) - _LineLENGTH;
			y = 0.02 * safezoneH + safezoneY;
			w = _LineLENGTH;
			h = _LineLENGTH;
			colorText[] = {-1,1,-1,1};
			colorBackground[] = _FormBG;
		};
		
		class ViewName: RscStructuredText
		{
			idc = 1102;
			text = "Construction VIEW";
			x = 0.01 * safezoneW + safezoneX;
			y = 0.01 * safezoneH + safezoneY;
			w = _LineLENGTH;
			h = _LineLENGTH;
			colorText[] = {-1,1,-1,1};
			colorBackground[] = _FormBG;
		};
	};
};	