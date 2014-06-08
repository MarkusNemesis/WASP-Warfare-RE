//// RSC Dialogs
//// Main Warfare Dialog 
//// DeraKOren
///////////////////////////////////

#define	WFMM_H					0.25
#define WFMM_W					WFMM_H// * 1,151515151515152

#define WFMM_Top				WFMM_H * 0.34
#define WFMM_Left				WFMM_H * 0.12
#define WFMM_Right				WFMM_H * 0.38
#define WFMM_Bottom				WFMM_H * 0.3

#define WFMM_FontSize			WFMM_H * 0.17

#define WFMM_X					0.5 - WFMM_H / 2
#define WFMM_Y					0.5 - WFMM_H / 2
#define WFMM_XD					WFMM_H * 0.6
#define WFMM_YD					WFMM_H / 2.15


//// Button Class
//////////////////
class MainMenuButton: RscShortcutButton {
	w = WFMM_W;
	h = WFMM_H;

	class HitZone {
		left = WFMM_Left; 
		top = WFMM_Top; 
		right = WFMM_Right; 
		bottom = WFMM_Top;
	};
	class TextPos {
		left = WFMM_Left; 
		top = WFMM_Top; 
		right = WFMM_Right; 
		bottom = WFMM_Top;
	};
	
	font = "TahomaB";
	size = WFMM_FontSize;
	sizeEx = WFMM_FontSize;
	
	color[] = {0.2588, 0.7137, 1, 1};
	color2[] = {0.95, 0.95, 0.95, 1};
	colorBackground[] = {0.8, 0.8, 0.8, 1};
	colorbackground2[] = {1, 1, 1, 0.4};
	colorDisabled[] = {1, 1, 1, 0.25};
	colorFocused[] = {0.2588, 0.7137, 1, 1};
	colorBackGroundFocused[] = {0.2588, 0.7137, 1, 1};
};

class MainMenuButtonLittle: MainMenuButton {
	w = WFMM_W / 2;
	h = WFMM_H / 2;

	class HitZone {
		left = WFMM_Left / 2; 
		top = WFMM_Top / 2; 
		right = WFMM_Right / 2; 
		bottom = WFMM_Top / 2;
	};
	class TextPos {
		left = WFMM_Left / 2; 
		top = WFMM_Top / 2; 
		right = WFMM_Right  / 2; 
		bottom = WFMM_Top  / 2;
	};
	
	font = "PuristaMedium";
	size = WFMM_FontSize / 2;
	sizeEx = WFMM_FontSize / 2;
};

//// WF Main Menu  
class WF_Menu {
	movingEnable = 1;
	idd = 68792001;
	onLoad = "[_this, 'onLoad'] ExecVM 'GUI\GUI_WFMenu.sqf'";
	
	//// BackGround
	////////////////
	class controlsBackground {
	};
	
	//// Controls
	//////////////
	class controls {	
		class CenterIcon: MainMenuButton 
		{
			idc	= 2000;
			x = 0.5 - WFMM_H / 2 * 1.15;
			y = 0.5 - WFMM_H / 2 * 1.15;
			w = WFMM_W * 1.2;
			h = WFMM_H * 1.2;
			Text = "";
			Show = false;
			
			animTextureNormal = "GUI\Images\MainMenu\Center256.paa";
			animTextureDisabled = "GUI\Images\MainMenu\Center256.paa";
			animTextureOver = "GUI\Images\MainMenu\Center256.paa";
			animTextureFocused = "GUI\Images\MainMenu\Center256.paa";
			animTexturePressed = "GUI\Images\MainMenu\Center256.paa";
			animTextureDefault = "GUI\Images\MainMenu\Center256.paa";
		};
		
		//// Big Button
		////////////////
		class TeamMenu: MainMenuButton 
		{
			idc	= 2001;
			x = WFMM_X - WFMM_XD;
			y = WFMM_Y - WFMM_YD * 2;
			Text = "TEAM MENU";
			Show = false;
			action = "closeDialog 0; createDialog ""WFTeamMenu"";";
		};
		
