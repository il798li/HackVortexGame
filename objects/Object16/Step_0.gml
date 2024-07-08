var _timer = 100;

if(instance_exists(oPlayer))
{
	if (oPlayer.x < 150 && oPlayer.x > 50 && oPlayer.y < 600 && oPlayer.y > 550)
	{
		bossActive = true	
	}
	if(bossActive) {


		if(instance_exists(oPlayer)) {
			if(timer <= 0) {
				instance_create_layer(x + random_range(0, 150) - 75, y + random_range(0, 150) - 75, layer, Object17);
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