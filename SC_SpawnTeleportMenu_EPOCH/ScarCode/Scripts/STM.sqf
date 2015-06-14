/*
	Author: IT07

	Description:
	init file for Spawn Teleport Menu
*/

waitUntil { !isNull(findDisplay 46); !isNil"EPOCH_loadingScreenDone" };
if !(player nearObjects["Debug_static_F", 20] isEqualTo[]) exitWith
{
	createDialog'SC_stmDiag';
	setMousePosition [0.5, 0.5];
	uiSleep 3;
	_aa = player addAction ["Spawn Teleport Menu",{createDialog'SC_stmDiag';}, "", -1, false, true];
	waitUntil { uiSleep 0.2; (player nearObjects["Debug_static_F", 25] isEqualTo[]) };
	player removeAction _aa;
};