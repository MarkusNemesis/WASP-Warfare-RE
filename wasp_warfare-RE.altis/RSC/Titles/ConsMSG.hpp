//// RSC Titles
//// Construction MSG "Wrong Place" 
//// DeraKOren
////////////////////////////////////

#define d_x	safezoneX + 0.5 * safezoneW
#define d_y	safezoneY + 0.5 * safezoneH
#define d_w	safezoneW * 0.15
#define d_h	safezoneH * 0.07
	
class MessageDisplay {
	idd = 68791006;
	movingEnable = 0;
	duration = 80;
	fadein = 0;
	controls[]={BackGround,MainText,Message};
	onLoad = "DODisplay = _this";
	
	class BackGround:RscText {
		idc = 1001;
		colorBackground[] = {1,0,0,0.2};
		colorBorder[] = {1,0,0,1};
		borderSize = 0.001; 
		//x=safezoneX + safezoneW - 0.5; y=safezoneY + safezoneH - 0.5; h=safezoneH * 0.1; w=safezoneH * 0.1;
		x = d_x;
		y = d_y;
		w = d_w;
		h = d_h;
		text = "";
	};
	
	class MainText:RscText {
		idc = 1002;
		style= "0x02";
		colorBackground[] = {1,0,0,0.4};
		colorText[] = {1,1,1,1 };
		//x=safezoneX + safezoneW - 0.5; y=safezoneY + safezoneH - 0.5; h=safezoneH * 0.1; w=safezoneH * 0.1;
		x = d_x;
		y = d_y;
		w = d_w;
		h = d_h / 4;
		text = "CAN'T BUILD HERE";
	};
		
	class Message:RscText {
		idc = 1003;
		style= "0x02";
		colorText[] = {1,1,1,0.8 };
		x = d_x;
		y = d_y + d_h / 4;
		w = d_w;
		h = (d_h / 4 )*3;
		text = "Intersection with some object";
    };
  };