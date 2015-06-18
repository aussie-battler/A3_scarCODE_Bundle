/*
	Author: IT07
	Description: is Spawned by onLoad for 298
*/
_dsp = 298;
if (not isNull(findDisplay _dsp)) then
{
	setMousePosition [0.5, 0.5];
	disableSerialization;
	if (isNil"SC_myToken") then
	{
		SC_psrTalkToServer = ["TOKEN", player, getPlayerUID player];
		publicVariableServer "SC_psrTalkToServer";
	};

	// Fill location
	_blnc = (findDisplay _dsp) displayCtrl 1006; // Crypto balance
	_blnc ctrlSetText str(EPOCH_playerCrypto);

	// Fill Support types
	_t = ["supportTypes"] call SC_fnc_getPsrSetting;
	_c = (findDisplay _dsp) displayCtrl 2100;
	lnbClear _c;
	{
		_c lbAdd _x;
	} forEach (_t select 0);
	_c lbSetCurSel 0;

	// Fil current requests if there
	if not(isNil"SC_tasks") then
	{
		if ((count SC_tasks) > 0) then
		{
			call SC_fnc_reLoadPsr;
		};
	};
};