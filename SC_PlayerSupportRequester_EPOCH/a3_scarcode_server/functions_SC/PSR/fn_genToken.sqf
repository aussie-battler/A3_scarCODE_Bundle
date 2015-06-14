/*
	Author: IT07

	Description:
	generates authorization token

	Params:
	none

	Returns:
	TOKEN
*/

_chars = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
_charsCap = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
_token = str(floor random 9999);
for '_tokehplox' from 0 to (9 + floor random 3) do { _token = _token + (_chars select(floor random count _chars)) + (_charsCap select(floor random count _chars)) + str(floor random 99); };
_token