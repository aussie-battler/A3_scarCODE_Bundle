/*
	Author: IT07

	Description:
	loads content into SAR menu
*/

if (isNull(findDisplay 46)) exitWith { systemChat"[scarCODE DEBUG] You can not call this function. NANANANANAA"; };
private ["_dspn","_mag"];
disableSerialization;
_lbUnMerged = (findDisplay 291) displayCtrl 2100;
_rscPic = (findDisplay 291) displayCtrl 1200;
_inLb = [];
{
	_cn = _x select 0;
	_max = getNumber (configFile >> "cfgMagazines" >> _cn >> "count");
	call
	{
		if (_cn in _inLb) exitWith
		{
			//systemChat format["%1 is already present", _cn];
		};
		if not((_x select 1) isEqualTo _max) then
		{
			_dspn = getText (configFile >> "cfgMagazines" >> _cn >> "displayname");
			_mag = _lbUnMerged lbAdd _dspn;
			_lbUnMerged lbSetData [_mag, _cn];
			_inLb pushBack _cn;
		};
	};
} forEach (magazinesAmmoFull player); // magazinesAmmoFull does not mean only full mags...