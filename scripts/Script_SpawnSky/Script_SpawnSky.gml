// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Script_SpawnSky () {
	for (x = 0; x < room_width; x += Obj_Sky.sprite_width) {
		for (y = 0; y < global.skyHeight * room_width; y += Obj_Sky.sprite_height) {
			instance_create_depth(x, y, 0, Obj_Sky)
		}
	}
}