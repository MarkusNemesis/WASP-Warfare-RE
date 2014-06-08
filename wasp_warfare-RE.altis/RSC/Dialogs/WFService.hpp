//// RSC
//// Service Menu Dialog
//// DeraKOren
/////////////////////////

class RscButton_Color: RscButton_Main 
{
	font = "PuristaMedium"; // Zeppelin33
	colorBackground[] = {0.2588, 0.7137, 1, 1};
	colorBackgroundActive[] = {1,0.6,0, 1};
	colorText[] = {0, 0, 0, 1};
	colorFocused[] = {0, 0, 0, 1};
};


//// WFService Menu
////////////////////
class WFServiceMenu {
	movingEnable = 1;
	idd = 68792008;
	onLoad = "[_this, 'onLoad'] ExecVM 'GUI\GUI_WFService.sqf'";
	
	//// BackGrond Control
	///////////////////////
	class controlsBackground {
		
		class BackGround: RscText
		{
			idc = -1;
			x = 0.3425 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.295313 * safezoneW;
			h = 0.672 * safezoneH;
			colorBackground[] = FORM_BG;
		};
		
		class DialogName: RscText_SubTitle
		{
			idc = -1;
			text = "Service menu";
			x = 0.3425 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.295313 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
			sizeEx = 0.035;
		};
		
		class BlueLine: RscText
		{
			idc = -1;
			x = 0.342501 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.295313 * safezoneW;
			h = 0.002 * safezoneH;
			colorBackground[] = AllMenuLine;
		};
	};
	
	//// Control
	/////////////
	class controls {
	
		class VehicleList: RscListNBox
		{
			idc = 1500;
			style = LB_MULTI;
			x = 0.349064 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.282188 * safezoneW;
			h = 0.462 * safezoneH;
			
			lineSpacing = 1;
			//fixedWidth = 1;
			canDrag = 0;
			rowHeight = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorSelectBackground[] = {1,1,1,0.5};
			colorSelectBackground2[] = {1,1,1,0.2};
			colorText[] = {1,1,1,1};
			itemBackground[] = {0.5, 0.5, 0.5, 0.5};
			itemSpacing = 0.001000;
			sizeEx = "0.65 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			columns[] = {1,-0.01, 0.8};
			
			class ListScrollBar
			{
				arrowEmpty = "#(argb,8,8,3)color(1,1,1,0)";
				arrowFull = "#(argb,8,8,3)color(1,1,1,0)";
				border = "#(argb,8,8,3)color(1,1,1,1)";
				color[] = {1,1,1,0};
				colorActive[] = {1,1,1,0};
				colorDisabled[] = {1,1,1,0};
				thumb = "#(argb,8,8,3)color(1,1,1,0)";
			};
			
			onLBSelChanged 	= "[_this, 'Click'] call Compile preprocessFileLineNumbers 'GUI\GUI_WFService.sqf'"; 
		};
		
		/// Main Buttons
		/////////////////
		class ReAmmoButton: RscButton_Color
		{
			idc = 1600;
			text = "Rearm";
			x = 0.349063 * safezoneW + safezoneX;
			y = 0.696 * safezoneH + safezoneY;
			w = 0.137813 * safezoneW;
			h = 0.028 * safezoneH;
			Action = "[_this, 'Rearm'] call Compile preprocessFileLineNumbers 'GUI\GUI_WFService.sqf'";
		};
		class ReFuelButton: RscButton_Color
		{
			idc = 1601;
			text = "Refuel";
			x = 0.349063 * safezoneW + safezoneX;
			y = 0.738 * safezoneH + safezoneY;
			w = 0.137813 * safezoneW;
			h = 0.028 * safezoneH;
			Action = "[_this, 'Refuel'] call Compile preprocessFileLineNumbers 'GUI\GUI_WFService.sqf'";
		};
		class RepairButton: RscButton_Color
		{
			idc = 1602;
			text = "Repair";
			x = 0.493437 * safezoneW + safezoneX;
			y = 0.696 * safezoneH + safezoneY;
			w = 0.137813 * safezoneW;
			h = 0.028 * safezoneH;
			Action = "[_this, 'Repair'] call Compile preprocessFileLineNumbers 'GUI\GUI_WFService.sqf'";
		};
		class HealButton: RscButton_Color
		{
			idc = 1603;
			text = "Heal";
			x = 0.493437 * safezoneW + safezoneX;
			y = 0.738 * safezoneH + safezoneY;
			w = 0.137813 * safezoneW;
			h = 0.028 * safezoneH;
			Action = "[_this, 'Heal'] call Compile preprocessFileLineNumbers 'GUI\GUI_WFService.sqf'";
		};
		
		/// Back and Close Buttons 
		///////////////////////////
		class BackButton: RscButton_Color
		{
			idc = 1604;
			text = "BACK"; //--- ToDo: Localize;
			x = 0.493437 * safezoneW + safezoneX;
			y = 0.794 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.028 * safezoneH;
			Action = "closeDialog 0; createDialog 'WF_Menu';";
		};
		class CloseButton: RscButton_Color
		{
			idc = 1605;
			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.565624 * safezoneW + safezoneX;
			y = 0.794 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.028 * safezoneH;
			Action = "closeDialog 0";
		};
	};
};