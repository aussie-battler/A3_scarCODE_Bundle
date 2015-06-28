/*
	Author: IT07

	Description:
	loads content into SAR menu
*/

_dsp = 291;
if (isNull(findDisplay _dsp)) exitWith { systemChat"[scarCODE DEBUG] You can not call this function. NANANANANAA"; };
private ["_dspn","_mag","_abort"];
disableSerialization;
_lbUnMerged = (findDisplay _dsp) displayCtrl 2100;
_rscPic = (findDisplay _dsp) displayCtrl 1200;
_output = (findDisplay _dsp) displayCtrl 1001;
_mergeButton = (findDisplay _dsp) displayCtrl 1600;
_magTypes = [];
{
	_cn = _x select 0;
	if (currentMagazine player isEqualTo _cn) exitWith
	{
		_abort = true;
	};
	_max = getNumber (configFile >> "cfgMagazines" >> _cn >> "count");
	call
	{
		if (not((_x select 1) isEqualTo _max) AND not(_cn in _magTypes)) then
		{
			_dspn = getText (configFile >> "cfgMagazines" >> _cn >> "displayname");
			_mag = _lbUnMerged lbAdd _dspn;
			_lbUnMerged lbSetData [_mag, _cn];
			_magTypes pushBack _cn;
		};
	};
	uiSleep 0.05;
} forEach (magazinesAmmoFull player); // magazinesAmmoFull does not mean only full mags...
if not(isNil"_abort") exitWith
{
	uiSleep 1;
	_output ctrlSetText "ABORTED! MAGAZINE FOUND IN WEAPON";
	_mergeButton ctrlSetTextColor [1,1,1,0.3];
};
if ((COUNT _magTypes) isEqualTo 0) exitWith
{
	_output ctrlSetText "NO USED MAGAZINES FOUND...";
	_mergeButton ctrlSetTextColor [1,1,1,0.3];
};
_output ctrlSetText "DONE! SELECT MAG TYPE";