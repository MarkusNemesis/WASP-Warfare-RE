//// RSC Titles
//// Economy Bar (Player Interface)
//// DeraKOren
///////////////////////////////////

#define _EY		0.938 * safezoneH + safezoneY
#define	_EW		0.0921875 * safezoneW
#define _DX		0.04

	
//// Economy Bar
/////////////////
class EconomicBar_Dialog {
	idd = 68791002;
	objects[] = {};
	movingEnable = false;
	duration = 15000;
	onLoad = "EcoDisplay = _this;";

	//// Background class
	//////////////////////
	class controlsBackground 
	{
	};	
	
	//// Control class
	///////////////////
	class controls 
	{
		class Money: RscStructuredText
		{
			idc = 1000;
			text = "<t color='#00ff00'>$</t> <t color='#ffffff'>100000</t>";
			x = 0.92 * safezoneW + safezoneX - _DX;
			y = _EY;
			w = _EW;
			h = 0.042 * safezoneH;
			colorText[] = {-1,1,-1,1};
			colorBackground[] = {-1,-1,-1,0};
		};
		
		class Supply: RscStructuredText
		{
			idc = 1001;
			text = "<t color='#ff7d00'>S</t> <t color='#ffffff'>100000</t>";
			x = 0.84125 * safezoneW + safezoneX - _DX;
			y = _EY;
			w = _EW;
			h = 0.042 * safezoneH;
			colorText[] = {1,0.5,-1,1};
			colorBackground[] = {-1,-1,-1,0};
		};
		
		class FPS: RscStructuredText
		{
			idc = 1002;
			text = "<t color='#09a6f3'>44</t><t color='#215b7f'>(27)</t>"
			x = 0.7625 * safezoneW + safezoneX - _DX;
			y = _EY;
			w = _EW;
			h = 0.042 * safezoneH;
			colorText[] = {-1,0.5,1,1};
			colorBackground[] = {-1,-1,-1,0};
		};
		
		class CommanderImage: RscPictureKeepAspect
		{
			idc = 1003;
			text = "GUI\Images\UI\UI_Commander.paa";
			x = 0.2 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.04;
			h = 0.04;
			colorBackground[] = {-1,-1,-1,0};
		};
		
		class Commander: RscStructuredText
		{
			idc = 1004;
			text = "<t align='left' color='#ffff00' size='1.1'>DeraKOren</t>";
			x = 0.217813 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			
			class Attributes { 
				//font = "TahomaB"; 
				//color = "#000000"; 
				align = "left"; 
				valign = "middle"; 
				//shadow = false; 
				//shadowColor = "#ff0000"; 
				//size = "1"; 
			};
		};
		
		class TimeImage: CommanderImage
		{
			idc = 1005;
			text = "GUI\Images\UI\UI_Time.paa";
			x = 0.6875 * safezoneW + safezoneX;
			colorBackground[] = {-1,-1,-1,0};
		};
		
		class GameTime: RscStructuredText
		{
			idc = 1006;
			text = "<t align='left' color='#09a6f3' size='1.1'>00:05:12</>";
			x = 0.70475 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			
			class Attributes { 
				//font = "TahomaB"; 
				//color = "#000000"; 
				align = "left"; 
				valign = "middle"; 
				//shadow = false; 
				//shadowColor = "#ff0000"; 
				//size = "1"; 
			};
		};

	};
};