////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by IT07, v1.063, #Zesoda)
////////////////////////////////////////////////////////

class sMenuBgMain: IGUIBack
{
	idc = 2203;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 40 * GUI_GRID_W;
	h = 4 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.5};
};
class sMenuBgLeft: IGUIBack
{
	idc = 2200;
	x = 28 * GUI_GRID_W + GUI_GRID_X;
	y = 8 * GUI_GRID_H + GUI_GRID_Y;
	w = 12 * GUI_GRID_W;
	h = 6.5 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.5};
};
class sMenuTitle: RscText
{
	colorBackground[] = {TITLEBACKGROUND,0.8};
	shadow = 0;
	colorText[] = {TITLETEXT,1};

	idc = 1000;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 0 * GUI_GRID_H + GUI_GRID_Y;
	w = 34 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class sMenuListBox: RscCombo
{
	onLBSelChanged = _this call SC_fnc_setSimContent;
	colorBackground[] = {TITLEBACKGROUND,1};
	colorText[] = {TITLETEXT,1};

	idc = 2100;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class contentGroup: RscControlsGroup
{
	idc = 2300;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 8 * GUI_GRID_H + GUI_GRID_Y;
	w = 27.5 * GUI_GRID_W;
	h = 13 * GUI_GRID_H;
	class controls
	{
		class sMenuContentTxt: RscStructuredText
		{
			idc = 1100;
			x = 0 * GUI_GRID_W;
			y = 0 * GUI_GRID_H;
			w = 26.5 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0};
		};
	};
};
class sMenuTxtPLAYERS: RscText
{
	shadow = 0;
	sizeEx = 0.07;

	idc = 1002;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.5};
};
class sMenuTxtUPTIME: RscText
{
	shadow = 0;
	sizeEx = 0.07;

	idc = 1004;
	x = 7.5 * GUI_GRID_W + GUI_GRID_X;
	y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.5};
};
class sMenuTxtRestartIntv: RscText
{
	shadow = 0;
	sizeEx = 0.07;

	idc = 1009;
	x = 16 * GUI_GRID_W + GUI_GRID_X;
	y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.5};
};
class sMenuTitleManager: RscText
{
	shadow = 0;
	colorBackground[] = {TITLEBACKGROUND,1};
	colorText[] = {TITLETEXT,1};

	idc = 1012;
	text = "SERVER MANAGER"; //--- ToDo: Localize;
	x = 28 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class sMenuButtonExit: RscButton
{
	action = closeDialog 0;

	idc = 1600;
	text = "CLOSE/EXIT"; //--- ToDo: Localize;
	x = 34.5 * GUI_GRID_W + GUI_GRID_X;
	y = 0 * GUI_GRID_H + GUI_GRID_Y;
	w = 5.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.8};
	tooltip = "Or press ESCAPE key"; //--- ToDo: Localize;
};
class sMenuEdit: RscEdit
{
	shadow = 0;

	idc = 1402;
	x = 24 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 15.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorText[] = {1,1,1,1};
	tooltip = "Click any button on the left"; //--- ToDo: Localize;
};
class sMenuTxtAddress: RscText
{
	shadow = 0;
	sizeEx = 0.07;

	idc = 1017;
	x = 24.5 * GUI_GRID_W + GUI_GRID_X;
	y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 15.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.5};
};
class sMenuTxtAH: RscText
{
	shadow = 0;
	sizeEx = 0.05;

	idc = 1005;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.5};
};
class sMenuButtonGT_URL: RscButton
{
	action = ["GET_GT_URL"] call SC_fnc_setSimCtrlText;

	idc = 1601;
	text = "GET GAMETRACKER"; //--- ToDo: Localize;
	x = 14.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.8};
};
class sMenuButtonIP_PORT: RscButton
{
	action = ["GET_ADDRESS"] call SC_fnc_setSimCtrlText;

	idc = 1602;
	text = "GET IP:PORT"; //--- ToDo: Localize;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.8};
};
class sMenuButtonPlayerUID: RscButton
{
	action = ["GET_PLAYERUID"] call SC_fnc_setSimCtrlText;

	idc = 1603;
	text = "GET PLAYER UID"; //--- ToDo: Localize;
	x = 6.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.8};
};
class sMenuTitlePlayers: RscText
{
	shadow = 0;
	colorBackground[] = {TITLEBACKGROUND,0.8};
	colorText[] = {TITLETEXT,1};

	idc = 1001;
	text = "PLAYERS"; //--- ToDo: Localize;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class sMenuTitleUPT: RscText
{
	shadow = 0;
	colorBackground[] = {TITLEBACKGROUND,0.8};
	colorText[] = {TITLETEXT,1};

	idc = 1006;
	text = "UPTIME"; //--- ToDo: Localize;
	x = 7.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class sMenuTitleIPPORT: RscText
{
	shadow = 0;
	colorBackground[] = {TITLEBACKGROUND,0.8};
	colorText[] = {TITLETEXT,1};

	idc = 1007;
	text = "IP:PORT"; //--- ToDo: Localize;
	x = 24.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 15.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscText_1008: RscText
{
	shadow = 0;
	colorBackground[] = {TITLEBACKGROUND,0.8};
	colorText[] = {TITLETEXT,1};

	idc = 1008;
	text = "REST. INTV."; //--- ToDo: Localize;
	x = 16 * GUI_GRID_W + GUI_GRID_X;
	y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class sMenuTxtHint: RscText
{
	sizeEx = 0.035;

	idc = 1010;
	text = "Use the selector on the left to get desired info"; //--- ToDo: Localize;
	x = 12 * GUI_GRID_W + GUI_GRID_X;
	y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 28 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.7};
};
class sMenuTitleAH: RscText
{
	shadow = 0;
	colorBackground[] = {TITLEBACKGROUND,0.8};
	colorText[] = {TITLETEXT,1};

	idc = 1011;
	text = "SERVER ANTIHACK"; //--- ToDo: Localize;
	x = 28 * GUI_GRID_W + GUI_GRID_X;
	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class sMenuTxtManager: RscText
{
	shadow = 0;
	sizeEx = 0.05;

	idc = 1013;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.5};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
