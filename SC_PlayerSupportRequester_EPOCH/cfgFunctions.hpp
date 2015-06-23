class cfgFunctions
{
	class scarCODE
	{
		tag = "SC";
		class PlayerSupportRequester
		{
			file = "scarCODE\PSR\functions_PSR";
			class getPsrCost { };
			class getPsrData { };
			class getPsrSetting { };
			class handlePsrTask { };
			class loadPsr { };
			class reLoadPsr { };
			class sendPsrRequest { };
			class showPsrLive { };
			class initPSR { postInit = 1; };
			class initPSR_SA { postInit = 1; }; // Remove this line if using SCMP
		};
	};
};