if(instance_exists(oPlayer))
{
	if (oPlayer.x < 1430 && oPlayer.x > 1340 && oPlayer.y < 1280 && oPlayer.y > 1110)
	{
		bossActive = true	
	}
	if(bossActive) {
		xSpd *= 0.8;
		ySpd *= 0.8;


		if(instance_exists(oPlayer)) {
			if (distance_to_object(oPlayer) > 0) {
			    ySpd += -sin(point_direction(x, y, oPlayer.x, oPlayer.y) * pi / 180) * 1;
			    xSpd += cos(point_direction(x, y, oPlayer.x, oPlayer.y) * pi / 180) * 1;
			}
		}

		if(place_meeting((x+5),y,Obj_Platform) || place_meeting((x-5),y,Obj_Platform)) {
			if(abs(xSpd) < 10)
			{
				xSpd *= -5
			} else {
				xSpd *= -1
			}
		}

		if(place_meeting(x,y+5,Obj_Platform) || place_meeting(x,y-5,Obj_Platform)) {
			if(abs(ySpd) < 10)
			{
				ySpd *= -5
			} else {
				ySpd *= -1
			}
		}

		if (place_meeting(x, y, oPlayer)) {
		    if (oPlayer.isDashing) {
		        bossHealth -= 10;
		    } else {
		        oPlayer.playerHealth -= 1;
				audio_play_sound(snd_fire,0,0)
		    }
		}

		if (bossHealth < 0) {
		    instance_destroy();  // Destroys the current instance of the boss
		}
		// Y Collisions
		var _subPixel = 0.5;
		if place_meeting(x, y + ySpd, Obj_Platform) 
		{
		    // Moving close to floor precisely
		    var _pixelCheck = _subPixel * sign(ySpd);
		    while (!place_meeting(x, y + _pixelCheck, Obj_Platform)) {
		        y += _pixelCheck;
		    }
		    // Hit ceiling
		    if (ySpd < 0) {
		        jumpHoldTimer = 0;
		    }
		    // Setting ySpd to 0 if collision
		    ySpd = 0;
		}
		// X Collisions
		if place_meeting(x + xSpd, y, Obj_Platform) {
		    // Moving close to wall precisely
		    var _pixelCheck = _subPixel * sign(xSpd);
		    while (!place_meeting(x + _pixelCheck, y, Obj_Platform)) {
		        x += _pixelCheck;
		    }
		    // Setting xSpd to 0 if collision
		    xSpd = 0;
		}

		x += xSpd;
		y += ySpd;
	}
}