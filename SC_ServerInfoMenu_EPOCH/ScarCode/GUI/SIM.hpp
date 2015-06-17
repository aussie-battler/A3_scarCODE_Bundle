#include "Configs\cfg_SIM.hpp"

class SC_simDiag
{
	idd = 297;
	onLoad = "[] spawn SC_fnc_loadSim";
	movingEnable = 1;
	class controls
	{
		#include "Resources\Rsc_SIM.hpp"
	};
};