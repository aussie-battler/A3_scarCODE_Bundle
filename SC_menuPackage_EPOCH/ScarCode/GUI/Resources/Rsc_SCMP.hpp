////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by IT07, v1.063, #Jonoro)
////////////////////////////////////////////////////////

class bg: IGUIBack
{
	idc = 2200;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 18 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	colorBackground[] = {1,1,1,0.7};
};
class mainTitle: RscText
{
	shadow = 0;

	idc = 1000;
	text = "SMP v0.1"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 18 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.7};
};
class buttonSIM: RscButton
{
	action = "closeDialog 0; createDialog'SC_simDiag';";

	idc = 1600;
	text = "OPEN S.I.M."; //--- ToDo: Localize;
	x = 11.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	tooltip = "Click to open Server Info Menu"; //--- ToDo: Localize;
};
class buttonPSR: RscButton
{
	action = "closeDialog 0; createDialog'SC_psrDiag';";

	idc = 1601;
	text = "OPEN P.S.R."; //--- ToDo: Localize;
	x = 20.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	tooltip = "Click to open Player Support Requester"; //--- ToDo: Localize;
};
class buttonClose: RscButton
{
	action = closeDialog 0;

	idc = 1602;
	text = "CLOSE"; //--- ToDo: Localize;
	x = 23 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
