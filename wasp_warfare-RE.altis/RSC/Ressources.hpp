/* Controls Definitions */

#define CT_STATIC 			0
#define CT_BUTTON 			1
#define CT_EDIT 			2
#define CT_COMBO 			4
#define CT_LISTBOX 			5
#define CT_CLICKABLETEXT	11
#define CT_STRUCTUREDTEXT	13
#define CT_LISTNBOX 		102
#define CT_XSLIDER			43

#define ST_POS 				0x0F
#define ST_HPOS 			0x03
#define ST_VPOS 			0x0C
#define ST_LEFT 			0x00
#define ST_RIGHT 			0x01
#define ST_CENTER 			0x02
#define ST_DOWN 			0x04
#define ST_UP				0x08
#define ST_VCENTER 			0x0c

#define ENABLE_SHADOW 		shadow = 2

#define CT_MAP				101
#define ST_PICTURE 			48
#define ST_TEXT_BG 			128

 #define ST_TYPE 0xF0
 #define ST_SINGLE 0
 #define ST_MULTI 16
 #define ST_TITLE_BAR 32
 #define ST_PICTURE 48
 #define ST_FRAME 64
 #define ST_BACKGROUND 80
 #define ST_GROUP_BOX 96
 #define ST_GROUP_BOX2 112
 #define ST_HUD_BACKGROUND 128
 #define ST_TILE_PICTURE 144
 #define ST_WITH_RECT 160
 #define ST_LINE 176
 #define ST_SHADOW 0x100
 #define ST_NO_RECT 0x200 // this style works for CT_STATIC in conjunction with ST_MULTI
 #define ST_KEEP_ASPECT_RATIO 0x800
 #define ST_TITLE ST_TITLE_BAR + ST_CENTER
 // Slider styles
 #define SL_DIR 0x400 #define SL_VERT 0
 #define SL_HORZ 0x400
 #define SL_TEXTURES 0x10

 // Listbox styles
 #define LB_TEXTURES 0x10
 #define LB_MULTI 0x20



	/* Yellow */
	#define subcolor1 {1,1,0.7,1}
	#define subcolor1hex "#eee58b"
	#define WFBE_SoundClick ""
	#define WFBE_SoundEnter ""
	#define WFBE_SoundEscape ""



/* RscPicture */
//--- Picture
class RscPicture {
	type = CT_STATIC;
	idc = -1;
	style = ST_PICTURE;
	shadow = 0;
	colorText[] = {1,1,1,1};
	//colorbackground[] = {0, 0, 0, 0.5};
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
	font = "PuristaMedium";
	text="";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
};

class RscPictureKeepAspect : RscPicture { //Coin Menu
	style = 0x30 + 0x800;
};

class IGUIBack { //Coin Menu
	type = CT_STATIC;
	idc = 124;
	style = ST_TEXT_BG;
	text = "";
	colorText[] = {0, 0, 0, 0};
	font = "PuristaMedium";
	sizeEx = 0.0;
	x = 0.1;
	y = 0.1;
	w = 0.1;
	h = 0.1;
	colorbackground[] = {0, 0, 0, 0.6};
};

