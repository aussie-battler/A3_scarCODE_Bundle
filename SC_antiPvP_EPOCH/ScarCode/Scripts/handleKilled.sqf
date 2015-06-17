/*
	Author: IT07

	Description:
	will be Executed when player dies and check if death was caused by player inside pve zone
*/

if (SC_PvE and (_this select 0) != (_this select 1) and isPlayer(_this select 1)) then
{
	_this call SC_fnc_handleKilled;
};