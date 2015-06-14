/*
	Author: IT07

	Description:
	serverside scripting for the support menu

	Params:
	none

	Returns: nothing
*/

///////  CONFIGURE SUPPORT PLAYERS HERE  ///////
_units = ["76561198070997442","76561198008656666","76561197972746988"]; // Put UIDs here
////////////////////////////////////////////////

///////  END OF CONFIG  //////
SC_fnc_genToken = compileFinal preprocessFileLineNumbers "\a3_scarcode_server\functions_SC\PSR\fn_genToken.sqf";
SC_fnc_sendToken = compileFinal preprocessFileLineNumbers "\a3_scarcode_server\functions_SC\PSR\fn_sendToken.sqf";
SC_psrUnitsOnline = [];
publicVariable "SC_psrUnitsOnline";
SC_requestAmount = 0;
SC_tasks = [];
SC_hasToken = [];

"SC_psrTalkToServer" addPublicVariableEventHandler
{
	_types = ["supportTypes"] call SC_fnc_getPsrSetting;
	switch (_this select 1 select 0) do
	{
		case "TOKEN":
		{
			_client = _this select 1 select 1;
			_uid = _this select 1 select 2;
			if (not((_client) in SC_hasToken) and (_client) in playableUnits and _uid isEqualTo getPlayerUID _client) then
			{
				_sent = [_client] call SC_fnc_sendToken;
			};
		};
		case "REQUEST":
		{
			_data = _this select 1 select 1;
			_requestType = _data select 0;
			_comment = _data select 1;
			_player = _data select 2;
			_playerUID = _data select 3;
			_token = _data select 4;
			_cancel = false;

			if (_requestType in (_types select 0) and (typeName _comment) isEqualTo "STRING" and (count SC_psrUnitsOnline) > 0 and (_player in playableUnits) and (getPlayerUID _player) isEqualTo _playerUID and _token isEqualTo (_player getVariable str(owner _player))) then
			{
				if not((count SC_psrUnitsOnline) isEqualTo 0) then
				{
					_maxRequests = ["maxRequests"] call SC_fnc_getPsrSetting;
					switch (SC_requestAmount > (_maxRequests select 0)) do
					{
						case false:
						{
							// Check cost and funds
							_prices = ["prices"] call SC_fnc_getPsrSetting;
							_getIndex = (_types select 0) find _requestType;
							_cost = (_prices select 0) select _getIndex;
							_cIndex = EPOCH_customVars find 'Crypto';
							_vars = _player getVariable['VARS',[]+EPOCH_defaultVars_SEPXVar];
							_curcrypt = _vars select _cIndex;
							if (_curcrypt < _cost) exitWith
							{
								SC_psrReply = ["PLAYERNOFUNDS", _cost, _curcrypt];
								(owner _player) publicVariableClient "SC_psrReply";
								_cancel = true;
							};
							if (_cancel) exitWith { };
							SC_requestAmount = SC_requestAmount + 1;
							_task = [name _player, mapGridPosition _player, _requestType, _comment, _player, (count SC_tasks)+1,false];
							SC_tasks pushBack _task;
							_taskID = _task select 5;
							{

								SC_psrReply = ["NEW", _taskID];
								(owner _x) publicVariableClient "SC_psrReply";
								(owner _x) publicVariableClient "SC_tasks";
							} forEach SC_psrUnitsOnline;

							SC_psrReply = ["SENT",SC_requestAmount];
							(owner _player) publicVariableClient "SC_psrReply";
						};
						case true:
						{
							SC_psrReply = ["LIMIT",SC_requestAmount];
							(owner _player) publicVariableClient "SC_psrReply";
						};
						default { };
					};
				} else
					{
						SC_psrReply = ["OFFLINE"]; (owner _player) publicVariableClient "SC_psrReply";
					};
			};
		};

		case "SEL":
		{
			_data = _this select 1 select 1;
			_value = _data select 0;
			_unit = _data select 3;
			_playerUID = _data select 4;
			_token = _data select 5;
			_cancel = false;
			if ((typeName _value) isEqualTo "SCALAR" and _unit in SC_psrUnitsOnline and _playerUID isEqualTo (getPlayerUID _unit) and _token isEqualTo (_unit getVariable str(owner _unit))) then
			{
				_theTask = SC_tasks select _value;
				_requester = _theTask select 4;
				_isAssignedTo = _theTask select 6;
				switch (true) do
				{
					case ((typeName _isAssignedTo) isEqualTo "BOOL"):
					{
						if not(_isAssignedTo) then
						{
							// Check cost
							_requestType = _theTask select 2;
							_prices = ["prices"] call SC_fnc_getPsrSetting;
							_getIndex = (_types select 0) find _requestType;
							_cost = (_prices select 0) select _getIndex;
							_cIndex = EPOCH_customVars find 'Crypto';
							_vars = _requester getVariable['VARS',[]+EPOCH_defaultVars_SEPXVar];
							_curcrypt = _vars select _cIndex;
							if (_curcrypt < _cost) exitWith
							{
								SC_psrReply = ["FUNDSFAIL", _requester];
								(owner _unit) publicVariableClient "SC_psrReply";
								_cancel = true;
							};
							_newcrypt = _curcrypt - _cost;
							[['effectCrypto',_newcrypt],(owner _requester)] call EPOCH_sendPublicVariableClient;
							_vars set[_cIndex,_newcrypt];
							_requester setVariable["VARS",_vars];
							SC_psrReply = ["PAID", _cost, _requestType];
							(owner _requester) publicVariableClient "SC_psrReply";
							diag_log str[_requestType, _prices, _getIndex, _cost, _cIndex, _vars, _curcrypt, _newcrypt, _requester];
							if (_cancel) exitWith { };
							// Update the task
							_isAssignedTo = _theTask find _isAssignedTo;
							_theTask set [_isAssignedTo, _unit];
							{
								(owner _x) publicVariableClient "SC_tasks";
								SC_psrReply = ["PICKED", name _unit, (_value + 1)];
								(owner _x) publicVariableClient "SC_psrReply";
							} forEach SC_psrUnitsOnline;
							SC_psrReply = ["ANSWERED", name _unit];
							(owner (_requester)) publicVariableClient "SC_psrReply";
						};
					};

					case ((typeName _isAssignedTo) isEqualTo "OBJECT"):
					{
						if (isPlayer _isAssignedTo) then
						{
							_removed = SC_tasks deleteAt _value;
							{
								(owner _x) publicVariableClient "SC_tasks";
								SC_psrReply = ["COMPLETED", _isAssignedTo, _value];
								(owner _x) publicVariableClient "SC_psrReply";
							} forEach SC_psrUnitsOnline;
						};
					};
					default { diag_log "{ScarCode} SEL FAILED: _isAssignedTo switch hit default!";};
				};
			} else { diag_log format ["{ScarCode} SC_psrTalkToServer SEL VALIDATION FAILED with _data: %1", _data]; };
		};
		default { };
	};
};

_onlineUnits = [_units] spawn
{
	_units = _this select 0;
	while {true} do
	{
		{
			if ((getPlayerUID _x) in _units and not(_x in SC_psrUnitsOnline)) then
			{
				SC_psrUnitsOnline pushBack _x;
				publicVariable"SC_psrUnitsOnline";
			};
		} forEach playableUnits; // Checks for logged in units and sets tokens
		{
			if not(_x in playableUnits) then
			{
				_index = SC_psrUnitsOnline find _x;
				SC_psrUnitsOnline deleteAt _index;
				publicVariable"SC_psrUnitsOnline";
			};
		} forEach SC_psrUnitsOnline; // Checks for disconnected units
		uiSleep 5; // Do it every 5 seconds
	};
};