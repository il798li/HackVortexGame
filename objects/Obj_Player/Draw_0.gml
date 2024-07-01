if (global.leftDown && global.rightDown) {
	speed = 0
} else if (global.leftDown && !global.rightDown) {
	speed = 1
} else if (global.leftDown and global.rightDown) {
	speed = -1
} else {
	speed = 0
}
show_debug_message("(" + string(x) + ", " + string(y) + ")")
visible = true