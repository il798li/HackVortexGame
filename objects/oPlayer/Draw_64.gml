// Set the font and color for drawing text
 // Replace with your font resource
draw_set_color(c_white);    // Ensure this color contrasts with the background

// Draw player health at a fixed position within the GUI space
draw_text_transformed(0, 0, "Player Health: " + string(playerHealth),.5,.5,0);

// Draw boss health at a fixed position within the GUI space if the boss exists
if (instance_exists(oFireBoss)) {
    draw_text_transformed(0, 20, "Boss Health: " + string(oFireBoss.bossHealth),.5,.5,0);
}

draw_text_transformed(0,10,"Psychi: " + string(psychi),.5,.5,0)
