//// RSC
//// Sounds Config
//// DeraKOren
///////////////////

//Town, Captured, lost, Hostile, Strongpoint, Underattack

class CfgRadio {

	sounds[] = {};
	class Town {
		name = "Town";
		sound[] = {"Sounds\Town.ogg", db-100, 1.0};
		title = "";
	};
		
	class Captured {
		name = "Captured";
		sound[] = {"Sounds\Captured.ogg", db-100, 1.0};
		title = "";
	};
	
	class lost {
		name = "lost";
		sound[] = {"Sounds\lost.ogg", db-100, 1.0};
		title = "";
	};
	
	class Hostile {
		name = "Hostile";
		sound[] = {"Sounds\hostilesdetectednear.ogg", db-100, 1.0};
		title = "";
	};
	
	class Strongpoint {
		name = "StrongPoint";
		sound[] = {"Sounds\strongpoint.ogg", db-100, 1.0};
		title = "";
	};
	
	class Underattack {
		name = "Underattack";
		sound[] = {"Sounds\underattack.ogg", db-100, 1.0};
		title = "";
	};
	
	class NewIntel {
		name = "NewIntel";
		sound[] = {"Sounds\newintelavailable.ogg", db-100, 1.0};
		title = "";
	};
};

class CfgSounds {
	sounds[] = {};
	class HintComplete {
		name = "HintComplete";
		sound[] = {"a3\sounds_f\sfx\hint-1.wss", 1, 1.0};
		titles[] = {};
	};
};