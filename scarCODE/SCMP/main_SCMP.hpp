#include "config_SCMP.hpp"

////////////////////////////////////////////////
class SC_smpDiag
{
	idd = 277;
	onLoad = "[_this] spawn SC_fnc_loadSmp";
	movingEnable = true;
	class controls
	{
		#include "rsc_SCMP.hpp"
	};
};