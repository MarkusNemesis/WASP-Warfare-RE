
class Params {
	class WF_PLAYER_GROUP_AMOUNT {
		title = "AI: player's group size";
		values[] = {2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,35,40,45,50,60,70,80,90,100};
		texts[] = {"2","4","6","8","10","12","14","16","18","20","22","24","26","28","30","35","40","45","50","60","70","80","90","100"};
		default = 12;
	};

	class WF_ENABLE_UPGRADE_MODULE {
		title = "BASE: Enable upgrades";
		values[] = {0,1};
		texts[] = {"Disabled", "Enabled"};
		default = 1;
	};
	class WF_START_SUPPLY_AMOUNT {
		title = "ECONOMY: start supply amount ";
		values[] = {2000,3000,4000,5000,6000,7000,8000,9000,10000};
		texts[] = {"2000 S","3000 S","4000 S","5000 S","6000 S","7000 S","8000 S","9000 S","10000 S"};
		default = 10000;
	};
	class WF_START_MONEY_AMOUNT {
		title = "ECONOMY: start money amount";
		values[] = {2000,3000,4000,5000,6000,7000,8000,9000,10000};
		texts[] = {"2000 $","3000 $","4000 $","5000 $","6000 $","7000 $","8000 $","9000 $","10000 $"};
		default = 10000;
	};

	class WF_START_DAY_TIME {
		title = "ENVIRONMENT: start time of day";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
		texts[] = {"00:00","01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00",
		"12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00"};
		default = 9;
	};

	class WF_OCCUPATION_FORCES_AMOUNT {
		title = "Towns: occupation forces";
		values[] = {-1,0,1,2,3};
		texts[] = {"Disabled","Light","Medium","Hard","Impossible"};
		default = 1;
	};

	class WF_RESISTANCE_FORCES_AMOUNT {
		title = "Towns: resistance forces";
		values[] = {-1,0,1,2,3};
		texts[] = {"Disabled","Light","Medium","Hard","Impossible"};
		default = 1;
	};
};