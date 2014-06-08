//// RSC Titles
//// Complete Message
//// DeraKOren
//////////////////////

class MSG_Complete {
	idd = 68791009;
	objects[] = {};
	movingEnable = false;
	duration = 15000;
	onLoad = "MSG_CompleteDisplay = _this;";

	//// Background class
	//////////////////////
	class controlsBackground 
	{
	};	
	
	//// Control class
	///////////////////
	class controls 
	{
		class CompName: RscStructuredText
		{
			idc = 1000;
			text = "Town Captured";
			x = 0.381875 * safezoneW + safezoneX;
			y = 0.178 * safezoneH + safezoneY;
			w = 0.23625 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
			
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
		class CompImg: RscPicture
		{
			idc = 1001;
			text = "";
			x = 0.381875 * safezoneW + safezoneX;
			y = 0.21 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
		};
		class CompDescription: RscStructuredText
		{
			idc = 1002;
			text = "Town ""Mariada"" Captured"; 
			x = 0.42325 * safezoneW + safezoneX;
			y = 0.21 * safezoneH + safezoneY;
			w = 0.195013 * safezoneW;
			h = 0.07 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
			
			class Attributes { 
				//font = "TahomaB"; 
				//color = "#000000"; 
				align = "center"; 
				valign = "middle"; 
				//shadow = false; 
				//shadowColor = "#ff0000"; 
				//size = "1"; 
			};
		};
	};
};