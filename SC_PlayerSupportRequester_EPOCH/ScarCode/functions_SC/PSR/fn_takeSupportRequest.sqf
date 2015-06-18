/*
	Author: IT07

	Description:
	called when doubleClicked on request. Sends data from selected item to server

	Params:
	none

	Returns:
	nothing
*/

disableSerialization;
_d = 298; // Display idd
_c = (findDisplay _d) displayCtrl 1500; // Control 1500
if (not(isNull(findDisplay _d)) and not(isNil"SC_tasks") and (_this select 0) isEqualTo _c) then
{
	SC_psrTalkToServer = ["SEL",[_c lbValue (_this select 1),_this select 1,name player, player, getPlayerUID player, SC_myToken]];
	publicVariableServer "SC_psrTalkToServer";
};
