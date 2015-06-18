/*
	Author: IT07

	Description:
	handles the publicVariableEventHandler SC_psrReply

	Params:
	_this select 0: ARRAY - data sent through SC_psrReply

	Returns:
	nothing
*/

_data = _this select 0;
switch (_data select 0) do
{
	case "NEW":
	{
		_id = _data select 1;
		["PSR_newRequest",[format["New request! #%1", _id]]] call BIS_fnc_showNotification;
	};

	case "ANSWERED":
	{
		_unitAnswered = _data select 1;
		["PSR_requestAnswered",[format["%1 answered your request", _unitAnswered]]] call BIS_fnc_showNotification;
	};

	case "PICKED":
	{
		_assignedTo = _data select 1;
		_id = _data select 2;
		["PSR_requestPicked",[format["%1 accepted #%2", _assignedTo, _id]]] call BIS_fnc_showNotification;

		if (isNull(findDisplay 298)) then
		{
			_control = (findDisplay 298) displayCtrl 1500;
			if (typeName _control isEqualTo "DISPLAY") then
			{
				_control lbDelete (_this select 1 select 2);
			};
		};
	};

	case "SENT":
	{
		["PSR_requestSent"] call BIS_fnc_showNotification;
	};

	case "LIMIT":
	{
		["PSR_maxReached",[format["Request failed! Max global requests limit of %1 reached...", _data select 1]]] call BIS_fnc_showNotification;
	};

	case "OFFLINE":
	{
		["PSR_offLine"] call BIS_fnc_showNotification;
	};

	case "TIMEOUT":
	{
		["PSR_timeOut"] call BIS_fnc_showNotification;
	};

	case "PLAYERNOFUNDS":
	{
		_cost = _data select 1;
		_saldo = _data select 2;
		["PSR_noFunds",[format["Insufficient funds! Costs %1, you have %2", _cost, _saldo]]] call BIS_fnc_showNotification;
	};

	case "FUNDSFAIL":
	{
		_requester = _data select 1;
		["PSR_noFunds",[format["%1 has insufficient funds...", name(_requester)]]] call BIS_fnc_showNotification;
	};

	case "PAID":
	{
		systemChat format ["[P.S.R.] You paid %1 Crypto for %2", _data select 1, _data select 2];
	};

	case "COMPLETED":
	{
		_unitCompleted = _data select 1;
		_id = _data select 2;
		["PSR_completed",[format["%1 completed request #%2", name(_unitCompleted), _id]]] call BIS_fnc_showNotification;
	};

	default { };
};