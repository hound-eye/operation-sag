if !(local this) exitWith {};  
  
clearWeaponCargoGlobal this;  
clearMagazineCargoGlobal this;  
clearItemCargoGlobal this;  
clearBackpackCargoGlobal this;  

this setMaxLoad 10000;

this addWeaponWithAttachmentsCargoGlobal [["rhs_weap_vss", "", "", "rhs_acc_pso1m21", ["rhs_20rnd_9x39mm_SP6", 20], [], ""], 1]; 
{  
  this addMagazineCargoGlobal _x;  
} forEach [["rhs_mine_ozm72_a_mag", 5], ["rhs_mine_ozm72_b_mag", 5], ["rhs_ec400_sand_mag", 5], ["rhs_30Rnd_545x39_7N10_plum_AK", 20], ["rhs_20rnd_9x39mm_SP6", 20]];  
  
{  
  this addItemCargoGlobal _x;  
} forEach [["rhs_acc_tgpa", 5]]; 
 