		class BuyUnits: MainMenuButton 
		{
			idc	= 2002;
			x = WFMM_X - WFMM_XD * 2;
			y = WFMM_Y - WFMM_YD;
			Text = "BUY UNITS";
			Show = false;
			action = "closeDialog 0; createDialog ""WFBuyUnits"";";
		};
		
		class BuyGear: MainMenuButton 
		{
			idc	= 2003;
			x = WFMM_X - WFMM_XD * 2;
			y = WFMM_Y + WFMM_YD;
			Text = "BUY GEAR";
			Show = false;
			action = "closeDialog 0; CreateDialog 'WFGear'";
		};
		
		class TacticalMenu: MainMenuButton 
		{
			idc	= 2004;
			x = WFMM_X - WFMM_XD;
			y = WFMM_Y + WFMM_YD * 2
			Text = "TACTICAL MENU";
			Show = false;
		};
		
		class SupportMenu: MainMenuButton 
		{
			idc	= 2005;
			x = WFMM_X;
			y = WFMM_Y + WFMM_YD * 3;
			Text = "SERVICE MENU";
			Show = false;
			action = "closeDialog 0; CreateDialog 'WFServiceMenu'";
		};
		
		class GroupMenu: MainMenuButton 
		{
			idc	= 2006;
			x = WFMM_X + WFMM_XD;
			y = WFMM_Y + WFMM_YD * 2
			Text = "GROUP MENU";
			Show = false;
		};
		
		class UpgradeMenu: MainMenuButton 
		{
			idc	= 2007;
			x = WFMM_X + WFMM_XD * 2;
			y = WFMM_Y + WFMM_YD;
			Text = "UPGRADE MENU";
			Show = false;
			action = "closeDialog 0; createDialog ""WFUpgrades"";";
		};
		
		class VoteMenu: MainMenuButton 
		{
			idc	= 2008;
			x = WFMM_X + WFMM_XD * 2;
			y = WFMM_Y - WFMM_YD;
			Text = "VOTE MENU";
			Show = false;
			action = "closeDialog 0; [_this, 'Vote'] ExecVM 'GUI\GUI_WFMenu.sqf'";
		};

		class EconomyMenu: MainMenuButton 
		{
			idc	= 2009;
			x = WFMM_X + WFMM_XD;
			y = WFMM_Y - WFMM_YD * 2;
			Text = "ECONOMY MENU";
			Show = false;
		};

		class CommanderMenu: MainMenuButton 
		{
			idc	= 2010;
			x = WFMM_X;
			y = WFMM_Y - WFMM_YD * 3;
			Text = "COMMANDER MENU";
			Show = false;
		};

		
		//// Litle Buttons
		///////////////////
		class LB1: MainMenuButtonLittle
		{
			idc	= 2011;
			x = WFMM_X - WFMM_XD * 1.52;
			y = WFMM_Y + WFMM_YD * 3;
			Text = "CAR";
			Show = false;
			Action = "[] call UnflipCar;";
		};
		class LB2: MainMenuButtonLittle
		{
			idc	= 2012;
			x = WFMM_X + WFMM_XD * 2.14;
			y = WFMM_Y + WFMM_YD * 3;
			Text = "EXIT";
			Show = false;
			Action = "closeDialog 0;";
		};
		class LB3: MainMenuButtonLittle
		{
			idc	= 2013;
			x = WFMM_X - WFMM_XD * 0.52;
			y = WFMM_Y + WFMM_YD * 4;
			Text = "LB1";
			Show = false;
		};
		class LB4: MainMenuButtonLittle
		{
			idc	= 2014;
			x = WFMM_X + WFMM_XD * 1.14;
			y = WFMM_Y + WFMM_YD * 4;
			Text = "LB2";
			Show = false;
		};
	};
};