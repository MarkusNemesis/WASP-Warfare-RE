//// RSC Dialog
//// BuyUnints Dialog
//// DeraKOren
/////////////////////

class WFBuyUnits 
{
	movingEnable = 1;
	idd = 68792002;
	onLoad = "uiNamespace setVariable ['WFDisplay_buyUnits', _this select 0];[_this, 'onLoad'] call compile preprocessFileLineNumbers 'GUI\GUI_WFBuyUnits.sqf'";

	//// Background class
	//////////////////////
	class controlsBackground 
	{
		class Background: RscText
		{
			idc = 1000;
			x = 0.276875 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.44625 * safezoneW;
			h = 0.784 * safezoneH;
			colorBackground[] = FORM_BG;
		};
				
		class Main_Label: RscText_Title
		{
			idc = 1001;
			text = "Buy Units and Vehicle Menu";
			x = 0.276875 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.44625 * safezoneW;
			h = 0.042 * safezoneH;
		colorBackground[] = {-1,-1,-1,0.5};
		};
		
		class BlueLine: RscText
		{
			idc = 1002;
			x = 0.276875 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.44625 * safezoneW;
			h = WFBE_Background_Border_Thick; //0.007 * safezoneH;
			colorBackground[] = WFBE_Background_Border;
		};
		
		class Inf_Label: RscText_Title
		{
			idc = 1003;
			x = 0.519688 * safezoneW + safezoneX;
			y = 0.542 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
			text = "Information";
		};
		
		class BlueLine2: RscText
		{
			idc = 1004;
			x = 0.519688 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = WFBE_Background_Border_Thick; //0.007 * safezoneH;
			colorBackground[] = WFBE_Background_Border;
		};
	};
	

	//// Control class
	///////////////////
	class controls 
	{
		/// Factory Type Buttons
		class B_Type: RscClickableText
		{
			idc = 1101;
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.0328125 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			text = "GUI\Images\Buy\Buy_B.paa";
			action = "[_this, 'B'] call compile preprocessFileLineNumbers 'GUI\GUI_WFBuyUnits.sqf'";
		};
		
		class LF_Type: RscClickableText
		{
			idc = 1102;
			x = 0.322812 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.0328125 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			text = "GUI\Images\Buy\Buy_LF.paa";
			action = "[_this, 'LF'] call compile preprocessFileLineNumbers 'GUI\GUI_WFBuyUnits.sqf'";
		};
		
		class HF_Type: RscClickableText
		{
			idc = 1103;
			x = 0.362187 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.0328125 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			text = "GUI\Images\Buy\Buy_HF.paa";
			action = "[_this, 'HF'] call compile preprocessFileLineNumbers 'GUI\GUI_WFBuyUnits.sqf'";
		};
		
		class AF_Type: RscClickableText
		{
			idc = 1104;
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.0328125 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			text = "GUI\Images\Buy\Buy_AF.paa";
			action = "[_this, 'AF'] call compile preprocessFileLineNumbers 'GUI\GUI_WFBuyUnits.sqf'";
		};

		class BF_Type: RscClickableText
		{
			idc = 1105;
			x = 0.440937 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.0328125 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			text = "GUI\Images\Buy\Buy_BF.paa";
			action = "[_this, 'BF'] call compile preprocessFileLineNumbers 'GUI\GUI_WFBuyUnits.sqf'";
		};

		class TC_Type: RscClickableText
		{
			idc = 1106;
			x = 0.480312 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.0328125 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			text = "GUI\Images\Buy\Buy_TC.paa";
			action = "[_this, 'TC'] call compile preprocessFileLineNumbers 'GUI\GUI_WFBuyUnits.sqf'";
		};
		
		/// Factory Choose
		class Factory: RscCombo
		{
			idc = 1201;
			text = "Combo";
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.028 * safezoneH;
		};
		
		/// Buy List
		class WFBuy_list: RscListNBox //RscListbox
		{
			idc = 1202;
			style = LB_MULTI;
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.504 * safezoneH;
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
			columns[] = {1,-0.01, 0.80};
			
			class ListScrollBar
			{
				arrowEmpty = "#(argb,8,8,3)color(1,1,1,0)";
				arrowFull = "#(argb,8,8,3)color(1,1,1,0)";
				border = "#(argb,8,8,3)color(1,1,1,1)";
				color[] = {1,1,1,1};
				colorActive[] = {1,1,1,0};
				colorDisabled[] = {1,1,1,0};
				thumb = "#(argb,8,8,3)color(1,1,1,0)";
			};
			
