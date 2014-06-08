//// RSC 
//// All Titles 
//// DeraKOren
///////////////

class RscTitles {
	titles[] = {ProgressBar_Dialog, EconomicBar_Dialog, Camera_view, Debug_Titles, MessageDisplay, Loading_Titles,
				MSG_Complete, MSG_KillPay, MSG_Pay, MSG_Upgrade};
	
/*
	- Don't Forget add Titles name to "titles[] = {... , ... , ...}"
	- Don't Forget add "idd" to comment
	- Don't Forget add "layer" to comment
*/	
	//// Progress Bar for Camps and Towns	idd: 68791001	layer: 6879
	#include "Titles\ProgressBar.hpp"
	
	//// Economy Bar						idd: 68791002	layer: 6880
	#include "Titles\EconomyBar.hpp"
		
	//// Construction Camera Inteface		idd: 68791005	layer: 6881
	#include "Titles\Construction.hpp"

	//// Construction MSG					idd: 68791006	layer: 6882
	#include "Titles\ConsMSG.hpp"
	
	//// Debug MSG							idd: 68791007	layer: 6883
	#include "Titles\Debug.hpp"

	//// Debug MSG							idd: 68791008	layer: 6884
	#include "Titles\Loading.hpp"
	
	//// Compele Message					idd: 68791009	layer: 6885
	#include "Titles\MSG_Complete.hpp"
	
	//// Simple Message						idd: 68791010	layer: 6886
	//#include "Titles\MSG_Simple.hpp"
	
	//// Payment Message					idd: 68791011	layer: 6887
	#include "Titles\MSG_Pay.hpp"
	
	//// Upgrade Message					idd: 68791012	layer: 6888
	#include "Titles\MSG_Upgrade.hpp"
	
	//// Vehicle Crew Message				idd: 68791013	layer: 6889
	//#include "Titles\MSG_VhclCrew.hpp"
	
	//// Kill Payment Message				idd: 68791014	layer: 6890
	#include "Titles\MSG_KillPay.hpp"
	
};