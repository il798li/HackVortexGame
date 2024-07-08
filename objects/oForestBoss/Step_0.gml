if(instance_exists(oPlayer))
{
	if (oPlayer.x < 1980 && oPlayer.x > 1950 && oPlayer.y < 930 && oPlayer.y > 860)
	{
		bossActive = true;
	}
	if(bossActive) {
		if(instance_exists(oPlayer)) {
			if(timer <= 0) {
				for(var i = 0; i < 20; i++) {
				}
				instance_create_layer(posX, posY, layer, StickDown);
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
		    instance_destroy();  // Destroys the current instance of the boss
		}
	}
}