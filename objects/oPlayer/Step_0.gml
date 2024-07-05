//Inputs
getControls();

//X movement
	//Direction
	moveDir = right_key - left_key

	//Get xspd
	xSpd = moveDir * moveSpd;

	//X collisions
	var _subPixel = .5;
	if place_meeting(x+xSpd, y, Obj_Platform)
	{
		//Moving close to wall precisely
		var _pixelCheck = _subPixel * sign(xSpd);
		while !place_meeting(x+_pixelCheck, y, Obj_Platform)
		{
			x += _pixelCheck
		}
	
		//Setting xspd to 0 if collision
		xSpd = 0;
	}

	//Move
	x += xSpd;
	
//Y Movement
	//Gravity
	if coyoteHangTimer > 0
	{
		//couonting the timer down for coyote hang time
		coyoteHangTimer--
	} else{
		//Apply gravity to the player
		ySpd += grav;
		//we're no longer on the ground
		setOnGround(false)
	}
	
	//Reset or prepare jumping var
	if onGround
	{
		jumpCount = 0
		coyoteJumpTimer = coyoteJumpFrames
	} else {
		coyoteJumpTimer--
		//if player is in air make sure they don't get extra jump
		if jumpCount == 0 && coyoteJumpTimer <= 0
		{
			jumpCount = 1
		}
	}
	
	//Initiate the jump
	if (jumpKeyBuffered && jumpCount < jumpMax)
	{	
		//reset the buffer
		jumpKeyBuffered = false
		jumpKeyBufferTimer = 0
		
		//Increasing number of preformed jumps
		jumpCount++
		
		//set jumphold timer
		jumpHoldTimer = jumpHoldFrames
		
		//tell ourself we're no longer on the ground
		setOnGround(false)
	}
	
	if !jump_key
	{
		jumpHoldTimer = 0
	}
	
	//jump based on holding the button
	if jumpHoldTimer > 0
	{
		//constantly set yspd to be the jumping speed
		ySpd = jspd
		
		//count down the timer
		jumpHoldTimer--
	}
	
	//Terminal Velocity
	if (ySpd > termVel)
	{
		ySpd = termVel;
	}
	
	//Y Collision
	var _subPixel = .5;
	if place_meeting(x, y + ySpd, Obj_Platform)
	{
		//Moving close to floor precisely
		var _pixelCheck = _subPixel * sign(ySpd);
		while !place_meeting(x, y+_pixelCheck, Obj_Platform)
		{
			y += _pixelCheck
		}
		
		//hit ceiling
		if ySpd < 0
		{
			jumpHoldTimer = 0
		}
		
		//Setting yspd to 0 if collision
		ySpd = 0;
	}
	
	//See whether on ground or not
	if (ySpd >= 0 && place_meeting(x, y+1, Obj_Platform))
	{
		setOnGround(true)
	}
	
	//Move
	y+=ySpd;