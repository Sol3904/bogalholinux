function move_towards_player() {
    speed = 2;
	sprite_index = spr_garmwalk;
	// Define a velocidade do inimigo
    if (x < obj_player.x) {
        x += speed;
    } else {
        x -= speed;
    }
}
