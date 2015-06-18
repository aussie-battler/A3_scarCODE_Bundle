/*
	Author: IT07

	Description:
	keeps refreshing units online indicator whilst psr is open

	Params:
	none

	Returns:
	nothing
*/

disableSerialization;
_dsp = 298;
while {true} do
{
	waitUntil { uiSleep 0.5; not(isNil"SC_myToken"); };
	if not(isNull(findDisplay _dsp)) then
	{
		_statTxt = (findDisplay _dsp) displayCtrl 1001;
		_statColor = (findDisplay _dsp) displayCtrl 2202;
		uiSleep (floor random 1); // Pretend the loading time is different everytime lol
		switch((count SC_psrUnitsOnline) > 0) do
		{
			case true:
			{
				_statTxt ctrlSetText format ["SUPPORT UNITS: %1", count SC_psrUnitsOnline];
			 	((findDisplay _dsp) displayCtrl 2202) ctrlSetBackgroundColor [0.247,0.875,0.439,1];
			};
			case false:
			{
				_statTxt ctrlSetText "SUPPORT IS OFFLINE";
				_statColor ctrlSetBackgroundColor [0.875,0.306,0.247,1];
			};
		};
	};
	uiSleep 0.35;
};