			onLBSelChanged = "[_this, 'Select'] call compile preprocessFileLineNumbers 'GUI\GUI_WFBuyUnits.sqf'";
			onLBDblClick = "[_this, 'BuySelected'] call compile preprocessFileLineNumbers 'GUI\GUI_WFBuyUnits.sqf'";
		};
		
		class RSCMap: RscMapControl
		{
			idc = 1203;
			x = 0.519688 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = 0.308 * safezoneH;
			
			showCountourInterval = 1;
			
			onMouseMoving = "mouseX = (_this select 1);mouseY = (_this select 2)";
			onMouseButtonDown = "mouseButtonDown = _this select 1;";
			onMouseButtonUp = "mouseButtonUp = _this select 1;";
		};
		
		/// Special for Vehicle Button
		class Driver: RscClickableText
		{
			idc = 1301;
			x = 0.440937 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.0196875 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			text = "GUI\Images\i_driver.paa";
			action = "[1301, 'SpecBChange'] call compile preprocessFileLineNumbers 'GUI\GUI_WFBuyUnits.sqf'";
		};
		
		class Gunner: RscClickableText
		{
			idc = 1302;
			x = 0.467187 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.0196875 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			text = "GUI\Images\i_gunner.paa";
			action = "[1302, 'SpecBChange'] call compile preprocessFileLineNumbers 'GUI\GUI_WFBuyUnits.sqf'";
		};

		class Commander: RscClickableText
		{
			idc = 1303;
			x = 0.493437 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.0196875 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			text = "GUI\Images\i_commander.paa";
			action = "[1303, 'SpecBChange'] call compile preprocessFileLineNumbers 'GUI\GUI_WFBuyUnits.sqf'";
		};

		class Lock_Unlock: RscClickableText
		{
			idc = 1304;
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.0196875 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			text = "GUI\Images\i_lock.paa";
			action = "[1304, 'SpecBChange'] call compile preprocessFileLineNumbers 'GUI\GUI_WFBuyUnits.sqf'";
		};
		
		/// Information Structured text
		class Inf_Supply: RscStructuredText
		{
			idc = 1401;
			x = 0.519688 * safezoneW + safezoneX;
			y = 0.64 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			text = "Supply:";
		};
		
		class Inf_Money: RscStructuredText
		{
			idc = 1402;
			x = 0.519688 * safezoneW + safezoneX;
			y = 0.668 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			text = "Money:";
		};
		
		class Inf_Turn: RscStructuredText
		{
			idc = 1403;
			x = 0.519688 * safezoneW + safezoneX;
			y = 0.598 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			text = "Turn:";
		};

		class Inf_ToolTip: RscStructuredText
		{
			idc = 1404;
			x = 0.519688 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = 0.2 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			text = "Tooltip Information:";
		};
		
		/// Helped Class for Scripts
		class BldType_Help: RscText	// Hiden Building Type for scripts
		{
			idc = 1405;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.20 * safezoneH + safezoneY;
			w = 0.03 * safezoneW;
			h = 0.05 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorText[] = {1, 1, 1, 0};
			Text = "0";
		};
		class H_Driver: BldType_Help
		{
			idc = 1351;
			y = 0.25 * safezoneH + safezoneY;
		};
		class H_Guner: BldType_Help	
		{
			idc = 1352;
			y = 0.30 * safezoneH + safezoneY;
		};
		class H_Commander: BldType_Help	
		{
			idc = 1353;
			y = 0.35 * safezoneH + safezoneY;
		};
		class H_Lock: BldType_Help	
		{
			idc = 1354;
			y = 0.40 * safezoneH + safezoneY;
		};
		
		class ListBox_Number: BldType_Help	
		{
			idc = 1252;
			y = 0.45 * safezoneH + safezoneY;
		};

		/// Main Buttons
		class BuyButton: RscButton
		{
			idc = 1501;
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.906 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.028 * safezoneH;
			text = "Buy";
			action = "[_this, 'BuySelected'] call compile preprocessFileLineNumbers 'GUI\GUI_WFBuyUnits.sqf'";
		};
		
		class ExitButton: RscButton
		{
			idc = 1502;
			x = 0.696875 * safezoneW + safezoneX;
			y = 0.906 * safezoneH + safezoneY;
			w = 0.0196875 * safezoneW;
			h = 0.028 * safezoneH;
			text = "X";
			action = "closeDialog 0;";
		};
	};
};