/* RscButton */
class RscButton {
	type = 1;
	idc = -2;
	style = 0x02 + 0x100;
	x = 0;
	y = 0;
	w = 0;
	h = 0.036;
	text = "";
	font = "PuristaMedium";
	sizeEx = 0.035;
	shadow = 2;
	colorText[] = {1, 1, 1, 0.8};
	colorBackground[] = {0.5882, 0.5882, 0.3529, 0.7};
	colorBackgroundActive[] = {0.5882, 0.5882, 0.3529, 1};
	colorDisabled[] = {0.5, 0.5, 0.5, 0.8};
	colorBackgroundDisabled[] = {0, 0, 0, 0.6};
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorFocused[] = {0.5882, 0.5882, 0.3529, 0.7};
	colorShadow[] = {0.023529, 0, 0.0313725, 1};
	colorBorder[] = {0.023529, 0, 0.0313725, 1};
	borderSize = 0.0;
	soundEnter[] = {"", 0.09, 1};
	soundPush[] = {"", 0.09, 1};
	soundClick[] = {"", 0.07, 1};
	soundEscape[] = {"", 0.09, 1};
};
class RscButton_Main : RscButton {
	colorBackground[] = WFBE_Menu_Button_Color;
	colorBackgroundActive[] = WFBE_Menu_Button_Color;
	colorFocused[] = WFBE_Menu_Button_Focused_Color;
	colorText[] = WFBE_Menu_Button_Text_Color;
};
class RscButton_Back : RscButton {
	w = 0.04;
	h = 0.04;
	text = "<<";
	shadow = 2;
	sizeEx = 0.035;
};
class RscButton_Exit : RscButton {
	w = 0.04;
	h = 0.04;
	text = "X";
	shadow = 2;
	sizeEx = 0.035;
	colorText[] = {1, 1, 1, 0.8};
	colorBackground[] = {0.5020, 0, 0, 1};
	colorBackgroundActive[] = {0.9, 0, 0, 1};
	colorFocused[] = {0.5020, 0, 0, 1};
};

/* RscShortcutButton */
class RscShortcutButton {
	type = 16;
	idc = -2;
	style = 0x800 + 0x200 + 16 + 0x02;
	default = 0;
	color[] = {0.543, 0.5742, 0.4102, 1.0};
	color2[] = {0.95, 0.95, 0.95, 1};
	colorBackground[] = {1, 1, 1, 1};
	colorbackground2[] = {1, 1, 1, 0.4};
	colorDisabled[] = {1, 1, 1, 0.25};
	periodFocus = 1.2;
	periodOver = 0.8;
	class HitZone {
		left = 0.03;
		top = 0.05;
		right = 0.005;
		bottom = 0.005;
	};
	class ShortcutPos {
		left = 0;
		top = 0;
		w = 0.15;
		h = 0.15;
	};
	 class TextPos {
		left = 0.04;
		top = 0.085;
		right = 0.1;
		bottom = 0.085;
	};
	animTextureNormal = "GUI\Images\MainMenu\MB_Normal.paa";
	animTextureDisabled = "GUI\Images\MainMenu\MB_Disabled.paa";
	animTextureOver = "GUI\Images\MainMenu\MB_Focus.paa";
	animTextureFocused = "GUI\Images\MainMenu\MB_Normal.paa";
	animTexturePressed = "GUI\Images\MainMenu\MB_Click.paa";
	animTextureDefault = "GUI\Images\MainMenu\MB_Normal.paa";

	textureNoShortcut = "";
	period = 0.4;
	font = "PuristaMedium";
	size = 0.035;
	sizeEx = 0.035;
	text = "";
	soundEnter[] = {"", 0.09, 1};
	soundPush[] = {"", 0.09, 1};
	soundClick[] = {"", 0.07, 1};
	soundEscape[] = {"", 0.09, 1};
	action = "";
	class Attributes {
		font = "PuristaMedium";
		color = "#42b6ff";
		align = "center";
		shadow = "true";
	};
	class AttributesImage {
		font = "PuristaMedium";
		color = "#42b6ff";
		align = "center";
	};
};
class RscIGUIShortcutButton : RscShortcutButton {
	style = 2;
	color[] = {1, 1, 1, 1};
	color2[] = {1, 1, 1, 0.85};
	colorBackground[] = {1, 1, 1, 1};
	colorbackground2[] = {1, 1, 1, 0.85};
	colorDisabled[] = {1, 1, 1, 0.4};
	class HitZone {
		left = 0.001;
		top = 0.001;
		right = 0.001;
		bottom = 0.001;
	};
	class ShortcutPos {
		left = -0.006;
		top = -0.007;
		w = 0.0392157;
		h = 0.0522876;
	};
	class TextPos {
		left = 0.02;
		top = 0.0;
		right = 0.002;
		bottom = 0.016;
	};

