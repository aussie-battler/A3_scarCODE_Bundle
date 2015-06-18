/*
	Author: IT07

	Description:
	sends user-given data from menu to server

	Params:
	none

	Returns:
	nothing
*/

_d = 298; // Display idd
if (isNil"SC_psrUnitsOnline" or isNil"SC_myToken") exitWith { closeDialog _d; ["PSR_noToken"] call BIS_fnc_showNotification; };
_cm = (findDisplay _d) displayCtrl 1400;
if((count SC_psrUnitsOnline) > 0) then
{
	disableUserInput true;
	_ty = (findDisplay _d) displayCtrl 2100;
	SC_psrTalkToServer = ["REQUEST",[_ty lbText(lbCursel _ty),ctrlText _cm,player,getPlayerUID player,SC_myToken]];
	publicVariableServer "SC_psrTalkToServer";
	closeDialog _d;
	disableUserInput false;
};
