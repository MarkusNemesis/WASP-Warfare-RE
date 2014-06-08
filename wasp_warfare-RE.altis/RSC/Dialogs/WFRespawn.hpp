//// RSC Dialog
//// Respawn Menu Dialog
//// DeraKOren
////////////////////////

#define Respawn_FontSize					0.035

class WFRespawn 
{
	movingEnable = 1;
	idd = 68792003;
	onLoad = "[_this, 'onLoad'] ExecVM 'GUI\GUI_WFRespawn.sqf'";

	//// Background class
	//////////////////////
	class controlsBackground 
	{
		class BG: RscText
		{
			idc = 1000;
			x = 0.244062 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.511875 * safezoneW;
			h = 0.672 * safezoneH;
			colorBackground[] = FORM_BG;
		};
		
		class RespawnDialogName: RscText_SubTitle
		{
			idc = 1001;
			text = "Respawn Menu";
			x = 0.244062 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.511875 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
			sizeEx = Respawn_FontSize;
		};
		
		class BlueLine: RscText
		{
			idc = 1002;
			x = 0.244062 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.511875 * safezoneW;
			h = WFBE_Background_Border_Thick;
			colorBackground[] = WFBE_Background_Border;
		};
	};
	
	//// Control class
	///////////////////
	class controls 
	{
		class TimeEnd: RscText_SubTitle
		{
			idc = 1100;
			text = "12:00";
			x = 0.71 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.0459375 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0,0,0,0};
			sizeEx = Respawn_FontSize;
		};
		
		class RespawnInfo: RscStructuredText
		{
			idc = 1101;
			text = "Respawn on:";
			x = 0.591875 * safezoneW + safezoneX;
			y = 0.682 * safezoneH + safezoneY;
			w = 0.1575 * safezoneW;
			h = 0.098 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			sizeEx = Respawn_FontSize;
		};
		
		class Map: RscMapControl
		{
			idc = 2000;
			x = 0.250625 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.334688 * safezoneW;
			h = 0.616 * safezoneH;
			
			showCountourInterval = 2;
			
			onMouseButtonClick = "[_this, 'Click'] call Compile preprocessFileLineNumbers 'GUI\GUI_WFRespawn.sqf'";
		};
		
		class TimeBar: RscText
		{
			idc = 1004;
			x = 0.244062 * safezoneW + safezoneX;
			y = 0.822 * safezoneH + safezoneY;
			w = 0.511875 * safezoneW;
			h = WFBE_Background_Border_Thick*3;
			colorBackground[] = {-1,0.5,0,0.3};
		};
		
		class RespawnList: RscListbox
		{
			idc = 1500;
			x = 0.591875 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.1575 * safezoneW;
			h = 0.462 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
			colorText[] = {0.258823529, 0.713725490, 1, 1};
			sizeEx = Respawn_FontSize;
			rowHeight = 0.02;
			tooltip = "Double click to vote";
			
			onLBSelChanged = "[_this, 'Select'] ExecVM 'GUI\GUI_WFRespawn.sqf'";
			//onLBDblClick = "[_this, 'Vote'] ExecVM 'GUI\GUI_WFVote.sqf'";
		};
		
		class CloseButton: RscButton_Main
		{
			idc = 1600;
			text = "CLOSE";
			x = 0.591875 * safezoneW + safezoneX;
			y = 0.794 * safezoneH + safezoneY;
			w = 0.1575 * safezoneW;
			h = 0.028 * safezoneH;
			colorBorder[] = WFBE_Background_Border;
			colorText[]	= WFBE_Background_Border;
			colorBackground[] = {-1,-1,-1,0.2};
			colorShadow[] = {-1,-1,-1,0.2};
			sizeEx = Respawn_FontSize;
			borderSize	= 0;
			shadow = 0;
			Action = "closeDialog 0;";
		};
	};
};
