//// RSC Dialog
//// Vote menu Dialog
//// DeraKOren
/////////////////////

#define Vote_FontSize					0.035

class WFVote 
{
	movingEnable = 1;
	idd = 68792004;
	onLoad = "[_this, 'onLoad'] ExecVM 'GUI\GUI_WFVote.sqf'";

	//// Background class
	//////////////////////
	class controlsBackground 
	{
		class Background: RscText
		{
			idc = 1000;
			x = 0.329375 * safezoneW + safezoneX;
			y = 0.024 * safezoneH + safezoneY;
			w = 0.249375 * safezoneW;
			h = 0.952 * safezoneH;
			colorBackground[] = FORM_BG;
		};
		
		class FormName: RscText_SubTitle
		{
			idc = 1001;
			x = 0.329375 * safezoneW + safezoneX;
			y = 0.024 * safezoneH + safezoneY;
			w = 0.249375 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			text = "VOTE MENU";
		};
		
		class BlueLine: RscText
		{
		idc = 1002;
		x = 0.329375 * safezoneW + safezoneX;
		y = 0.052 * safezoneH + safezoneY;
		w = 0.249375 * safezoneW;
		h = WFBE_Background_Border_Thick;
		colorBackground[] = WFBE_Background_Border;
		};
		
		class RscText_1004: RscText_SubTitle
		{
			idc = 1004;
			text = "New Commander:";
			x = 0.329375 * safezoneW + safezoneX;
			y = 0.050 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
			sizeEx = Vote_FontSize;
		};
	};
	
	//// Control class
	///////////////////
	class controls 
	{
		class TimeEnd: RscText_SubTitle
		{
			idc = 1003;
			text = "12:00";
			x = 0.539375 * safezoneW + safezoneX;
			y = 0.024 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.028 * safezoneH;
		};
		
		class NewCommander: RscText
		{
			idc = 1005;
			text = "NOBODY";
			x = 0.438126 * safezoneW + safezoneX;
			y = 0.050 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {-1,1,-1,1};
			sizeEx = Vote_FontSize;
		};
		
		class VoteList: RscListBox
		{
			idc = 1500;
			x = 0.329375 * safezoneW + safezoneX;
			y = 0.088 * safezoneH + safezoneY;
			w = 0.249375 * safezoneW;
			h = 0.856 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
			colorText[] = {0.258823529, 0.713725490, 1, 1};
			sizeEx = Vote_FontSize;
			rowHeight = 0.02;
			tooltip = "Double click to vote";
			
			onLBSelChanged = "[_this, 'Vote'] ExecVM 'GUI\GUI_WFVote.sqf'";
			//onLBDblClick = "[_this, 'Vote'] ExecVM 'GUI\GUI_WFVote.sqf'";
		};
		
		class CloseButton: RscButton_Main
		{
			idc = 1600;
			//type = CT_BUTTON;
			x = 0.4545 * safezoneW + safezoneX;
			y = 0.950 * safezoneH + safezoneY;
			w = 0.12150 * safezoneW;
			h = 0.02 * safezoneH;
			//colorBorder[] = WFBE_Background_Border;
			colorText[]	= WFBE_Background_Border;
			colorBackground[] = {-1,-1,-1,0.2};
			colorShadow[] = {-1,-1,-1,0.2};
			//BorderSize	= 0.003;
			text = "CLOSE";
			Action = "closeDialog 0;";
		};
		
		class ShowVote: RscButton_Main
		{
			idc = 1601;
			text = "SHOW VOTE MENU: ENABLED";
			x = 0.33100 * safezoneW + safezoneX;
			y = 0.950 * safezoneH + safezoneY;
			w = 0.12250 * safezoneW;
			h = 0.02 * safezoneH;
			colorBorder[] = WFBE_Background_Border;
			colorText[]	= WFBE_Background_Border;
			colorBackground[] = {-1,-1,-1,0.2};
			colorShadow[] = {-1,-1,-1,0.2};
			sizeEx = Vote_FontSize - 0.01;
			borderSize	= 0;
			shadow = 0;
			Action = "[_this, 'Show'] ExecVM 'GUI\GUI_WFVote.sqf'";
		};
	};
};