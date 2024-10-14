/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

draw_text(50, 50, vida_atual);

//linha de visao do inimigo
draw_line(x, y, x + (dist * xscale), y - sprite_height/2);