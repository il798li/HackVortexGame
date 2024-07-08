// Set the font and color for drawing text
 // Replace with your font resource
draw_set_color(c_white);    // Ensure this color contrasts with the background

// Draw player health at a fixed position within the GUI space
draw_text_transformed(0, 0, "Player Health: " + string(playerHealth),1,1,0);

// Draw boss health at a fixed position within the GUI space if the boss exists
if (instance_exists(oFireBoss)) {
    draw_text_transformed(0, 30, "Boss Health: " + string(oFireBoss.bossHealth),1,1,0);
}

draw_text_transformed(0,15,"Psychi: " + string(psychi),1,1,0)

Script6();
if(global.beat1 && global.beat2 && global.beat3) {
	draw_text_transformed(0, 45, "Congratulations on beating all the bosses! Now can you get to the secret room?", 1, 1, 0);
}


draw_text_transformed(0, 60, "Beat1: " + string(global.beat1), 1, 1, 0);
draw_text_transformed(0, 75, "Beat2: " + string(global.beat2), 1, 1, 0);
draw_text_transformed(0, 90, "Beat3: " + string(global.beat3), 1, 1, 0);