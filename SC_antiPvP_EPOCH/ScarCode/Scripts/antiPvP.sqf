if (hasInterface) then
{
	_PvPZone = _this select 0;
	_debug = _this select 1;
	_PvEbyDefault = _this select 2;

	if (_PvEbyDefault) then
	{
		SC_PvE = true;
	} else { SC_PvE = false; };

	if (_PvPZone) then
	{
		_pvpZoneLoop = [_debug] spawn
		{
			_debug = _this select 0;
			while { true } do
			{
				switch (triggerActivated PvP_Zone) do
				{
					case true:
					{
						if (SC_PvE) then
						{
							SC_PvE = false;
						};
					};
					case false:
					{
						if (not SC_PvE) then
						{
							SC_PvE = true;
						};
					};
					default
					{
						systemChat format["ERROR: PvP/PvE check FAILED with ID %1", floor random 9999];
					};
				};
				if (_debug) then
				{
					hintSilent parseText format["<t size='2'>DEBUG</t><br /><br />isPlayer? %1<br />in PvP zone? %2<br />PvE mode? %3<br />cursorTarget in PvP zone? %4<br />PvP zone active? %5<br />", isPlayer cursorTarget, player in (list PvP_Zone), SC_PvE, cursorTarget in (list PvP_Zone), triggerActivated PvP_Zone];
				};
			uiSleep 0.1;
			};
		};
	};

	"SC_PVBkillMessage" addPublicVariableEventHandler
	{
		if(isPlayer(_this select 1 select 0) and isPlayer(_this select 1 select 0)) then
		{
			systemChat format ["ALERT! %1 was murdered in PvE zone by %2", name (_this select 1 select 0), name (_this select 1 select 1)];
		};
	};

	waitUntil { !isNull(findDisplay 46); !isNil"EPOCH_loadingScreenDone" };
	uiSleep 2;
	_PvEplayerEH = player addEventHandler ["Fired", "if(SC_PvE)then{if (isPlayer cursorTarget)then {deleteVehicle(_this select 6)};}"];
	systemChat format ["#%1 | {ScarCode} Anti-PvP framework loaded...", _PvEplayerEH];

	waitUntil { uiSleep 0.5; (vehicle player != player); };
	_PvEvehicleEH = vehicle player addEventHandler ["Fired", "if(SC_PvE)then{if (isPlayer cursorTarget)then {deleteVehicle(_this select 6)};}"];
	systemChat format ["#%1 | {ScarCode} Anti-PvP vehicle mode loaded...", _PvEvehicleEH];
};