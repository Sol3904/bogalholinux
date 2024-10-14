/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

draw_self();

if(show_state)
{
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

draw_text(x, y - sprite_height/2, state);
draw_set_valign(-1);
draw_set_halign(-1);
}

