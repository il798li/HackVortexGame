if(instance_exists(oPlayer))
{
	if (oPlayer.x < 2540 && oPlayer.x > 2460 && oPlayer.y < 960 && oPlayer.y > 924)
	{
		bossActive = true;
	}
	if(bossActive) {
		if(instance_exists(oPlayer)) {
			if(timer <= 0) {
				for(var i = 0; i <= 500; i+= 50) {
					instance_create_layer(i + x - 200, y - 125, layer, oStickDown);
				}
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