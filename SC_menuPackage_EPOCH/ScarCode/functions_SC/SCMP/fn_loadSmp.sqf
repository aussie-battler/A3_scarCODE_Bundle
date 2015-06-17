/*
	Author: IT07

	Description:
	this function will be called when wMenu opens. Fills the content

	Params:
	none

	Returns:
	nothing
*/

if not(isNull(findDisplay 277)) then
{
	setMousePosition [0.5, 0.5];
	disableSerialization;
	_gim = ["installedMenus"] call SC_fnc_getSmpSetting; // GetInstalledMenus
	_im = _gim select 0; // InstalledMenus = GetInstalledMenus select result
	_cb = (findDisplay 277) displayCtrl 2100; // ComboBox

	// Fill the RscCombo
	{
		_d = false; // Define _d will make _d change to whatever given to it in switch
		_t = false; // Same as above
		switch (_x) do
		{
			case "SIM":
			{
				_d = "SC_simDiag";
				_t = "Server Info Menu (S.I.M.)";
			};
			case "PSR":
			{
				_d = "SC_psrDiag";
				_t = "Player Support Requester (P.S.R.)";
			};
			default { };
		};

		_id = _cb lbAdd _t; // index = comboBox lbAdd text
		_cb lbSetData [_id, _d]; // comboBox lbSetData [index, className]
		if (count _im isEqualTo 1) exitWith // if 1 menu installed, open it
		{
			_cb lbSetCurSel 0;
		};
	} forEach _im;
};