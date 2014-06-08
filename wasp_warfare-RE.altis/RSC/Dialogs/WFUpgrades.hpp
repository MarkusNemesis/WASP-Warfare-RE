//// RSC
//// Upgrades Dialog
//// DeraKOren
/////////////////////

#define Up_FontSize					0.035


#define UpW							0.02625 * safezoneW
#define UpH							0.042 * safezoneH
#define UpX							(0.5 * safezoneW + safezoneX) - UpW * 8
#define UpY							(0.5 * safezoneH + safezoneY) - UpH * 5
#define UPZoom						1.1


#define TLine						0.003
#define LineColor					{0.8, 0.8, 0.8, 0.9}		//{0.2588, 0.7137, 1, 1}


class WFUpgrades 
{
	movingEnable = 1;
	idd = 68792007;
	onLoad = "[_this, 'onLoad'] ExecVM 'GUI\GUI_WFUpgrades.sqf'";
		
	//// Background class
	//////////////////////
	class controlsBackground 
	{
		class BG: RscText_SubTitle
		{
			idc = -1;
			x = UpX;
			y = UpY;
			w = UpW * 15;
			h = UpH * 11;
			colorBackground[] = FORM_BG;
		};
		
		class FormName: BG
		{
		
			idc = -1;
			text = "Upgrades Menu - Double Click to run";
			font = "PuristaMedium";

			h = UpH * 0.75;
			colorBackground[] = {-1,-1,-1,0.2};
		};
		
		class BlueLine: BG
		{
			idc = -1;
			y = UpY + UpH * 0.75;
			h = 0.0015 * safezoneH;
			colorBackground[] = {0.2588, 0.7137, 1, 1};
		};
		
		// Lines
		//////////
		class Line: RscText						// Main Class
		{
			idc = -1;
			colorBackground[] = LineColor;
			x = UpX + UpW * 3.5;
			y = UpY + UpH * 2.5;
			w = UpW * 4;
			h = TLine;
		};
		
		class HorizontalLine: Line				// Sub Class
		{
			idc = -1;
			x = UpX + UpW * 1.5;
			y = UpY + UpH * 6.5;
			w = UpW * 2;
			h = TLine;
		};
		class HorizontalLine1: HorizontalLine
		{
			idc = -1;
			x = UpX + UpW * 9.5;
			y = UpY + UpH * 2.5;
			w = UpW * 2;
		};
		class HorizontalLine2: HorizontalLine
		{
			idc = -1;
			x = UpX + UpW * 11.5;
			y = UpY + UpH * 4.5;
			w = UpW * 2;
		};
		
		class VerticalLine: Line				// Sub Class
		{
			idc = -1;
			x = UpX + UpW * 3.5;
			y = UpY + UpH * 2.5;
			w = TLine;
			h = UpH * 6;
		};
		class ATVerLine: VerticalLine
		{
			idc = -1;
			x = UpX + UpW * 1.5;
			y = UpY + UpH * 6.5;
			h = UpH * 2;
		};
		class BVerLine: VerticalLine
		{
			idc = -1;
			x = UpX + UpW * 5.5;
			y = UpY + UpH * 2.5;
			h = UpH * 4;
		};
		class LFVerLine: VerticalLine
		{
			idc = -1;
			x = UpX + UpW * 7.5;
			y = UpY + UpH * 2.5;
		};
		class HFVerLine: VerticalLine
		{
			idc = -1;
			x = UpX + UpW * 9.5;
			y = UpY + UpH * 2.5;
		};
		class SPVerLine: VerticalLine
		{
			idc = -1;
			x = UpX + UpW * 11.5;
			y = UpY + UpH * 2.5;
			h = UpH * 4;
		};
		class AFVerLine: VerticalLine
		{
			idc = -1;
			x = UpX + UpW * 13.5;
			y = UpY + UpH * 4.5;
			h = UpH * 4;
		};
	};
	
	//// Control class
	///////////////////
	class controls 
	{
		/// Barracks Upgrades
		class B1: RscClickableText				// Main Class
		{
			idc = 1600;
			//style = 0x02;
			text = "GUI\Images\Upgrade\GUI_UpB1.paa";
			font = "PuristaMedium"; // Zeppelin33
			
			colorActive[] = {0.2588, 0.7137, 1, 0.9};
			color[] = {1,1,0,1};
			//colorBackground[] = LineColor;
			//colorBackgroundActive[] = {0.2588, 0.7137, 1, 0.7};
			//colorFocused[] = {0.2588, 0.7137, 1, 0.7};
						
			//colorDisabled[] = {0.5,0.5,0.5,1};
			//colorBackgroundDisabled[] = {0.3,0.3,0.3,1};
			
			//shadow = 0;
			//enable = false;
			//default = false;
			
			x = UpX + UpW * 5;
			y = UpY + UpH * 2;
			w = UpW * UPZoom;
			h = UpH * UPZoom;
		};
		
		class B2: B1
		{
			idc = 1601;
			text = "GUI\Images\Upgrade\GUI_UpB2.paa";
			y = UpY + UpH * 4;
		};