	class Attributes {
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "center";
		shadow = "true";
	};
	class AttributesImage {
		font = "PuristaMedium";
		color = "#ffffff";
		align = "center";
	};
};
class RscShortcutButtonMain: RscShortcutButton {
	w = 0.1;
	h = 0.1;
	color[] = {1, 1, 1, 1};
	colorDisabled[] = {1, 1, 1, 1};
	class HitZone {
		left = 0.0;
		top = 0.0;
		right = 0.0;
		bottom = 0.0;
	};
	class ShortcutPos {
		left = 0;
		top = 0;
		w = 0;
		h = 0;
	};
	class TextPos {
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
	period = 0.5;
	font = "PuristaMedium";
	size = 0.03;
	sizeEx = 0.03;
	text = "";
	soundEnter[] = {"\A3\ui_f\data\sound\soundEnter.wss", 0.09, 1};
	soundPush[] = {"\A3\ui_f\data\sound\soundPush.wss", 0.09, 1};
	soundClick[] = {"\A3\ui_f\data\sound\soundClick.wss", 0.07, 1};
	soundEscape[] = {"\A3\ui_f\data\sound\soundEscape.wss", 0.09, 1};
	action = "";
	class Attributes {
		font = "PuristaMedium";
		color = "#ffffff";
		align = "center";
		shadow = "false";
	};
	class AttributesImage {
		font = "PuristaMedium";
		color = "#ffffff";
		align = "false";
	};
};

/* CheckBox */
class RscCheckbox {
	idc = -2;
	type = CT_CHECKBOXES;
	style = ST_CENTER;
	x = 0.1;
	y = 0.18;
	w = 0.15;
	h = 0.15;

	colorText[] = {1, 0, 0, 1};
	color[] = {0, 1, 0, 1}; //seems nothing to change, but define to avaoid errors
	colorTextSelect[] = {0, 0.8, 0, 1};
	colorSelect[] = {0, 0, 0, 1};
	colorTextDisable[] = {0.4, 0.4, 0.4, 1};
	colorDisable[] = {0.4, 0.4, 0.4, 1};

	font = "PuristaMedium";
	sizeEx = 0.035;
	rows = 3;
	columns = 2;
	strings[] = {"Entry 1","Entry 2","Entry 3","Entry 4","Entry 5","Entry 6"};

