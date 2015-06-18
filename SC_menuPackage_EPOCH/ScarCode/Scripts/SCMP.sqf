/*
	Author: IT07

	Description:
	init file for ScarCode Menu Package script
*/

/////// Init PVBs for PSR
"SC_tasks" addPublicVariableEventHandler
{
	if not(isNull(findDisplay 298)) then
	{
		call SC_fnc_reLoadPsr;
	};
};

"SC_psrReply" addPublicVariableEventHandler
{
	[_this select 1] spawn SC_fnc_handlePsrReply;
};

[] spawn SC_fnc_livePsrUnitsOnline;
///////////////////////////////////////////////////

/////// Spawn live stats for SIM
[] spawn SC_fnc_setLiveSimData; // Live uptime and players

_gs = ["useScrollMenu","customControl"] call SC_fnc_getSmpSetting; // GetSettings
_es = _gs select 0; // EnableScroll
_ecc = _gs select 1; // EnableCustomControl

waitUntil { !isNull(findDisplay 46); !isNil"EPOCH_loadingScreenDone" };
uiSleep 3;

if ((typeName _es) isEqualTo "SCALAR") then
{
	_aa = player addAction ["<t color='#57877b'>Player SMP</t>",{createDialog'SC_smpDiag';}, "", -1, false, true];
};

if ((typeName _ecc) isEqualTo "STRING" and not(_ecc isEqualTo "")) then
{
	[_ecc] spawn // Antihax do not like EHs....
	{
		_ecc = _this select 0;
		while {true} do
		{
			waitUntil { inputAction _ecc > 0 };
			createDialog'SC_smpDiag';
			waitUntil { isNull(findDisplay 277) };
		};
	};
};