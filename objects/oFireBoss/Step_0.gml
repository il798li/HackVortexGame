xSpd *= .8
ySpd *= .8

if(distance_to_object(oPlayer) > 0)
{
ySpd += -sin(point_direction(x,y,oPlayer.x,oPlayer.y) * pi/180) * 1
xSpd += cos(point_direction(x,y,oPlayer.x,oPlayer.y) * pi/180) * 1
}

x += xSpd
y += ySpd

if (place_meeting(x,y,Obj_Player))
{
	if (oPlayer.isDashing) {
		bossHealth -= 10
	} else {
		oPlayer.playerHealth -= 1
	}
}

if (bossHealth < 0) {
	oFireBoss.visible = false
}