function controlsSetup()
{
	jumpBufferTime = 6
	
	jumpKeyBuffered = 0
	jumpKeyBufferTimer = 0
}
function getControls()
{
	//Directional Inputs replace vk_right with ord("D") for other keys
	right_key = keyboard_check( vk_right ) + keyboard_check( ord("D") )
	right_key = clamp(right_key,0,1)
	
	left_key = keyboard_check( vk_left ) + keyboard_check( ord("A") )
	left_key = clamp(left_key,0,1)
	
	//Action Inputs
	jump_key_pressed = keyboard_check_pressed( vk_space ) + keyboard_check_pressed( ord("C") )
	jump_key_pressed = clamp(jump_key_pressed,0,1)
	jump_key = keyboard_check( vk_space ) + keyboard_check( ord("C") )
	jump_key = clamp(jump_key,0,1)
	
	//Jump Key Buffering
	if jump_key_pressed
	{
		jumpKeyBufferTimer = jumpBufferTime
	}
	
	if jumpKeyBufferTimer > 0
	{
		jumpKeyBuffered = 1
		jumpKeyBufferTimer--
	} else {
		jumpKeyBuffered = 0
	}
	
	//Dashing
	dash_key_pressed = keyboard_check_pressed( ord("X") )
	
	//Checks if player is on a wall. If wall is to left, value is 1
	onAWall = place_meeting(x-5,y,Obj_Platform) - place_meeting(x+5,y,Obj_Platform)
	
}