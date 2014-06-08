//// RSC Titles
//// Kill Payment Message
//// DeraKOren
//////////////////////////

class MSG_KillPay {
	idd = 68791014;
	objects[] = {};
	movingEnable = false;
	duration = 15000;
	onLoad = "uiNamespace setVariable ['Display_KillPay', _this select 0];";

	//// Background class
	//////////////////////
	class controlsBackground {};	
	
	//// Control class
	///////////////////
	class controls 
	{
		class KillPaymentShow: RscStructuredText
		{
			idc = 1100;
			text = "<t align='center' color='#00ff00' valign='bottom'>+55<br />+55<br />+55<br />+55<br /></t>";
			x = 0.460625 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.07875 * safezoneW;
			h = 0.182 * safezoneH;
			
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