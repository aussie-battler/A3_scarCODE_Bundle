/////// install README.txt for P.S.R. (Player Suppport Requester) ///////

// INSTALL INSTRUCTIONS //
1) copy the scarCODE folder into the root of your mission file
2) copy the a3_scarCODE_PSR folder into your server's @epochhive\addons\ folder.
3) unless you already have a "class cfgFunctions" in your description.ext, add the contents of "cfgFunctions.hpp" to your description.ext.
4) if there is already a cfgFunctions in your description.ext? Good luck: https://community.bistudio.com/wiki/Functions_Library_%28Arma_3%29#Tag
5) add this (outside of anything) to your description.ext: #include "scarCODE\PSR\main_PSR.hpp"
6) make sure the read the README.md from gitHub too.

// CONFIGURATION INSTRUCTIONS //
- To grant someone access to the PSR menu as a Support Unit, check "a3_scarCODE_PSR\putUIDsInHere.sqf"
- To configure the available support types and their prices, check "scarCODE\PSR\config_PSR.hpp"