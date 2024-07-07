if(instance_exists(oPlayer)){
if((position_meeting(mouse_x,mouse_y,oMovablePlatform) || isBeingMoved) && oPlayer.psychi > 5)
{
	sprite_index = sControlledPlatform
	image_blend = c_white
	if(mouse_check_button(mb_left))
	{
		isBeingMoved = true
		hasMovedOnce = true
	}
} else {
	sprite_index = Spr_Platform
	image_blend = c_yellow
}

if(mouse_check_button_released(mb_left)){
	isBeingMoved = false
}

if(isBeingMoved = false) {
	ySpd = 0
	xSpd = 0
}

if(hasMovedOnce && !place_meeting(x,y+ySpd,oMovablePlatform) && !place_meeting(x,y+ySpd,Obj_Platform))
{
	ySpd = 3.15
}

if(isBeingMoved)
{
	ySpd = -sin(point_direction(x, y, mouse_x, mouse_y) * pi / 180) * oPlayer.psychi/10;
	xSpd = cos(point_direction(x, y, mouse_x, mouse_y) * pi / 180) * oPlayer.psychi/10;
	oPlayer.psychi -= .01
}

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
if place_meeting(x, y + ySpd, oMovablePlatform) 
{
    // Moving close to floor precisely
    var _pixelCheck = _subPixel * sign(ySpd);
    while (!place_meeting(x, y + _pixelCheck, oMovablePlatform)) {
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
if place_meeting(x + xSpd, y, oMovablePlatform) {
    // Moving close to wall precisely
    var _pixelCheck = _subPixel * sign(xSpd);
    while (!place_meeting(x + _pixelCheck, y, oMovablePlatform)) {
        x += _pixelCheck;
    }
    // Setting xSpd to 0 if collision
    xSpd = 0;
}

x += xSpd
y += ySpd
}