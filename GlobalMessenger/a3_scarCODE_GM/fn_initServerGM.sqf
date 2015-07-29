/*
    Author: IT07

    Description:
    server's init for GlobalMessenger
*/

_version = ([["cfgPatches","a3_scarCODE_GM"],["version"]] call SC_fnc_gmGetSetting) select 0;
diag_log "///////";
diag_log format["[scarCODE] GlobalMessenger %1 framework LOADING IN...", _version];
diag_log "///////";
uiNamespace setVariable ["SC_gmKeys", []];
uiNamespace setVariable ["SC_gmKeysGivenTo", []];

[] spawn
{
    _uids = ([["GMconfig"],["adminUIDs"]] call SC_fnc_gmGetSetting) select 0;
    while {true} do
    {
        {
            if (isPlayer _x AND (getPlayerUID _x) in _uids AND not(_x in (uiNamespace getVariable "SC_gmKeysGivenTo"))) then
            {
                _givenTo = uiNamespace getVariable "SC_gmKeysGivenTo";
                _givenTo pushBack _x;
                uiNamespace setVariable ["SC_gmKeysGivenTo", _givenTo];
                SC_gmKey = call SC_fnc_gmGenKey;
                (owner _x) publicVariableClient "SC_gmKey";
                _keys = uiNamespace getVariable "SC_gmKeys";
                _keys pushBack [_x, getPlayerUID _x, SC_gmKey];
                uiNamespace setVariable ["SC_gmKeys", _keys];
                diag_log format["[scarCODE] GlobalMessenger: KEY GIVEN TO %1 (%2|%3)", name _x, _x, getPlayerUID _x];
            };
        } forEach playableUnits;
        uiSleep 2;
    };
};

"SC_gmMessage" addPublicVariableEventHandler
{
    _data = _this select 1;
    _msg = [_data, 0, [], [[]]] call BIS_fnc_param;
    _header = [_msg, 0, "", [""]] call BIS_fnc_param;
    _sub = [_msg, 1, "", [""]] call BIS_fnc_param;
    _moving = [_msg, 2, "", [""]] call BIS_fnc_param;
    if (_header isEqualTo "" OR _sub isEqualTo "" OR _moving isEqualTo "") exitWith
    {
        diag_log format["[scarCODE] GlobalMessenger ERROR: SC_gmMessage received empty STRING(s)", _msg];
    };
    _auth = [_data, 1, [], [[]]] call BIS_fnc_param;
    _valid = _auth call SC_fnc_gmAuthCheck;
    if not _valid exitWith { diag_log format["[scarCODE] GlobalMessenger ERROR: SC_gmMessage received invalid _auth", _auth]; };
    // We have a valid key
    SC_gmNews = [_header, _sub, _moving];
    {
        (owner _x) publicVariableClient "SC_gmNews";
    } forEach playableUnits;
};
