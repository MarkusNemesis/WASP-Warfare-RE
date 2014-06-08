//// RSC Titles
//// Show all payment HUD
//// DeraKOren
//////////////////////////

class MSG_Pay {
	idd = 68791011;
	objects[] = {};
	movingEnable = false;
	duration = 15000;
	onLoad = "uiNamespace setVariable ['Display_Pay', _this select 0];";

	//// Background class
	//////////////////////
	class controlsBackground {};	
	
	//// Control class
	///////////////////
	class controls 
	{
		class PaymentShow: RscStructuredText
		{
			idc = 1100;
			text = "<t align='center' color='#00ff00' valign='bottom'>+55<br />+55<br />+55<br />+55<br /></t>";
			x = 0.742813 * safezoneW + safezoneX;
			y = 0.612 * safezoneH + safezoneY;
			w = 0.249375 * safezoneW;
			h = 0.322 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			
			class Attributes { 
				//font = "TahomaB"; 
				//color = "#000000"; 
				align = "left"; 
				valign = "bottom"; 
				//shadow = false; 
				//shadowColor = "#ff0000"; 
				//size = "1"; 
			};
		};
	};
};