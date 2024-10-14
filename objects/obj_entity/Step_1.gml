/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//olhar pro lado certo


//exibir estado quando pedido
if(position_meeting(mouse_x, mouse_y, id)) 
{
	if(mouse_check_button_released(mb_left))
	{
		show_state = !show_state;
	}
}

image_speed = img_spd;