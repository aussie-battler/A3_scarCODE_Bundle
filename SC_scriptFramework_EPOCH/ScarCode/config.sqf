/*
	Author: IT07

	Description:
	this file is used to enable/disable ScarCode scripts. Please do not forget to install the required file for each enabled script ;)
*/

/////// SCARCODE SCRIPTS CONTROL PANEL ///////
// Use false to DISABLE | Use true to ENABLE //
_PSR = true; // Player support Requester
_SIM = true; // Server Info Menu
// NOTE: if _PSR and _SIM are set true, ScarCode Menu Package needs to be installed too
_STM = true; // Spawn Teleport Menu
_PvE = true; // PvE script
	/// Sub config for PvE script | ignore if you set _PvE to false ///
	_PvPZone = true; // Requires a trigger on the map with name PvP_Zone
	_debug = false; // If true, will display data in hintSilent
	_PvEbyDefault = true; // Sets default mode to PvE if true
_SIC = true; // Server Intro Credits
_SRW = true; // Server restart Warnings

/////// CONFIG FILE LOCATIONS FOR SCARCODE MENUS ///////
// All config files for each ScarCode menu can be found in:
// ScarCode\GUI\Configs\
// Each config file will have its shortname at the end of the file name
// Example: config file for S.I.M. is called cfg_SIM.hpp
////////////////////////////////////////////////////////