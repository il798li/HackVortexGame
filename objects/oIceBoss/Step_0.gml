if(instance_exists(oPlayer))
{
	if (oPlayer.x < 150 && oPlayer.x > 50 && oPlayer.y < 600 && oPlayer.y > 550)
	{
		bossActive = true;
	}
	if(bossActive) {
		if(!audio_is_playing(IceBoss))
				{
					audio_pause_sound(IceWorld);
					audio_play_sound(IceBoss,0,0)
				}
		if(instance_exists(oPlayer)) {
			if(timer <= 0) {
				posX = x + random_range(0, 500) - 200;
				posY = y + random_range(0, 500) - 200;
				while(point_distance(posX, posY, oPlayer.x, oPlayer.y) < 150) {
					posX = x + random_range(0, 500) - 200;
					posY = y + random_range(0, 500) - 200;
				}
				instance_create_layer(posX, posY, layer, Stick);
				timer = 100;
			} else {
				timer -= 1;
			}
		}

		if (place_meeting(x, y, oPlayer)) {
		    if (oPlayer.isDashing) {
		        bossHealth -= 10;
		    } else {
		        oPlayer.playerHealth -= 1;
				if(!audio_is_playing(snd_fire))
				{
					audio_play_sound(snd_fire,0,0)
				}
		    }
		}

		if (bossHealth < 0) {
			audio_pause_sound(IceBoss);
			audio_resume_sound(IceWorld);
			global.beat3 = true;
		    instance_destroy();  // Destroys the current instance of the boss
		}
	}
}