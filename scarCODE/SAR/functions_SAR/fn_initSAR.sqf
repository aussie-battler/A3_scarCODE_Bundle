/*
	Author: IT07

	Description:
	initializes the SAR script

	Params:
	none that I know of lol

	Returns:
	why the **** would an init file return something? You moron :P
*/

[] spawn // Why? Because of { postInit = 1; };
{
	waitUntil { uiSleep 1; !isNull(findDisplay 46); !isNil"EPOCH_loadingScreenDone" };
	uiSleep 5;
	_aa = player addAction ["<img size='1.5' image='\a3\ui_f\data\IGUI\Cfg\Actions\reload_ca.paa' /> Ammo repack",{createDialog'SC_sarDiag';}, "", -1, false, true];
};