# ArmA 3 ScarCode Scripts Bundle by IT07
## (WIP!) Do not download or read yet...
<br />
Hi and thanks for checking out this repository.<br />
It is important to note that all of the script below are designed for ArmA 3 Epoch mod.<br />
Small structural changes need to be applied to get them working for a different mod however that is not the purpose of these scripts.<br />
*NOTE: These scripts are all designed and written by IT07. Publishing permissions apply.*

#### Contents of this repository
- ArmA 3 Anti-PvP <br />
- ScarCode Menu Package (S.C.M.P.) <br />
- Player Support Requester menu (P.S.R.) <br />
- Server Restart Warnings <br />
- ScarCode script framework <br />
- Server Info Menu (S.I.M.) <br />
- Server Intro Credits <br />
- Spawn Teleport Menu (S.T.M.)<br />

#### Global installation notes
**Only follow the global insallation notes if you have not done it before**
*1)* click the **download as zip** button on the right.<br />
*2)* put the contents of the folder called *SC_scriptFramework_EPOCH* inside the root of your mission file.<br />
*3)* open your own init.sqf and find the line that has this in it: `hasInterface`. If found, skip next step. <br />
*4)* if you could not find a line that `hasInterface` in it, simply copy the contents of init.sqf located in the root of this repository into your own init.sqf. Make sure you paste it outside of any other brackets. Now skip next step.<br />
*5)* if you found a line in your init.sqf that `hasInterface` in it, then simply copy over line 3 from the init.sqf located inside the root of this repository into your own init.sqf. Be sure to actually place it inside of that hasInterface check you found though ;) <br />
*6)* now open config.sqf that is inside the ScarCode folder of your mission file and start reading :)<br />
*7)* last step: read the seperate install instructions for each script you have enabled in config.sqf

#### Description.ext edit notes
- if you are going to install any script from the list above, you will need to add the following (ONCE!) (outside of any other brackets) to your description.ext: <br />
`class cfgFunctions {` <br />
`class ScarCode /* ScarCode functions */ {`<br />
`tag = "SC";` <br />
`}; };` <br />
If you already have a `cfgFunctions` in your description.ext, you will only need to copy the `class ScarCode` section UNTIL(!) the last `};`<br />
Also, if you are planning on installing any ScarCode menu, you will need to put this line (outside of any brackets) in your description.ext: `#include "ScarCode\GUI\Defines\global.hpp"`. Only do that once though or it will break your server. Sort of.<br />

#### Seperate installation notes
**How to install/configure anti-PvP script**<br />
1) Copy contents of SC_antiPvP_EPOCH to the root of your mission file.<br />
2) 



**How to install/configure P.S.R.**<br />
1) navigate to the folder from this repository called `SC_PlayerSupportRequester_EPOCH`<br />
2) inside that folder is a folder called `ScarCode`. Copy and paste that into the root of your mission file. Merge if folder already exists.<br />
3) there should also be a folder called `a3_scarcode_server`. Copy that into your server's `@epochhive\addons` folder and pack it as a PBO unless you want to install the anti-PvP script later. <br />
4) copy and paste initServer.sqf from the root of this repository into the root of your mission file. It is a file that will automatically be executed when your server reads the mission file. Merge the contents if you already have that file. <br />
5) open your description.ext from the root of your mission file and put this line anywhere outside of any brackets: `#include "ScarCode\GUI\PSR.hpp"`. Example of that is in the description.ext (example) which can be found in the root of this repository.<br />
6) find `class ScarCode` in your description.ext (should be inside the `class cfgFunctions` like shown in description.ext (example) which can be found inside the root of this repository too).<br />
7) configure the P.S.R. by adding UIDs of people you want to be support units to the `_units` array located in `a3_scarcode_server\PSR\initServer_PSR.sqf`. To configure the types of support available and their prices, check `ScarCode\GUI\Configs\cfg_PSR.hpp`<br />
<br />

**How to install/configure S

