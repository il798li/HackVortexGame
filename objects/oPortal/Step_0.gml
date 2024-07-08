if(instance_exists(oPlayer)){
if (place_meeting(x, y, oPlayer)) {
	if(room = DevRoom) {
		room_goto(Rm_Water);
	} else {
		room_goto(DevRoom);
	}
	}
}