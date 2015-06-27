////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by IT07, v1.063, #Nigyqa)
////////////////////////////////////////////////////////

class submit: RscButton
{
	action = [] spawn SC_fnc_sarPackMags;

	idc = 1600;
	text = "REPACK"; //--- ToDo: Localize;
	x = 19 * GUI_GRID_W + GUI_GRID_X;
	y = 21 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.8};
};
class titleUnMerged: RscText
{
	shadow = 0;

	idc = 1000;
	text = "S.A.R. by IT07"; //--- ToDo: Localize;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 20 * GUI_GRID_H + GUI_GRID_Y;
	w = 18.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0.341,0.529,0.482,0.8};
};
class RscCombo_2100: RscCombo
{
	onLBSelChanged = [_this] spawn SC_fnc_sarGetData;

	idc = 2100;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 21 * GUI_GRID_H + GUI_GRID_Y;
	w = 18.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class output: RscText
{
	sizeEx = 0.05;
	shadow = 0;

	idc = 1001;
	text = "SELECT A MAG TYPE"; //--- ToDo: Localize;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 33 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	colorText[] = {0,0,0,0.9};
	colorBackground[] = {1,1,1,0.8};
	tooltip = "FORMAT: magsOfTypeUsed/magsOfType - curRounds/maxRounds - usedPercentage"; //--- ToDo: Localize;
};
class icon: RscPicture
{
	idc = 1200;
	x = -7 * GUI_GRID_W + GUI_GRID_X;
	y = 20 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 4.5 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
