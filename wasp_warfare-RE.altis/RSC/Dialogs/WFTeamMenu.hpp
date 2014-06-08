//// RSC
//// Team Menu and Video Setting Dialog
//// DeraKOren
////////////////////////////////////////

#define AllMenuBG				{0.029, 0.156, 0.298, 0.9}	//{0.129, 0.356, 0.498, 0.9} {0.029, 0.256, 0.398, 0.9}
#define ControlsMenuBG			{-1,-1,-1,0.2}
#define AllMenuLine				{0.2588, 0.7137, 1, 1}

//// WFTeamMenu
////////////////
class WFTeamMenu {
	movingEnable = 1;
	idd = 68792005;
	onLoad = "[_this, 'onLoad'] ExecVM 'GUI\GUI_WFTeamMenu.sqf'";
	
	//// BackGrond Control
	///////////////////////
	class controlsBackground {

		class BG: RscText
		{
			idc = -1;
			x = 0.303125 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.387188 * safezoneW;
			h = 0.7 * safezoneH;
			colorBackground[] = FORM_BG;
		};
		class MenuName: RscText_SubTitle
		{
			idc = -1;
			text = "Team and Video Setting Menu";
			x = 0.303125 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.387188 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
			sizeEx = 0.035;
		};
		class BlueLine: RscText
		{
			idc = -1;
			x = 0.303125 * safezoneW + safezoneX;
			y = 0.178 * safezoneH + safezoneY;
			w = 0.387188 * safezoneW;
			h = 0.002 * safezoneH;
			colorBackground[] = AllMenuLine;
		};
		
		/// Video Setting BG
		/////////////////////
//		class BGVideo: RscText
//		{
//			idc = -1;
//			x = 0.309688 * safezoneW + safezoneX;
//			y = 0.192 * safezoneH + safezoneY;
//			w = 0.374063 * safezoneW;
//			h = 0.112 * safezoneH;
//			colorBackground[] = ControlsMenuBG;
//		};
		class SetDistance: RscText_SubTitle
		{
			idc = -1;
			text = "Set Distance";
			x = 0.309688 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class SetTerrainGrid: SetDistance
		{
			idc = -1;
			text = "Set Terrain Grid";
			x = 0.309688 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class SetObject: SetDistance
		{
			idc = -1;
			text = "Set Object Distance";
			x = 0.309688 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.190313 * safezoneW;
			h = 0.028 * safezoneH;
		};
		
		/// Units BackGround
		/////////////////////
		class BGUnits: RscText
		{
			idc = -1;
			x = 0.309688 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.476 * safezoneH;
			colorBackground[] = ControlsMenuBG;
		};
		
		/// Transfer BackGround
		////////////////////////
		class BGTrans: RscText
		{
			idc = -1;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.476 * safezoneH;
			colorBackground[] = ControlsMenuBG;
		};
	};
	
	//// Control
	/////////////
	class controls {
		
		/// Video Setting
		//////////////////
		class SlideViewDist: RscXSliderH
		{
			idc = 1900;
			x = 0.506563 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.177188 * safezoneW;
			h = 0.028 * safezoneH;
			onSliderPosChanged = "[_this, 'VdTgOvChange'] call compile preprocessFileLineNumbers 'GUI\GUI_WFTeamMenu.sqf'";
		};
		
		class SlideTerain: RscXSliderH
		{
			idc = 1901;
			x = 0.506563 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.177188 * safezoneW;
			h = 0.028 * safezoneH;
			onSliderPosChanged = "[_this, 'VdTgOvChange'] call compile preprocessFileLineNumbers 'GUI\GUI_WFTeamMenu.sqf'";
		};
		
		class SlideObjectDist: RscXSliderH
		{
			idc = 1902;
			x = 0.506563 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.177188 * safezoneW;
			h = 0.028 * safezoneH;
			onSliderPosChanged = "[_this, 'VdTgOvChange'] call compile preprocessFileLineNumbers 'GUI\GUI_WFTeamMenu.sqf'";
		};
		
		class ViewDisText: RscText_SubTitle
		{
			idc = 1010;
			text = "5000";
			x = 0.456473 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.084 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class TerGridText: ViewDisText
		{
			idc = 1011;
			text = "5000";
			y = 0.234 * safezoneH + safezoneY;
		};
		class ObjectViewText: ViewDisText
		{
			idc = 1012;
			text = "5000";
			y = 0.276 * safezoneH + safezoneY;
		};
		
		
		/// Team Units Control
		///////////////////////
		class UnitsList: RscListbox
		{
			idc = 1500;
			x = 0.31625 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.406 * safezoneH;
			rowHeight = 0.02;
			sizeEx = 0.03;
			colorBackground[] = {-1,-1,-1,0.5};
			
			onLBDblClick = "[_this, 'DeleteAI'] call compile preprocessFileLineNumbers 'GUI\GUI_WFTeamMenu.sqf'";
		};
		class DeleteB: RscButton
		{
			idc = 1602;
			text = "Delete Unit"; //--- ToDo: Localize;
			x = 0.31625 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.028 * safezoneH;
			font = "PuristaMedium"; // Zeppelin33
			colorBackground[] = {0.2588, 0.7137, 1, 1};
			colorBackgroundActive[] = {1,0.6,0, 1};
			colorText[] = {0, 0, 0, 1};
			colorFocused[] = {0, 0, 0, 1};
			Action = "[_this, 'DeleteAI'] call compile preprocessFileLineNumbers 'GUI\GUI_WFTeamMenu.sqf'";
		};
		
		
		/// Transfer Controls
		//////////////////////
		class SetMoney: RscXSliderH
		{
			idc = 1903;
			x = 0.506563 * safezoneW + safezoneX;
			y = 0.668 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.028 * safezoneH;
			
			onSliderPosChanged = "[_this, 'SetMoney'] call compile preprocessFileLineNumbers 'GUI\GUI_WFTeamMenu.sqf'";
		};
		class Money: ViewDisText
		{
			idc = 1009;
			text = "10000";
			x = 0.506563 * safezoneW + safezoneX;
			y = 0.696 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class PlayerList: RscListbox
		{
			idc = 1501;
			x = 0.506563 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.322 * safezoneH;
			rowHeight = 0.02;
			sizeEx = 0.03;
			colorBackground[] = {-1,-1,-1,0.5};
			
			onLBSelChanged  = "[_this, 'SelectPlayer'] call compile preprocessFileLineNumbers 'GUI\GUI_WFTeamMenu.sqf'";
		};
		class TransferButton: DeleteB
		{
			idc = 1603;
			text = "Transfer Money";
			x = 0.506563 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.028 * safezoneH;
			
			Action	= "[_this, 'Transfer'] call compile preprocessFileLineNumbers 'GUI\GUI_WFTeamMenu.sqf'";
		};
		
		
		/// Main Buttons
		/////////////////
		class CloseButton: DeleteB
		{
			idc = 1600;
			text = "CLOSE";
			x = 0.63125 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.028 * safezoneH;
			
			Action	= "CloseDialog 0";
		};

		class BackButton: DeleteB
		{
			idc = 1601;
			text = "BACK";
			x = 0.572188 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.028 * safezoneH;
		};
		
	};
};