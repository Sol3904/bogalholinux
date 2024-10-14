/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var outro = instance_place(x,y,obj_entity);
//timer += 1;

//se eu estou a tocar em alguem
if (outro)
{
	show_debug_message("Colisão com inimigo ID: " + string(outro.id));
	//se eu nao estou a tocar no meu pai
	if(outro.id != pai)
	{
		show_debug_message("Dano aplicado ao inimigo ID: " + string(outro.id));
		
		if(outro.vida_atual > 0)
		{
			outro.state = "hit";
			outro.image_index = 0;
			outro.vida_atual -= dmg;
			show_debug_message("Dano aplicado! Vida restante: " + string(outro.vida_atual));
			instance_destroy();
		}
	}	
}
else
{
	instance_destroy();
}

//if (timer >= lifetime) {
  //  instance_destroy();
//}