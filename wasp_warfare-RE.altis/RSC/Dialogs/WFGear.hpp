//// RSC
//// Buy Gear Menu
//// DeraKOren
///////////////////

#define XSZ		(((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)
#define YSZ		((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)
#define WSZ		(((safezoneW / safezoneH) min 1.2) / 40)
#define HSZ		((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)

#define WEAPON_BG		{0.5, 0.5, 0.5,1}
#define WEAPON_TEXT 	{1, 1, 1, 0.25}
#define	LIST_BG			{0, 0, 0, 0.15}
#define LIST_COLOR		{0.5, 0.5, 0.5, 0.3}	

#define	ShopW			0.07  // Shop Width

class WFGear 
{
	movingEnable = 1;
	idd = 68792003;
	onLoad 				= "[_this, 'onLoad'] ExecVM 'GUI\GUI_WFGear.sqf'";
	onKeyDown	 		= "[_this, 'Close'] call Compile preprocessFileLineNumbers 'GUI\GUI_WFGear.sqf'";

	//// Background class
	//////////////////////
	class controlsBackground 
	{
		/// Shop BackGround
		class ShopBG: RscText
		{
			idc = -1;
			x = (0.178437 - ShopW) * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = (0.196875 + ShopW) * safezoneW;
			h = 0.77 * safezoneH;
			colorBackground[] = FORM_BG;
		};
		class ShopName: RscText_SubTitle
		{
			idc = -1;
			text = "Shop";
			x = (0.178437 - ShopW) * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = (0.196875 + ShopW) * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.2};
		};
		class BlueLine1: RscText
		{
			idc = -1;
			x = (0.178437 - ShopW) * safezoneW + safezoneX;
			y = 0.178 * safezoneH + safezoneY;
			w = (0.196875 + ShopW) * safezoneW;
			h = WFBE_Background_Border_Thick;
			colorBackground[] = WFBE_Background_Border;
		};
		
