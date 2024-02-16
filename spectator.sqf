/* Private variables */
private ["_Key","_RscLayer", "_HintLayer"];
/* Prevents unit moving */
(_this select 1) enableSimulation false;
/* Specate only players group (ignore zeus)*/
RscSpectator_allowedGroups = [raid_group];
/* Prevents free spectator camera */
RscSpectator_allowFreeCam = false;
/* Disable post processing effects for spectator */
BIS_fnc_feedback_allowPP = false;
/* Runs spectator script */
_RscLayer = "BIS_fnc_respawnSpectator" call bis_fnc_rscLayer;
_RscLayer cutrsc ["RscSpectator","plain"];

_HintLayer = "HNDM_hint" call bis_fnc_rscLayer;
_HintLayer cutText ["left-right arrow keys to switch players, ESC to stop spectating", "PLAIN DOWN"];
/* Exits spectator camera using the Ctrl + T key */
BEARB_SpectatorKeyDown =
{
   _Key = _this select 1;
   if ((_Key == 1)) then
   {
		/* Enables post processing effects for spectator */
		BIS_fnc_feedback_allowPP = true;
		/* Stops spectator script */
		("BIS_fnc_respawnSpectator" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
		("HNDM_hint" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
		/* Removes event handlers detecting key press */
		(findDisplay 46) displayRemoveEventHandler ["KeyDown", BEARB_SpectatorEH];
		/* Allows unit moving */
		player enableSimulation true;
   };
};
/* Ensures the primary display is found */
waitUntil {!isNull(findDisplay 46)};
/* Adds event handlers to detect key press */
BEARB_SpectatorEH = (findDisplay 46) displayAddEventHandler ["keyDown", "_this call BEARB_SpectatorKeyDown"];