/*scale = 2
for (x = 0; x < room_width; x += Obj_AnimatedMagma.sprite_width) {
	for (y = 0; y < room_height; y += Obj_AnimatedMagma.sprite_height) {
		magma = instance_create_depth(x, y, 0, Obj_AnimatedMagma);
		magma.image_yscale *= scale
		magma.image_xscale *= scale
	}
}*/

Script_GenerateFireIsland()