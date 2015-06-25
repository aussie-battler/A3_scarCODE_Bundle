#include "config_SIM.hpp"

class SC_simDiag
{
	idd = 297;
	onLoad = "[] spawn SC_fnc_loadSim";
	movingEnable = 1;
	class controls
	{
		#include "rsc_SIM.hpp"
	};
};