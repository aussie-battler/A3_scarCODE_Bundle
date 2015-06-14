/*
	Author: IT07

	Description:
	This grabs the config.sqf and starts launching stuff depending on what is enabled
*/

#include "config.sqf";

if (_PSR and _SIM) then
{
	[] ExecVM "ScarCode\Scripts\SCMP.sqf";
};

if (_PSR and not _SIM) then
{
	[] ExecVM "ScarCode\Scripts\PSR.sqf";
};

if (_SIM and not _PSR) then
{
	[] ExecVM "ScarCode\Scripts\SIM.sqf";
};

if (_STM) then
{
	[] ExecVM "ScarCode\Scripts\STM.sqf";
};

if (_PvE) then
{
	[_PvPZone, _debug, _PvEbyDefault] ExecVM "ScarCode\Scripts\antiPvP.sqf";
};

if (_SIC) then
{
	[] ExecVM "ScarCode\Scripts\introCredits.sqf";
};

if (_SRW) then
{
	[] ExecVM "ScarCode\Scripts\sRestartWarnings.sqf";
};