		class B3: B1
		{
			idc = 1602;
			text = "GUI\Images\Upgrade\GUI_UpB3.paa";
			y = UpY + UpH * 6;
		};
		
		/// Weapons Upgrades
		class WP1: B1
		{
			idc = 1610;
			text = "GUI\Images\Upgrade\GUI_UpWP1.paa";
			x = UpX + UpW * 3;
			y = UpY + UpH * 4;

		};
		class WP2: WP1
		{
			idc = 1611;
			text = "GUI\Images\Upgrade\GUI_UpWP2.paa";
			y = UpY + UpH * 6;
		};
		class WP3: WP1
		{
			idc = 1612;
			text = "GUI\Images\Upgrade\GUI_UpWP3.paa";
			y = UpY + UpH * 8;
		};
		
		/// RPG Upgrades
		class AT: B1
		{
			idc = 1613;
			text = "GUI\Images\Upgrade\GUI_UpAT.paa";
			x = UpX + UpW * 1;
			y = UpY + UpH * 6;
		};
		class AA: AT
		{
			idc = 1614;
			text = "GUI\Images\Upgrade\GUI_UpAA.paa";
			y = UpY + UpH * 8;
		};
		
		/// Light Factory
		class LF1: B1
		{
			idc = 1620;
			text = "GUI\Images\Upgrade\GUI_UpLF1.paa";
			x = UpX + UpW * 7;
			y = UpY + UpH * 4;

		};
		class LF2: LF1
		{
			idc = 1621;
			text = "GUI\Images\Upgrade\GUI_UpLF2.paa";
			y = UpY + UpH * 6;

		};
		class LF3: LF1
		{
			idc = 1622;
			text = "GUI\Images\Upgrade\GUI_UpLF3.paa";
			y = UpY + UpH * 8;
		};
		
		/// Heavy Factory
		class HF1: B1
		{
			idc = 1630;
			text = "GUI\Images\Upgrade\GUI_UpHF1.paa";
			x = UpX + UpW * 9;
			y = UpY + UpH * 4;
		};
		class HF2: HF1
		{
			idc = 1631;
			text = "GUI\Images\Upgrade\GUI_UpHF2.paa";
			y = UpY + UpH * 6;
		};
		class HF3: HF1
		{
			idc = 1632;
			text = "GUI\Images\Upgrade\GUI_UpHF3.paa";
			y = UpY + UpH * 8;
		};
		
		/// Supply
		class SP1: B1
		{
			idc = 1640;
			text = "GUI\Images\Upgrade\GUI_UpSP1.paa";
			x = UpX + UpW * 11;
			y = UpY + UpH * 2;
		};
		class SP2: SP1
		{
			idc = 1641;
			text = "GUI\Images\Upgrade\GUI_UpSP2.paa";
			y = UpY + UpH * 4;
		};
		class SP3: SP1
		{
			idc = 1642;
			text = "GUI\Images\Upgrade\GUI_UpSP3.paa";
			y = UpY + UpH * 6;
		};
		
		/// Air Factory
		class AF1: B1
		{
			idc = 1650;
			text = "GUI\Images\Upgrade\GUI_UpAF1.paa";
			x = UpX + UpW * 13;
			y = UpY + UpH * 4;
		};
		class AF2: AF1
		{
			idc = 1651;
			text = "GUI\Images\Upgrade\GUI_UpAF2.paa";
			y = UpY + UpH * 6;
		};
		class AF3: AF1
		{
			idc = 1652;
			text = "GUI\Images\Upgrade\GUI_UpAF3.paa";
			y = UpY + UpH * 8;
		};
		
		/// Close Button
		class CloseButton: RscButton
		{
			idc = 1400;
			text = "CLOSE";
			x = UpX + UpW * 11.75;
			y = UpY + UpH * 10;
			w = UpW * 3;
			h = UpH * 0.75;
			font = "PuristaMedium"; // Zeppelin33
			colorBackground[] = {0.2588, 0.7137, 1, 1};
			colorBackgroundActive[] = {1,0.6,0, 1};
			colorText[] = {0, 0, 0, 1};
			colorFocused[] = {0, 0, 0, 1};
			
			Action = "CloseDialog 0;";
		};
		
		//// Money and Supply Show
		class SupplyMoney: RscStructuredText
		{
			idc = 8000;
			x = UpX + UpW * 0.25;
			y = UpY + UpH * 9.5;
			w = UpW * 6;
			h = UpH * 1.75;
			colorBackground[] = {-1,-1,-1,0};
			text = "MoneySupply";
		};
		
		//// 
		class UpgradeRun: RscStructuredText
		{
			idc = 8001;
			x = UpX + UpW * 7.25;
			y = UpY + UpH * 10;
			w = UpW * 4;
			h = UpH * 0.75;
			colorBackground[] = {-1,-1,-1,0};
			text = "Ugrade Run ...";
		};
		
		
		//// Tooltip (Short Description)
		class ShortDescript: RscStructuredText
		{
			idc = 9000;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = UpW;
			h = UpH;
			colorBackground[] = {-1,-1,-1,0.3};
			text = "Short Descript";
		};
	};
};