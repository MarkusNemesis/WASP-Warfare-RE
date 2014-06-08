//// RSC
//// Title show what Upgrade now Run
//// DeraKOren
/////////////////////////////////////

class MSG_Upgrade {
	idd = 68791012;
	objects[] = {};
	movingEnable = false;
	duration = 15000;
	onLoad = "uiNamespace setVariable ['Display_MSG_Upgrade', _this select 0];";

	//// Background class
	//////////////////////
	class controlsBackground {};	
	
	//// Control class
	///////////////////
	class controls 
	{
		class UpgradeRunShow: RscStructuredText
		{
			idc = 1100;
			text = "<t align='Right' color='#ffff00'>Light Factory I Run</t>";
			x = 0.742813 * safezoneW + safezoneX;
			y = 0.602 * safezoneH + safezoneY;
			w = 0.249375 * safezoneW;
			h = 0.056 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			
			class Attributes { 
				//font = "TahomaB"; 
				//color = "#000000"; 
				align = "right"; 
				valign = "bottom"; 
				//shadow = false; 
				//shadowColor = "#ff0000"; 
				//size = "1"; 
			};
		};
	};
};