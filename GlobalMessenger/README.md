# Global Messenger by IT07
### For ArmA 3 EPOCH mod

##### INSTALLATION
**1)** Copy `a3_scarCODE_GM.pbo` over to your server's *@epochhive\addons\* folder, unpack it (I use PBOManager) and put your admin's UIDs into `config.cpp`. You will know where.<br />
**2)** Repack the contents of a3_scarCODE_GM folder into a pbo. Make sure you do not pack the folder because then the .pbo will be named a3_scarCODE_GM but will have a folder in it named exactly the same. Not good. Not good.<br />
**3)** Ok we're done for the server-side part, now the client-side part: unpack Epoch.MapName.pbo, take the *scarCODE* folder and put it inside the root of your own server's mission file.<br />
**4)** Now that we have the required files inside your mission file, we will need to do one more thing (probably the hardest one yet) and that is editing your description.ext located inside the root of your mission file. If you do not have one, then you're lucky: just copy over the provided *description.ext* into the root of your server's mission file. However, if you DO already have a description.ext file, then read **carefully** what is in the example description.ext it will explain you how to merge it with yours.<br />

##### infiSTAR
If you're using infiSTAR, please add this to the `_allowedDialogs` section:<br />
`_allowedDialogs pushBack 2097;`<br />
And set `_RDK` to false too :) otherwise the keypress will not work<br />

##### BattlEye
If you have a scripts.txt in your BE filters, then add this to the 7 createDialog line:<br />
`!="createDialog 'SC_gmDiag';"`
