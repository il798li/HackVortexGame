//Custom functions for player
function setOnGround(_val = true)
{
	if _val == true
	{
		onGround = true
		coyoteHangTimer = coyoteHangFrames
		hasDashed = false
		dashingToSide = false
	} else {
		onGround = false 
		coyoteHangTimer = 0
	}
}

//Control Setup
controlsSetup()

//Sprites
	idleSpr = sIdle
	walkSpr = sWalkRight
	dashSpr = sDash

//Moving
	face = 1
	moveDir = 0;
	moveSpd = 3;
	xSpd = 0;
	ySpd = 0;

//Jumping
	grav = .275;
	termVel = 5;
	onGround = true
	jspd = -3.15;
	jumpMax = 2
	jumpCount = 0
	jumpHoldTimer = 0
	jumpHoldFrames = 18

	//Coyote Time
	//Hang time
	coyoteHangFrames = 2
	coyoteHangTimer = 0
	
	//Jump buffer time
	coyoteJumpFrames = 5
	coyoteJumpTimer = 0
	
	//For wall jumping
	jumpingOffWallCountdown = 0

//Dashing
dashSpeed = 10
hasDashed = false
dashingToSide = false
dashCountdown = 0
isDashing = false
dashTime = 