	//Simple UI event handler to show response on clicks
	//onCheckBoxesSelChanged = "hint format[""Checkbox change:\n%1\nEntry#: %2\nNewState: %3"",(_this select 0),(_this select 1),(_this select 2)];";
};

/* RscListBox */
class RscListBox {
	idc = -2;
	type = 5;
	style = 0 + 0x10;
	font = "PuristaMedium";
	sizeEx = 0.04221;
	color[] = {0.2588, 0.7137, 1, 1};
	colorText[] = {1, 1, 1, 0.75};
	colorScrollbar[] = {0.95, 0, 0, 1};
	colorSelect[] = {0, 0, 0, 0.7};
	colorSelect2[] = {0, 0, 0, 0.7};
	colorSelectBackground[] = {0.2588, 0.7137, 1, 1};
	colorSelectBackground2[] = {0.2588, 0.7137, 1, 1};
        colorDisabled[] = {1, 1, 1, 0.3};
	columns[] = {0.1, 0.7, 0.1, 0.1};
	period = 0;
	colorBackground[] = {0, 0, 0, 1};
	maxHistoryDelay = 1.0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	soundSelect[] = {"\A3\ui_f\data\sound\new1", 0.09, 1};
	class ListScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "GUI\Images\igui_scrollbar_thumb_ca.paa";
		arrowFull = "GUI\Images\igui_arrow_top_active_ca.paa";
		arrowEmpty = "GUI\Images\igui_arrow_top_ca.paa";
		border = "GUI\Images\igui_border_scroll_ca.paa";
	};
};
class RscListNBox {
	type = CT_LISTNBOX;
	style = 0x20;
	shadow = 0;
	font = "PuristaMedium";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	color[] = {0.95,0.95,0.95,1};
	colorText[] = {1,1,1,1.0};
	colorDisabled[] = {1,1,1,0.25};
	colorScrollbar[] = {0.95,0.95,0.95,1};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelectBackground[] = {0.95,0.95,0.95,1};
	colorSelectBackground2[] = {1,1,1,0.5};
	period = 1.2;
	soundSelect[] = {"\A3\ui_f\data\sound\new1",0.09,1};
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	maxHistoryDelay = 1.0;
	idcRight = -1;
	idcLeft = -1;
	drawSideArrows = 0;
	class ScrollBar
	{
		color[] = {0,0,0,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
};
class RscListBoxA : RscListBox {
	type = 102;
	lineSpacing = 1;
	sizeEx = 0.029;
	rowHeight = 0.03;
	style = 16;
    colorDisabled[] = {1, 1, 1, 0.3};
	//arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	//arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
};

/* RscText */
class RscText {
	type = CT_STATIC;
	idc = -1;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = ST_LEFT;
	shadow = 1;
	colorShadow[] = {0,0,0,0.5};
	font = "PuristaMedium";
	text="";
	SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1,1,1,1.0};
	colorBackground[] = {0,0,0,0};
	linespacing = 1;
};

class RscText_Title : RscText {
	h = 0.04;
	colorText[] = {0.2588, 0.7137, 1, 1};
	sizeEx = 0.045;
	shadow = 1;
};
class RscText_SubTitle : RscText {
	h = 0.04;
	colorText[] = {0.2588, 0.7137, 1, 0.9};
	sizeEx = 0.035;
	shadow = 1;
};
class RscText_Small : RscText {
	h = 0.037;
	colorText[] = {0.9333, 0.8980, 0.5451, 0.9};
	sizeEx = 0.025;
	shadow = 2;
};

class RscEdit : RscText {
	type = CT_EDIT;
	font = "PuristaMedium";
	sizeEx = 0.03;
	colorText[] = {1, 1, 1, 0.75};
	colorSelection[] = {0.2588, 0.7137, 1, 1};
	autocomplete = true;
};

/* RscStructuredText */
class RscStructuredText {
	type = 13;
	idc = -2;
	style = 0;
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = 0.03421;
	colorText[] = subcolor1;
	class Attributes {
		font = "PuristaMedium";
		color = subcolor1hex;
		align = "left";
		shadow = true;
	};
};

/* RscXSliderH */
class RscXSliderH {
	idc = -2;
	type = CT_XSLIDER;
	style = "0x400  + 0x10";
	x = 0;
	y = 0;
	h = 0.029412;
	w = 0.4;
	color[] = {1, 1, 1, 0.4};
	colorActive[] = {1, 1, 1, 1};
	colorDisabled[] = {1, 1, 1, 0.2};
	arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
	thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
};

/* RscCombo */
class RscCombo {
	idc = -2;
	type = 4;
	style = 1;
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.035;
	colorSelect[] = {0, 0, 0, 0.7};
	colorText[] = {1, 1, 1, 0.75};
	colorBackground[] = {0,0,0,0.75};
	colorSelectBackground[] = {0.2588, 0.7137, 1, 1};
	colorScrollbar[] = {0.023529, 0, 0.0313725, 1};
	arrowEmpty = "GUI\Images\ui_arrow_combo_ca.paa";
	arrowFull = "GUI\Images\ui_arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	color[] = {0.2588, 0.7137, 1, 1};
	colorActive[] = {0, 0, 0, 1};
	colorDisabled[] = {0, 0, 0, 0.3};
	font = "PuristaMedium";
	sizeEx = 0.031;
	soundSelect[] = {"\A3\ui_f\data\sound\new1", 0.09, 1};
	soundExpand[] = {"\A3\ui_f\data\sound\new1", 0.09, 1};
	soundCollapse[] = {"\A3\ui_f\data\sound\new1", 0.09, 1};
	maxHistoryDelay = 1.0;
	class ComboScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "GUI\Images\ui_scrollbar_thumb_ca.paa";
		arrowFull = "GUI\Images\ui_arrow_top_active_ca.paa";
		arrowEmpty = "GUI\Images\ui_arrow_top_ca.paa";
		border = "GUI\Images\ui_border_scroll_ca.paa";
	};
};

