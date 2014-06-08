//// RSC Titles
//// Progress Bar for Camps and Towns
//// DeraKOren
/////////////////////////////////////

#define msg_x	safezoneX + 0.35 * safezoneW
#define msg_y	safezoneY + 0.01 * safezoneH
#define msg_w	safezoneW * 0.3
#define msg_h	safezoneH * 0.04

//// Progress bar for towns and camps
//////////////////////////////////////
class ProgressBar_Dialog {
	idd = 68791001;
	objects[] = {};
	movingEnable = false;
	duration = 15000;
	onLoad = "WWDisplay = _this;";
	
	//// Background class
	//////////////////////
	class controlsBackground 
	{
	};
	
	//// Control class
	///////////////////
	class controls 
	{		
		class Bg_color : RscText {
			colorBackground[] = {0,0,0,0.5};
			colorBorder[] = {1,1,1,1};
			borderSize = 0.001; 
			text = "";
			x = msg_x;
			y = msg_y;
			w = msg_w;
			h = msg_h;
		};
		class Status_BG : RscStructuredText {
			idc = 1001;
			colorBackground[] = {1,0,0,0.2};
			colorBorder[] = {1,0,0,1};
			borderSize = 0.001;
			sizeEx = 0.023;			
			text = "";
			x = msg_x + 0.01;
			y = msg_y + 0.01;
			w = msg_w - 0.02;
			h = msg_h - 0.02;
			class Attributes {
				font = "PuristaMedium";
				align = "center";
				valign = "top";
			};
		};

		class ProgressBar : RscText {
			idc = 1002;
			type = 8;
			style = 128;
			colorFrame[] = {1,1,1,0.4};
			colorBar[] = {1,1,1,0.4};
			texture = "#(argb,8,8,3)color(1,1,1,0.9)";
			//colorBackground[] = {1,0,0,0.5};
			text = "";
			x = msg_x + 0.01;
			y = msg_y + 0.01;
			w = msg_w - 0.02;
			h = msg_h - 0.02;
			class Attributes {
				align = "center";
				valign = "center";
			};
		};
	};
};