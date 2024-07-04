function Script_SpawnCloud () {
	y = irandom_range(0, global.skyHeight * 3/4 * room_height)
	x = 0 * Obj_Cloud.sprite_width
	y = instance_nearest(x, y, Obj_Sky).y
	
	width = irandom_range(0, 2)
	height = irandom_range(0, width)
	show_debug_message(string(width) + ", " + string(height))
	
	speed = irandom_range(1, 5)
	
	for (width = width; width >= 0; width-= 1) {
		show_debug_message("Width: " + string(width))
		for (height = height; height >= 0; height-= 1) {
			show_debug_message("Height: " + string(height))
			cloud = instance_create_depth(x + width * Obj_Cloud.sprite_width, y + height * Obj_Cloud.sprite_height, -1, Obj_Cloud)
			cloud.speed = speed
		}
	}
}