/* RscClickableText */
class RscClickableText {
	idc = -2;
	type = 11;
	style = 48 + 0x800;
	color[] = {0.85,0.85,0.85,0.7};
	colorActive[] = {0.2588, 0.7137, 1, 0.9};
	colorBackground[] = {0.6, 0.8392, 0.4706, 1};
	colorBackgroundSelected[] = {0.6, 0.8392, 0.4706, 1};
	colorFocused[] = {0.0, 0.0, 0.0, 0};
	colorDisabled[] = {-1,-1,-1,0.75};
	font = "PuristaMedium";
	sizeEx = 0.03921;
	soundEnter[] = {"",0.09,1};
	soundPush[] = {"",0.0,0};
	soundClick[] = {"",0.07,1};
	soundEscape[] = {"",0.09,1};
	w = 0.275;
	h = 0.04;
	text = "";
};

/* ActiveText */
class RscActiveText
{
	idc = -1;
	x = 0;
	y = 0;
	h = 0.035000;
	w = 0.035000;
	font = "PuristaMedium";
	shadow = 2;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	color[] = {0, 0, 0, 1};
	colorText[] = {0, 0, 0, 1};
	colorActive[] = {0.300000, 0.400000, 0, 1};
};

class RscProgress
{
	type = 8;
	style = 0;
	colorFrame[] = {0,0,0,1};
	colorBar[] = {1,1,1,1};
	texture = "#(argb,8,8,3)color(1,1,1,1)";
	w = 1;
	h = 0.03;
};

