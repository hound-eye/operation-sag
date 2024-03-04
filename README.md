# Adding custom selectable roles to the respawn screen.

1. Prepare all loadouts and save them in ACE Arsenal.
2. Configure the description.ext file:

	2.1 **Create** `description.ext` file in the root of the mission directory.
   
	2.2 **Add** empty `CfgRespawnInventory` object to it (copy-paste thing below)
    ```
    class CfgRespawnInventory
    {
    };
    ```

    2.3 Select the soldier with your ACE loadout applied to him, then go top menu Tools -> Loadout Tools -> **Export Loadout** (CfgRespawnInventory).
    This should copy some text in your clipboard.

    2.4 **Paste** the text from the clipboard into the `description.ext`, right in between the curly braces of CfgRespawnInventory.
    It now should look like this

    ```
    class B_Soldier_SL_F
    {
    displayName = "Squad Leader";
    icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
    role = "Default";
    show = "true";
    uniformClass = "rhs_uniform_g3_mc";
    backpack = "";
    weapons[] = {"rhs_weap_ak74n_2_npz", "rhsusf_weap_glock17g4", "Throw", "Put"};
    magazines[] = {"HandGrenade", "SmokeShell", "HandGrenade", "HandGrenade", "rhsusf_mag_17Rnd_9x19_FMJ", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhsusf_mag_17Rnd_9x19_FMJ"};
    items[] = {"ACE_personalAidKit", "ACE_splint", "ACE_splint", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_tourniquet", "ACE_tourniquet"};
    linkedItems[] = {"Vest04", "rhsusf_opscore_mc_cover_pelt", "rhsusf_oakley_goggles_clr", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "ItemGPS", "rhs_acc_tgpa", "Scot_EO_Vudu"};
    };
    //Biki: https://community.bistudio.com/wiki/Arma_3_Respawn#Loadouts_and_Roles
    ```

    Now we added an inventory entry to `description.ext`

    2.5 **Adjust** this inventory entry:
        - **Class name** (`B_Soldier_SL_F`) is an internal object name, that can be changed to something you understand, though the name shouldn't be the same as some ArmA entities, e.g. `HNDM_SL_AK`
        Use some short name with a made-up prefix, to make it unique.
        - **Display name** (`displayName = "Squad Leader"`) is the name that will be visible in the respawn menu in the list of loadouts.
        Doesn't have to be unique.
        - **Role** (`role = "Default"`) is the name of the "Role" that is visible in the respawn menu.
        You can use that, or if you want to use a different name/icon, see steps 3.
        2.5.4 **remove** the comment (//Biki: https://community.bistudio.com/wiki/Arma_3_Respawn#Loadouts_and_Roles)

    **Now it should look like this**:

    ```
    class HNDM_SL_AK
    {
    displayName = "SL AK-74 optic";
    icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
    role = "Default";
    show = "true";
    uniformClass = "rhs_uniform_g3_mc";
    backpack = "";
    weapons[] = {"rhs_weap_ak74n_2_npz", "rhsusf_weap_glock17g4", "Throw", "Put"};
    magazines[] = {"HandGrenade", "SmokeShell", "HandGrenade", "HandGrenade", "rhsusf_mag_17Rnd_9x19_FMJ", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhsusf_mag_17Rnd_9x19_FMJ"};
    items[] = {"ACE_personalAidKit", "ACE_splint", "ACE_splint", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_tourniquet", "ACE_tourniquet"};
    linkedItems[] = {"Vest04", "rhsusf_opscore_mc_cover_pelt", "rhsusf_oakley_goggles_clr", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "ItemGPS", "rhs_acc_tgpa", "Scot_EO_Vudu"};
    };
    ```
4. Add a **custom role** (optional)
5. Apply the role to the soldier
    In the Eden editor, on the soldier to whom you want to add this inventory, add the following to its `init` field:
    ```
    [this, "HNDM_SL_AK"] call BIS_fnc_addRespawnInventory;
    ```
    If you have several inventories configured, then it would look like this:
    ```
    [this, "HNDM_SL_AK"] call BIS_fnc_addRespawnInventory;
    [this, "HNDM_SL_M4"] call BIS_fnc_addRespawnInventory;
    [this, "HNDM_SL_FAL"] call BIS_fnc_addRespawnInventory;
    ```
6. Make sure multiplayer settings for choosing roles are enabled:
Top menu -> Attributes -> Multiplayer
- Respawn "On Custom Position" : selected
- Select respawn loadout : checked
- Respawn Delay : set to greater than 0 seconds

