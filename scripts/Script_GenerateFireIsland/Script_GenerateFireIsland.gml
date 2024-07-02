// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Script_GenerateFireIsland () {
	groundHeight = 0.75
	skyHeight = 1 - groundHeight
	
	scale = 2
	for (x = 0; x < room_width; x += Obj_AnimatedMagma.sprite_width) {
		for (y = skyHeight * room_height; y < room_height; y += Obj_AnimatedMagma.sprite_height) {
			magma = instance_create_depth(x, y, 0, Obj_AnimatedMagma);
			magma.image_yscale *= scale
			magma.image_xscale *= scale
		}
	}
	
	randomMagmaY = instance_find(Obj_AnimatedMagma, irandom(instance_number(Obj_AnimatedMagma) - 1)).y;
	randomMagma = instance_nearest(0, randomMagmaY, Obj_AnimatedMagma)
	maxSlope = -2
	minSlope = -1/3
	targetSlope = random_range(minSlope, maxSlope)
	
	currentY = randomMagma.y
	currentX = randomMagma.x
	width = 1
	height = 1
	
	instance_create_depth(currentX, currentY, randomMagma.depth - 1, Obj_Lava)
	
	while (currentY < room_height && currentX < room_width) {
		slope = -height / width
		if (slope > targetSlope) {
			currentY += Obj_Lava.sprite_height
			height += 1
		} else {
			currentX += Obj_Lava.sprite_width
			width += 1
		}
		instance_create_depth(currentX, currentY, randomMagma.depth - 1, Obj_Lava)
	}
}