/* RscMapControl */
class RscMapControl {
	type = CT_MAP;
	style = ST_PICTURE;
	moveOnEdges = 1;
	x = "SafeZoneXAbs";
	y = "SafeZoneY + 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "SafeZoneWAbs";
	h = "SafeZoneH - 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	colorText[] = {0, 0, 0, 1};
	font = "PuristaMedium";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 0;
	ptsPerSquareSea = 5;
	ptsPerSquareTxt = 3;
	ptsPerSquareCLn = 10;
	ptsPerSquareExp = 10;
	ptsPerSquareCost = 10;
	ptsPerSquareFor = 9;
	ptsPerSquareForEdge = 9;
	ptsPerSquareRoad = 6;
	ptsPerSquareObj = 9;
	showCountourInterval = 0;
	scaleMin = 0.001;
	scaleMax = 1.0;
	scaleDefault = 0.16;
	maxSatelliteAlpha = 0.85;
	alphaFadeStartScale = 0.35;
	alphaFadeEndScale = 0.4;
	colorBackground[] = {0.969,0.957,0.949,1.0};
	colorSea[] = {0.467,0.631,0.851,0.5};
	colorForest[] = {0.624,0.78,0.388,0.5};
	colorForestBorder[] = {0.0,0.0,0.0,0.0};
	colorRocks[] = {0.0,0.0,0.0,0.3};
	colorRocksBorder[] = {0.0,0.0,0.0,0.0};
	colorLevels[] = {0.286,0.177,0.094,0.5};
	colorMainCountlines[] = {0.572,0.354,0.188,0.5};
	colorCountlines[] = {0.572,0.354,0.188,0.25};
	colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
	colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
	colorPowerLines[] = {0.1,0.1,0.1,1.0};
	colorRailWay[] = {0.8,0.2,0.0,1.0};
	colorNames[] = {0.1,0.1,0.1,0.9};
	colorInactive[] = {1.0,1.0,1.0,0.5};
	colorOutside[] = {0.0,0.0,0.0,1.0};
	colorTracks[] = {0.84,0.76,0.65,0.15};
	colorTracksFill[] = {0.84,0.76,0.65,1.0};
	colorRoads[] = {0.7,0.7,0.7,1.0};
	colorRoadsFill[] = {1.0,1.0,1.0,1.0};
	colorMainRoads[] = {0.9,0.5,0.3,1.0};
	colorMainRoadsFill[] = {1.0,0.6,0.4,1.0};
	colorGrid[] = {0.1,0.1,0.1,0.6};
	colorGridMap[] = {0.1,0.1,0.1,0.6};
	fontLabel = "PuristaMedium";
	sizeExLabel = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontGrid = "TahomaB";
	sizeExGrid = 0.02;
	fontUnits = "TahomaB";
	sizeExUnits = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontNames = "PuristaMedium";
	sizeExNames = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
	fontInfo = "PuristaMedium";
	sizeExInfo = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontLevel = "TahomaB";
	sizeExLevel = 0.02;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	class Legend {
		x = "SafeZoneX + 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		y = "SafeZoneY + safezoneH - 4.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		h = "3.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		font = "PuristaMedium";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		colorBackground[] = {1,1,1,0.5};
		color[] = {0,0,0,1};
	};
	class Task {
		icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
		iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
		iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
		iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
		iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
		color[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
		colorCreated[] = {1,1,1,1};
		colorCanceled[] = {0.7,0.7,0.7,1};
		colorDone[] = {0.7,1,0.3,1};
		colorFailed[] = {1,0.3,0.2,1};
		size = 27;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class CustomMark {
		icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		color[] = {0,0,0,1};
	};
	class Command {
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class Bush {
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		color[] = {0.45,0.64,0.33,0.4};
		size = "14/2";
		importance = "0.2 * 14 * 0.05 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Rock {
		icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
		color[] = {0.1,0.1,0.1,0.8};
		size = 12;
		importance = "0.5 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class SmallTree {
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		color[] = {0.45,0.64,0.33,0.4};
		size = 12;
		importance = "0.6 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Tree {
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		color[] = {0.45,0.64,0.33,0.4};
		size = 12;
		importance = "0.9 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class busstop {
		icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1,1,1,1};
	};
	class fuelstation {
		icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1,1,1,1};
	};
	class hospital {
		icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1,1,1,1};
	};
	class church {
		icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1,1,1,1};
	};
	class lighthouse {
		icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1,1,1,1};
	};
	class power {
		icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1,1,1,1};
	};
	class powersolar {
		icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1,1,1,1};
	};
	class powerwave {
		icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1,1,1,1};
	};
	class powerwind {
		icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1,1,1,1};
	};
	class quay {
		icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1,1,1,1};
	};
	class shipwreck {
		icon = "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1,1,1,1};
	};
	class transmitter {
		icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1,1,1,1};
	};
	class watertower {
		icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1,1,1,1};
	};
	class Cross {
		icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {0,0,0,1};
	};
	class Chapel {
		icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {0,0,0,1};
	};
	class Bunker {
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size = 14;
		importance = "1.5 * 14 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
		color[] = {0,0,0,1};
	};
	class Fortress {
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
		color[] = {0,0,0,1};
	};
	class Fountain{
		icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
		size = 11;
		importance = "1 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
		color[] = {0,0,0,1};
	};
	class Ruin{
		icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
		size = 16;
		importance = "1.2 * 16 * 0.05";
		coefMin = 1;
		coefMax = 4;
		color[] = {0,0,0,1};
	};
	class Stack	{
		icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
		color[] = {0,0,0,1};
	};
	class Tourism	{
		icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.7;
		coefMax = 4;
		color[] = {0,0,0,1};
	};
	class ViewTower	{
		icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.5;
		coefMax = 4;
		color[] = {0,0,0,1};
	};
	class Waypoint {
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		color[] = {0,0,0,1};
		size = 14;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.5;
		coefMax = 4;
	};
	class WaypointCompleted {
		icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
		color[] = {0,0,0,1};
		size = 14;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.5;
		coefMax = 4;
	};
	class ActiveMarker {
		color[] = {0.3,0.1,0.9,1};
		size = 50;
	};
};


class RscControlsGroup
{
	type = 15;
	idc = -1;
	style = 0;
	x = 0;
	y = 0;
	w = 1;
	h = 1;
	class VScrollbar
	{
		color[] = {1, 1, 1, 1};
		width = 0.021;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = false;
	};
	class HScrollbar
	{
		color[] = {1, 1, 1, 1};
		height = 0.028;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = false;
	};
	class ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] ={1,1,1,0.3};
		thumb = "#(argb,8,8,3)color(1,1,1,1)";
		arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
		arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
		border = "#(argb,8,8,3)color(1,1,1,1)";
	};
	class Controls {};
};