		/// Inventory BackGround
		class InvetoryBG: RscText
		{
			idc = -1;
			x = 0.381875 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.380625 * safezoneW;
			h = 0.77 * safezoneH;
			colorBackground[] = FORM_BG;
		};
		class InventoryName: RscText_SubTitle
		{
			idc = -1;
			text = "Inventory";
			x = 0.381875 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.380625 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.2};
		};
		class BlueLine2: RscText
		{
			idc = -1;
			x = 0.381875 * safezoneW + safezoneX;
			y = 0.178 * safezoneH + safezoneY;
			w = 0.380625 * safezoneW;
			h = WFBE_Background_Border_Thick;
			colorBackground[] = WFBE_Background_Border;
		};
		
		class BackGroundItem: RscPicture
		{
			idc = -1;
			colorBackground[] = WEAPON_BG;
			colorText[] = WEAPON_TEXT;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayInventory\gradient_gs.paa";
		};
		class BackGroundVest: BackGroundItem
		{
			idc = -1;
			x = 0.454063 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.098 * safezoneH;
		};
		class BackGroundBackpack: BackGroundItem
		{
			idc = -1;
			x = 0.513125 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.098 * safezoneH;
		};
		class BackGroundBinocular: BackGroundItem
		{
			idc = -1;
			x = 0.71 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class BackGroundNVG: BackGroundItem
		{
			idc = -1;
			x = 0.664063 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class BackGroundGlasses: BackGroundItem
		{
			idc = -1;
			x = 0.618125 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class BackGroundHelmet: BackGroundItem
		{
			idc = -1;
			x = 0.572188 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		
		/// Rifle BackGround
		class BackGroundRifle: BackGroundItem
		{
			idc = -1;
			x = 0.572189 * safezoneW + safezoneX;
			y = 0.3544 * safezoneH + safezoneY;
			w = 0.177188 * safezoneW;
			h = 0.084 * safezoneH;
		};
		class BackGroundRifleSilencer: BackGroundItem
		{
			idc = -1;
			x = 0.572188 * safezoneW + safezoneX;
			y = 0.4412 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};	
		class BackGroundRifleLaser: BackGroundItem
		{
			idc = -1;
			x = 0.618125 * safezoneW + safezoneX;
			y = 0.4412 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class BackGroundRifleOptics: BackGroundItem
		{
			idc = -1;
			x = 0.664063 * safezoneW + safezoneX;
			y = 0.4412 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class BackGroundRifleAmmo: BackGroundItem
		{
			idc = -1;
			x = 0.71 * safezoneW + safezoneX;
			y = 0.4412 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		
		/// RPG Background
		class BackGroundRPG: BackGroundItem
		{
			idc = -1;
			x = 0.572188 * safezoneW + safezoneX;
			y = 0.5196 * safezoneH + safezoneY;
			w = 0.177188 * safezoneW;
			h = 0.084 * safezoneH;
		};
		class BackGroundRPGSilencer: BackGroundItem
		{
			idc = -1;
			x = 0.572188 * safezoneW + safezoneX;
			y = 0.6064 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class BackGroundRPGLaser: BackGroundItem
		{
			idc = -1;
			x = 0.618125 * safezoneW + safezoneX;
			y = 0.6064 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class BackGroundRPGOptics: BackGroundItem
		{
			idc = -1;
			x = 0.664063 * safezoneW + safezoneX;
			y = 0.6064 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class BackGroundRPGAmmo: BackGroundItem
		{
			idc = -1;
			x = 0.71 * safezoneW + safezoneX;
			y = 0.6064 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		
		/// Pistol BackGround
		class BackGroundPistol: BackGroundItem
		{
			idc = -1;
			x = 0.572188 * safezoneW + safezoneX;
			y = 0.682 * safezoneH + safezoneY;
			w = 0.177188 * safezoneW;
			h = 0.084 * safezoneH;
		};
		class BackGroundPistolSilencer: BackGroundItem
		{
			idc = -1;
			x = 0.572188 * safezoneW + safezoneX;
			y = 0.7688 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class BackGroundPistolLaser: BackGroundItem
		{
			idc = -1;
			x = 0.618125 * safezoneW + safezoneX;
			y = 0.7688 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class BackGroundPistolOptics: BackGroundItem
		{
			idc = -1;
			x = 0.664063 * safezoneW + safezoneX;
			y = 0.7688 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class BackGroundPistolAmmo: BackGroundItem
		{
			idc = -1;
			x = 0.71 * safezoneW + safezoneX;
			y = 0.7688 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		
		/// Extra things BackGround
		class BackGroundMap: BackGroundItem
		{
			idc = -1;
			x = 0.395 * safezoneW + safezoneX;
			y = 0.7828 * safezoneH + safezoneY;
			w = 0.0328125 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class BackGroundGPS: BackGroundItem
		{
			idc = -1;
			x = 0.429123 * safezoneW + safezoneX;
			y = 0.7828 * safezoneH + safezoneY;
			w = 0.0328125 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class BackGroundRadio: BackGroundItem
		{
			idc = -1;
			x = 0.463248 * safezoneW + safezoneX;
			y = 0.7828 * safezoneH + safezoneY;
			w = 0.0328125 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class BackGroundCompas: BackGroundItem
		{
			idc = -1;
			x = 0.49869 * safezoneW + safezoneX;
			y = 0.7828 * safezoneH + safezoneY;
			w = 0.0328125 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class BackGroundClock: BackGroundItem
		{
			idc = -1;
			x = 0.532812 * safezoneW + safezoneX;
			y = 0.7828 * safezoneH + safezoneY;
			w = 0.0328125 * safezoneW;
			h = 0.056 * safezoneH;
		};
		
		/// List BackGround
		class BackGroundShopList: BackGroundItem
		{
			idc = -1;
			x = (0.220438 - ShopW) * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = (0.150938 + ShopW) * safezoneW;
			h = 0.672 * safezoneH;
			colorBackground[] = LIST_BG;
		};
		class BackGroundInventoryList: BackGroundShopList
		{
			idc = -1;
			x = 0.395 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.3864 * safezoneH;
		};
	};

	//// Control class
	///////////////////
	class controls 
	{		
		/// Shop Buttons
		class w1: RscClickableText
		{
			idc = 1001;
			x = (0.185 - ShopW) * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.0328125 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
			text = "GUI\Images\Gear\Rifle.paa";
			Action = "[_this, 'ShopSelect', 'Primary'] ExecVM 'GUI\GUI_WFGear.sqf'";
		};
		class w2: w1
		{
			idc = 1002;
			y = 0.262 * safezoneH + safezoneY;
			text = "GUI\Images\Gear\RPG.paa";
			Action = "[_this, 'ShopSelect', 'Secondary'] ExecVM 'GUI\GUI_WFGear.sqf'";
		};
		class w3: w1
		{
			idc = 1003;
			y = 0.332 * safezoneH + safezoneY;
			text = "GUI\Images\Gear\Pistol.paa";
			Action = "[_this, 'ShopSelect', 'Handgun'] ExecVM 'GUI\GUI_WFGear.sqf'";
		};
		class w4: w1
		{
			idc = 1004;
			y = 0.402 * safezoneH + safezoneY;
			text = "GUI\Images\Gear\Accessories.paa";
			Action = "[_this, 'ShopSelect', 'Accessories'] ExecVM 'GUI\GUI_WFGear.sqf'";
		};
		class w5: w1
		{
			idc = 1005;
			y = 0.472 * safezoneH + safezoneY;
			text = "GUI\Images\Gear\Ammunition.paa";
			Action = "[_this, 'ShopSelect', 'Ammunition'] ExecVM 'GUI\GUI_WFGear.sqf'";
		};
		class w6: w1
		{
			idc = 1006;
			y = 0.542 * safezoneH + safezoneY;
			text = "GUI\Images\Gear\Equipment.paa";
			Action = "[_this, 'ShopSelect', 'Equipment'] ExecVM 'GUI\GUI_WFGear.sqf'";
		};
		class w7: w1
		{
			idc = 1007;
			y = 0.612 * safezoneH + safezoneY;
			text = "GUI\Images\Gear\HeadItem.paa";
			Action = "[_this, 'ShopSelect', 'HeadItem'] ExecVM 'GUI\GUI_WFGear.sqf'";
		};
		class w8: w1
		{
			idc = 1008;
			y = 0.682 * safezoneH + safezoneY;
			colorBackground[] = {-1,-1,-1,0};
			colorText[] = {1,1,1,0};
			text = "GUI\Images\Gear\Ammo.paa";
			Action = "[_this, 'ShopSelect', 'Ammo'] ExecVM 'GUI\GUI_WFGear.sqf'";
		};
		class w9: w1
		{
			idc = 1009;
			y = 0.752 * safezoneH + safezoneY;
			colorBackground[] = {-1,-1,-1,0};
			colorText[] = {1,1,1,0};
			text = "GUI\Images\Gear\WPAmmo.paa";
			Action = "[_this, 'ShopSelect', 'WPAmmo'] ExecVM 'GUI\GUI_WFGear.sqf'";
		};

		/// ShopList
		class ShopList: RscListNBox
		{
			style = LB_MULTI;
			idc = 1510;
			x = (0.220438 - ShopW) * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = (0.150938 + ShopW) * safezoneW;
			h = 0.672 * safezoneH;
			lineSpacing = 1;
			//fixedWidth = 1;
			canDrag = 1;
			rowHeight = "2 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = LIST_COLOR;
			colorText[] = {1,1,1,1};
			itemBackground[] = {0.5, 0.5, 0.5, 0.5};
			itemSpacing = 0.001000;
			sizeEx = "0.65 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			//sizeEx2 = "0.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			columns[] = {1,-0.01, 0.8};
			
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
						
			onLBDrag  		= "[_this, 'Drag'] call Compile preprocessFileLineNumbers 'GUI\GUI_WFGear.sqf'";
			onLBDragging	= "[_this, 'MouseMove'] call Compile preprocessFileLineNumbers 'GUI\GUI_WFGear.sqf'";
			onLBDrop		= "[_this, 'Drop'] call Compile preprocessFileLineNumbers 'GUI\GUI_WFGear.sqf'"; 
			onLBDblClick 	= "[_this, 'DBClick'] call Compile preprocessFileLineNumbers 'GUI\GUI_WFGear.sqf'"; 
		};
		class CostMoney: RscStructuredText
		{
			idc = 1100;
			text = "Cost: 0 Money: 0"; //--- ToDo: Localize;
			x = (0.185 - ShopW) * safezoneW + safezoneX;
			y = 0.878 * safezoneH + safezoneY;
			w = (0.18375 + ShopW) * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		
		
		/// Inventory
		//////////////
		class Player: RscText
		{
			idc = 1015;
			text = "Player"; //--- ToDo: Localize;
			x = 0.388438 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class Car: RscText
		{
			idc = 1016;
			text = "Car";
			x = 0.454063 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class Ground: RscText
		{
			idc = 1017;
			text = "Ground"; //--- ToDo: Localize;
			x = 0.519688 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class PlayerSelect: RscCombo
		{
			idc = 2100;
			text = "Player"; //--- ToDo: Localize;
			x = 0.395 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.354375 * safezoneW;
			h = 0.028 * safezoneH;
			
			onLBSelChanged = "[_this, 'ComboSelect'] ExecVM 'GUI\GUI_WFGear.sqf'";
		};
		class InventoryMainList: RscText
		{
			idc = 1039;
			x = 0.388438 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.3675 * safezoneW;
			h = 0.63 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
		};
		
		class BackGroundItem: RscPicture
		{
			idc = -1;
			colorBackground[] = WEAPON_BG;
			colorText[] = WEAPON_TEXT;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayInventory\gradient_gs.paa";
		};
		
		//// BackGrond Control for Uniform, Vest, BackPack
		class BackGroundClothes: BackGroundItem
		{
			idc = 4051;
			x = 0.395 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.098 * safezoneH;
			colorBackground[] = WEAPON_BG;
			colorText[] = WEAPON_TEXT;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayInventory\gradient_gs.paa";
		};
		class BackGroundVest: BackGroundItem
		{
			idc = 4052;
			x = 0.454063 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.098 * safezoneH;
		};
		class BackGroundBackpack: BackGroundItem
		{
			idc = 4053;
			x = 0.513125 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.098 * safezoneH;
		};
		
		/// Clothes
		class Clothes: ShopList
		{
			idc = 4101;
			style = 0x30 + 0x800;
			x = 0.395 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.098 * safezoneH;
			colorBackground[] = WEAPON_BG;
			colorText[] = {1, 1, 1, 1};
			rows = 1;
			columns[] = {1, 0};
			canDrag = 1;
			rowHeight = 0.115;
			itemSpacing = 0.001000;
			colorSelect[] = {0,0,0,0};
			colorSelect2[] = {1,0.5,0,0};
			colorSelectBackground[] = {0.6,0.6,0.6,0};
			colorSelectBackground2[] = {0.2,0.2,0.2,0};
			class ScrollBar
			{
				arrowEmpty = "#(argb,8,8,3)color(1,1,1,0)";
				arrowFull = "#(argb,8,8,3)color(1,1,1,0)";
				border = "#(argb,8,8,3)color(1,1,1,0)";
				color[] = {1,1,1,0};
				colorActive[] = {1,1,1,0};
				colorDisabled[] = {1,1,1,0};
				thumb = "#(argb,8,8,3)color(1,1,1,0)";
			};
			//text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_uniform_gs.paa";
			onLBSelChanged  = "[4051, 'StorageSelect'] ExecVM 'GUI\GUI_WFGear.sqf'";
			onLBDrag  		= "[_this, 'Drag'] call Compile preprocessFileLineNumbers 'GUI\GUI_WFGear.sqf'";
			onLBDragging	= "[_this, 'MouseMove'] call Compile preprocessFileLineNumbers 'GUI\GUI_WFGear.sqf'";
			onLBDrop		= "[_this, 'Drop'] call Compile preprocessFileLineNumbers 'GUI\GUI_WFGear.sqf'"; 

		};
		class Vest: Clothes
		{
			idc = 4102;
			x = 0.454063 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.098 * safezoneH;
			colorBackground[] = WEAPON_BG;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_vest_gs.paa";
			onLBSelChanged = "[4052, 'StorageSelect'] ExecVM 'GUI\GUI_WFGear.sqf'";
		};
		class Backpack: Clothes
		{
			idc = 4103;
			x = 0.513125 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.098 * safezoneH;
			colorBackground[] = WEAPON_BG;
			//text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_backpack_gs.paa";
			onLBSelChanged = "[4053, 'StorageSelect'] ExecVM 'GUI\GUI_WFGear.sqf'";
		};
		
		/// Head Item
		class Binocular: Clothes
		{
			idc = 4201;
			x = 0.71 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			//text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_binocular_gs.paa";
			rowHeight = 0.09;
			onLBSelChanged = "";
		};
		class NVG: Binocular
		{
			idc = 4202;
			x = 0.664063 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_nvg_gs.paa";
		};
		class Glasses: Binocular
		{
			idc = 4203;
			x = 0.618125 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_glasses_gs.paa";
		};
		class Helmet: Binocular
		{
			idc = 4204;
			x = 0.572188 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_helmet_gs.paa";
		};
		
		/// Extra things
		class Map: Clothes
		{
			idc = 4205;
			x = 0.395 * safezoneW + safezoneX;
			y = 0.7828 * safezoneH + safezoneY;
			w = 0.0328125 * safezoneW;
			h = 0.056 * safezoneH;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_map_gs.paa";
			rowHeight = 0.07;
			onLBSelChanged = "";
		};
		class GPS: Map
		{
			idc = 4206;
			x = 0.429123 * safezoneW + safezoneX;
			y = 0.7828 * safezoneH + safezoneY;
			w = 0.0328125 * safezoneW;
			h = 0.056 * safezoneH;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_gps_gs.paa";
		};
		class Radio: Map
		{
			idc = 4207;
			x = 0.463248 * safezoneW + safezoneX;
			y = 0.7828 * safezoneH + safezoneY;
			w = 0.0328125 * safezoneW;
			h = 0.056 * safezoneH;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_radio_gs.paa";
		};
		class Compas: Map
		{
			idc = 4208;
			x = 0.49869 * safezoneW + safezoneX;
			y = 0.7828 * safezoneH + safezoneY;
			w = 0.0328125 * safezoneW;
			h = 0.056 * safezoneH;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_compass_gs.paa";
		};
		class Clock: Map
		{
			idc = 4209;
			x = 0.532812 * safezoneW + safezoneX;
			y = 0.7828 * safezoneH + safezoneY;
			w = 0.0328125 * safezoneW;
			h = 0.056 * safezoneH;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_watch_gs.paa";
		};
		
		
		/// Equipment List
		class EquipmentList: ShopList
		{
			idc = 1511;
			x = 0.395 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.3864 * safezoneH;
		};
		
		/// Progress Bar
		class Mass: RscProgress
		{
			idc = 2300;
			text = "";
			x = 0.590564 * safezoneW + safezoneX;
			y = 0.1976 * safezoneH + safezoneY;
			w = 0.162749 * safezoneW;
			h = 0.02 * safezoneH;
			colorBar[] = {0.9, 0.9, 0.9, 0.9};
			colorExtBar[] = {1, 1, 1, 1};
			colorFrame[] = {1, 1, 1, 1};
			colorbackground[] = {1, 1, 1, 0.5};
			colorText[] = {1, 1, 1, 1};
			font = "PuristaMedium";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";	
		};
		class UniformMass: Mass 
		{
			idc = 2301;
			x = 0.395 * safezoneW + safezoneX;
			y = 0.374 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.01 * safezoneH;
		};
		class VestMass: Mass
		{
			idc = 2302;
			x = 0.454063 * safezoneW + safezoneX;
			y = 0.374 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.01 * safezoneH;
		};
		class BackpackMass: Mass
		{
			idc = 2303;
			x = 0.513125 * safezoneW + safezoneX;
			y = 0.374 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.01 * safezoneH;
		};
		
		
		/// Rifle
		class Rifle: Clothes
		{
			idc = 5101;
			x = 0.572189 * safezoneW + safezoneX;
			y = 0.3544 * safezoneH + safezoneY;
			w = 0.177188 * safezoneW;
			h = 0.084 * safezoneH;
			colorBackground[] = WEAPON_BG;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_primary_gs.paa";
			rowHeight = 0.12;
			columns[] = {1, 0.2};
			onLBSelChanged = "";
		};
		class RifleSilencer: Clothes
		{
			idc = 5102;
			x = 0.572188 * safezoneW + safezoneX;
			y = 0.4412 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			colorBackground[] = WEAPON_BG;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa";
			rowHeight = 0.08;
			onLBSelChanged = "";
		};	
		class RifleLaser: RifleSilencer
		{
			idc = 5103;
			x = 0.618125 * safezoneW + safezoneX;
			y = 0.4412 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			colorBackground[] = WEAPON_BG;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa";
		};
		class RifleOptics: RifleSilencer
		{
			idc = 5104;
			x = 0.664063 * safezoneW + safezoneX;
			y = 0.4412 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			colorBackground[] = WEAPON_BG;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa";
		};
		class RifleAmmo: RifleSilencer
		{
			idc = 5105;
			x = 0.71 * safezoneW + safezoneX;
			y = 0.4412 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			colorBackground[] = WEAPON_BG;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa";
		};


		/// RPG
		class RPG: Rifle
		{
			idc = 5201;
			x = 0.572188 * safezoneW + safezoneX;
			y = 0.5196 * safezoneH + safezoneY;
			w = 0.177188 * safezoneW;
			h = 0.084 * safezoneH;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_secondary_gs.paa";
		};
		class RPGSilencer: RifleSilencer
		{
			idc = 5202;
			x = 0.572188 * safezoneW + safezoneX;
			y = 0.6064 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class RPGLaser: RifleLaser
		{
			idc = 5203;
			x = 0.618125 * safezoneW + safezoneX;
			y = 0.6064 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class RPGOptics: RifleOptics
		{
			idc = 5204;
			x = 0.664063 * safezoneW + safezoneX;
			y = 0.6064 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class RPGAmmo: RifleAmmo
		{
			idc = 5205;
			x = 0.71 * safezoneW + safezoneX;
			y = 0.6064 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};

		
		/// Pistol
		class Pistol: Rifle
		{
			idc = 5301;
			x = 0.572188 * safezoneW + safezoneX;
			y = 0.682 * safezoneH + safezoneY;
			w = 0.177188 * safezoneW;
			h = 0.084 * safezoneH;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_hgun_gs.paa";
		};
		class PistolSilencer: RifleSilencer
		{
			idc = 5302;
			x = 0.572188 * safezoneW + safezoneX;
			y = 0.7688 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class PistolLaser: RifleLaser
		{
			idc = 5303;
			x = 0.618125 * safezoneW + safezoneX;
			y = 0.7688 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class PistolOptics: RifleOptics
		{
			idc = 5304;
			x = 0.664063 * safezoneW + safezoneX;
			y = 0.7688 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class PistolAmmo: RifleAmmo
		{
			idc = 5305;
			x = 0.71 * safezoneW + safezoneX;
			y = 0.7688 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
		};
		
		/// Inventory Button
		class CloseButton: RscButton_Main
		{
			idc = 2400;
			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.664063 * safezoneW + safezoneX;
			y = 0.878 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.0364 * safezoneH;
			Action = "[_this, 'Close'] call Compile preprocessFileLineNumbers 'GUI\GUI_WFGear.sqf'; CloseDialog 0;";
		};
		class BuyButton: RscButton_Main
		{
			idc = 2401;
			text = "BUY"; //--- ToDo: Localize;
			x = 0.572188 * safezoneW + safezoneX;
			y = 0.878 * safezoneH + safezoneY;
			w = 0.084 * safezoneW;
			h = 0.0364 * safezoneH;
			Action = "[_this, 'Buy'] call Compile preprocessFileLineNumbers 'GUI\GUI_WFGear.sqf'";
		};
		class SaveEquipment: RscButton_Main
		{
			idc = 2402;
			text = "Save Equipment"; //--- ToDo: Localize;
			x = 0.388438 * safezoneW + safezoneX;
			y = 0.878 * safezoneH + safezoneY;
			w = 0.177188 * safezoneW;
			h = 0.0336 * safezoneH;
		};
		
		//// Helpers
		///////////////////////////
		
		//// DragAndDrop 
		class DragAndDrop: RscPicture
		{
			idc = 9001;
			style = 0x30 + 0x800;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.07 * safezoneH;
			colorBackground[] = {0,0,0,0}; 
			colorText[] = {1,1,1,1};
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa";
		};
		
		//// Tooltip (Short Description)
		class ShortDescript: RscStructuredText
		{
			idc = 9002;
			
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			text = "Short Descript";
		};
	};
};
	