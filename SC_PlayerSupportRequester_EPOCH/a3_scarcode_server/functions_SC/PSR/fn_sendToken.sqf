/*
	Author: IT07

	Description:
	sends generated token to given client

	Params:
	_this select 0: OBJECT - player to send it to

	Returns:
	BOOLEAN - true if everything went ok
*/

_c = _this select 0; // Client
_c setVariable [str(owner _c), call SC_fnc_genToken, false];
SC_myToken = _c getVariable str(owner _c);
(owner _c) publicVariableClient 'SC_myToken';
_d = true; // Done
_d