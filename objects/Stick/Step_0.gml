/// @description Insert description here
// You can write your code in this editor
if(instance_exists(oPlayer)) {
	if(timer > 0 && !timerDone) {
		image_angle = point_direction(oPlayer.x, oPlayer.y - 32, x, y) + 90;
		timer--;
		if(timer <= 0) {
			timerDone = true;
		}
	}
	
	if(timerDone) {
		timer++;
		if(timer > 30) {
			shoot = true;
		}
	}
	
	if(shoot) {
		var angle_rad = degtorad(image_angle);
        xSpd = 3 * sin(angle_rad);
        ySpd = 3 * cos(angle_rad);
        x -= xSpd;
        y -= ySpd;
	}
	
	if (place_meeting(x, y, oPlayer)) {
		if (!oPlayer.isDashing) {
		    oPlayer.playerHealth -= 1;
			if(!audio_is_playing(snd_fire))
			{
				audio_play_sound(snd_fire,0,0)
			}
		}
	}
		
	if place_meeting(x, y, Obj_Platform) {
		instance_destroy();
	}
}