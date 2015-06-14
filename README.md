# ArmA 3 ScarCode Scripts Bundle by IT07
## (WIP!) Do not download or read yet...
<br />
Hi and thanks for checking out this repository.<br />
It is important to note that all of the script below are designed for ArmA 3 Epoch mod.<br />
Small structural changes need to be applied to get them working for a different mod however that is not the purpose of these scripts.<br />
*NOTE: These scripts are all designed and written by IT07. Publishing permissions apply.*

##### Contents of this repository
1) Player Support Requester menu (P.S.R.) <br />
2) ScarCode Menu Package (S.C.M.P.) <br />
3) Server Info Menu (S.I.M.) <br />
4) Spawn Teleport Menu (S.T.M.)<br />
5) Anti-PvP for Epoch <br />
6) Server Intro Credits <br />
7) Server Restart Warnings <br />
<br />

#### Global installation notes
First, click the *download as zip* button on the right. Then simply copy THE CONTENTS of the script folder that you want to install into THE ROOT of your mission file. Exceptions apply to the SC_PlayerSupportRequester_EPOCH folder as well as SC_antiPvP. Those exceptions will be included in the detail installation notes about those particular scripts.<br /><br />

If you are going to install any script from the list above, you will need to add the following (outside of any other brackets) to your description.ext:
`class cfgFunctions <br />
{ <br />
	class ScarCode // ScarCode functions //<br />
	{ <br />
		tag = "SC"; <br />
		// #include lines below please <br />
	}; <br />
};`<br />
If you already have a `cfgFunctions` in your description.ext, you will only need to copy the `class ScarCode` section UNTIL(!) the last `};`

#### Detailed installation notes
*How to install P.S.R.*<br />

