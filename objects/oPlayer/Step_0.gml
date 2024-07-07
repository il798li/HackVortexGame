// Inputs
getControls();

// X Movement
// Direction
moveDir = right_key - left_key;

// Get face direction
if (moveDir != 0) {
    face = moveDir;
} 
if(xSpd != 0 && onGround)
{
	if(!audio_is_playing(snd_walking))
	{
		audio_play_sound(snd_walking,0,0)
	}
} else {
	audio_stop_sound(snd_walking)
}

// Get xSpd
if (!dashingToSide && jumpingOffWallCountdown == 0) {
    xSpd = moveDir * moveSpd;
} else if (jumpingOffWallCountdown != 0) {
    jumpingOffWallCountdown--;
}

if (dashCountdown != 0) {
    dashCountdown--;
}

if (dashCountdown == 0) {
    dashingToSide = false;
    isDashing = false;
}

// X Collisions
var _subPixel = 0.5;
if place_meeting(x + xSpd, y, Obj_Platform) {
    // Moving close to wall precisely
    var _pixelCheck = _subPixel * sign(xSpd);
    while (!place_meeting(x + _pixelCheck, y, Obj_Platform)) {
        x += _pixelCheck;
    }
    // Setting xSpd to 0 if collision
    xSpd = 0;
	onAWall =true
}

if place_meeting(x + xSpd, y, oMovablePlatform) {
    // Moving close to wall precisely
    var _pixelCheck = _subPixel * sign(xSpd);
    while (!place_meeting(x + _pixelCheck, y, oMovablePlatform)) {
        x += _pixelCheck;
    }
    // Setting xSpd to 0 if collision
    xSpd = 0;
	onAWall = true
}

// Dashing
if (dash_key_pressed && !hasDashed && moveDir != 0 && psychi > 0) {
	audio_play_sound(snd_dash,0,0)
    if (moveDir != 0 && keyboard_check(vk_up) && !place_meeting(x + dashSpeed * moveDir * cos(pi / 4), y, Obj_Platform)) {
        xSpd = moveDir * dashSpeed * cos(pi / 4);
        dashingToSide = true;
        ySpd = -dashSpeed * sin(pi / 4);
    } else {
        if (!place_meeting(x + dashSpeed * moveDir, y, Obj_Platform)) {
            xSpd = moveDir * dashSpeed;
        }
        if (moveDir != 0) {
            dashingToSide = true;
        }
    }
    hasDashed = true;
    dashCountdown = 30;
    isDashing = true;
	psychi -= .2
}

if (onAWall) {
	isDashing = false
	hasDashed = false
}

// Move X
x += xSpd;

// Y Movement
// Gravity
if (coyoteHangTimer > 0) {
    // Counting the timer down for coyote hang time
    coyoteHangTimer--;
} else {
    // Apply gravity to the player
    if (onAWall != 0 && moveDir == -onAWall) {
        ySpd = 1;
    } else {
        if (!isDashing) {
            ySpd += grav;
        }
    }
    // We're no longer on the ground
    setOnGround(false);
}

if (onAWall != 0) {
    jumpCount = 0;
}

// Reset or prepare jumping var
if (onGround) {
    jumpCount = 0;
    coyoteJumpTimer = coyoteJumpFrames;
} else {
    coyoteJumpTimer--;
    // If player is in air make sure they don't get extra jump
    if (jumpCount == 0 && coyoteJumpTimer <= 0) {
        jumpCount = 1;
    }
}

// Initiate the jump
if (jumpKeyBuffered && jumpCount < jumpMax) {
    // Reset the buffer
    jumpKeyBuffered = false;
    jumpKeyBufferTimer = 0;
    // Increasing number of performed jumps
    jumpCount++;
    // Set jump hold timer
    jumpHoldTimer = jumpHoldFrames;
    // Tell ourselves we're no longer on the ground
    setOnGround(false);
}

if (!jump_key) {
    jumpHoldTimer = 0;
}

// Jump based on holding the button
if (jumpHoldTimer > 0) {
    // Constantly set ySpd to be the jumping speed
    ySpd = jspd;
    // Count down the timer
    jumpHoldTimer--;
}

// Terminal Velocity
if (ySpd > termVel) {
    ySpd = termVel;
}

// Y Collisions
if place_meeting(x, y + ySpd, Obj_Platform) {
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

if place_meeting(x, y + ySpd, oMovablePlatform) {
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

// Check if on ground
if (ySpd >= 0 && place_meeting(x, y + 1, Obj_Platform)) {
    setOnGround(true);
}

if (ySpd >= 0 && place_meeting(x, y + 1, oMovablePlatform)) {
    setOnGround(true);
}

// Move Y
y += ySpd;

if(xSpd = 0 && ySpd = 0 && psychi < psychiCap)
{
	psychi += .001
	sprite_index = sPlayerCharging
}

if (playerHealth < 0) {
	instance_destroy()
}

// Sprite/Animation control
// Walking
if (abs(xSpd) > 0) {
    sprite_index = walkSpr;
}

// If not moving
if (xSpd == 0) {
    sprite_index = idleSpr;
}

image_angle = 0;

// Dashing Sprite
if (isDashing) {
    sprite_index = dashSpr;
    image_angle = dashDirection;
}

if(xSpd = 0 && ySpd = 0 && psychi < psychiCap && !oMovablePlatform.isBeingMoved)
{
	psychi += .01
	sprite_index = sPlayerCharging
}

// Set collision mask
mask_index = idleSpr;