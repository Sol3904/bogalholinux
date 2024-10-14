///@arg player
///@arg dist
///@arg xscale

// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_atk_player_melee(){
	var outro = argument0;
	var dist = argument1;
	var xscale = argument2;

	//check se o player esta na minha linha
	var player = collision_line(x, y, x + (dist * xscale), y - sprite_height/2, outro, 0, 1)

	if(player)
	{
		state = "attack"
	}
}

