/// @description Insert description here
// You can write your code in this editor

var timer = random_range(100, 150);
var timerDone = false;
var shoot = false;
var xSpd = 0;
var ySpd = 0;

if(instance_exists(oPlayer)) {
	if(timer > 0 && !timerDone) {
		image_angle = arctan2(oPlayer.y - y, oPlayer.y - y);
		timer--;
		if(timer <= 0) {
			timerDone = true;
		}
	}
	
	if(timerDone) {
		timer++;
		if(timer > 50) {
			shoot = true;
		}
	}
	
	if(shoot) {
		xSpd = cos(image_angle);
		ySpd = sin(image_angle);
		x += xSpd;
		y += ySpd;
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
		
	if place_meeting(x + xSpd, y, Obj_Platform) {
		instance_destroy();
	}
	
	if place_meeting(x, y + ySpd, Obj_Platform) {
		instance_destroy();
	}
}