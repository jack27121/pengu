/// @func hurt
/// @description makes obj hurt and adds force, or die
/// @param	object
/// @param	damage
/// @param	hforce
/// @param	vforce
function hurt(obj,damage,hforce,vforce){
	with(obj){
		if (!hurting && !invincible){
			hp-=damage;
			if(hp<= 0) state.change("dying");	
			else {
				hspd = hforce;
				vspd = vforce;
				state.change("hurt");
			}
		}
	}
}