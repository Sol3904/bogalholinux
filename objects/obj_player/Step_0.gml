/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//movement

//variaveis iniciais
var right, left, jump, attack, dash;
var chao = place_meeting(x, y + 1, obj_block);

right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check(vk_space);
attack = keyboard_check_pressed(ord("J"));
dash = keyboard_check_pressed(ord("K"));

if(atk_buff > 0)
{
	atk_buff -= 1;
}

//mover
velh = (right - left) * max_velh;


//olhar pro lado certo
if(velh != 0) xscale = sign(velh);
image_xscale = xscale;

//gravidade
if(!chao)
{
	if(velv < max_velv * 2)
	{
		velv += GRAVIDADE * massa;
	}
}
else //salto no chao
{
	if(jump)
	{
		velv = -max_velv;
	}
}

// Verifica se o estado do jogador mudou
if (state != last_state) {
    register_state(state); // Registra o novo estado
    last_state = state;     // Atualiza o último estado para a próxima comparação
}

//state machine
switch(state)
{
	#region idle
	case "idle":
	{
		//comportamento do estado
		sprite_index = spr_bogalhoidle;
		
		//condições de troca de estado
		//moving
		if(right || left)
		{
			state = "moving";
		}
		else if (jump || velv != 0)
		{
			state = "jumping";
			velv = (-max_velv * jump)
			image_index = 0;
		}
		else if (attack)
		{
			state = "attacking";
			velh = 0;
		}
		else if (dash)
		{
			state = "dash";
			image_index = 0;
		}
		
		dmg = noone;
		break;
		
	}
	#endregion
	
	#region moving
	case "moving":
	{
		//comportamento do estado
		sprite_index = spr_bogalhomoving;
		
		//condicoes de troca de estado
		//idle
		if(abs(velh) < .1)
		{
			state = "idle";
			velh = 0;
		}
			else if (jump || velv != 0)
		{
			state = "jumping";
			velv = (-max_velv * jump)
			image_index = 0;
		}
		else if(attack)
		{
			state = "attacking"
		}
		else if (dash)
		{
			state = "dash";
			image_index = 0;
		}
		
		break;
	}
	#endregion
	
	#region jumping
	case "jumping":
	{
		if(velv > 0)
		{
			sprite_index = spr_bogalhofalling;		
		}
		else
		{
			sprite_index = spr_bogalhojump;	
			if(image_index >= image_number-1)
			{
				image_index = image_number-1;			
			}
		}
		
		//condicao de troca de estado
		if(chao)
		{
			state = "idle";
		}
		else if (dash)
		{
			state = "dash";
			image_index = 0;
		}
		break;
	}
	#endregion
	
	#region attacking
	case "attacking":
	{
		
		velh = 0;
		
		if(combo == 0)
		{
			sprite_index = spr_bogalhoatk;
		}
		else if (combo == 1)
		{
			sprite_index = spr_bogalhoatk2;
		}
		else if (combo == 2)
		{
			sprite_index = spr_bogalhoatk3;
		}
		
		//criar objeto de dano
		if(image_index >= 2 && dmg == noone && possoatk)
		{
			dmg = instance_create_layer(x + sprite_width/4 , y - sprite_height/4, layer, obj_dmg)
			dmg.dmg = ataque * atk_mult;
			dmg.pai = id;
			possoatk = false;
		
		}
		
		//config com o buff
		
		if(attack && combo < 2)
		{
			atk_buff = room_speed;
		}
		
		
		if(atk_buff && combo < 2 && image_index >= image_number-1)
		{
			
			combo++;
			image_index = 0;
			possoatk = true;
			atk_mult += 0.5;
			if(dmg)
			{
			 instance_destroy(dmg);
			 dmg = noone;
			}
			
			//reiniciar o buffer
			atk_buff = 0;
			
		}
		
		if(image_index > image_number-1)
		{
			state = "idle";
			combo = 0;
			atk_mult = 1;
			velh = 0;
			possoatk = true;
			if(dmg = noone)
			{
				instance_destroy(dmg);
			}
		}
		if (dash)
		{
			state = "dash";
			image_index = 0;
			combo = 0;
			if(dmg)
			{
				instance_destroy(dmg, false);
				dmg = noone;
			}
		}
		if (velv != 0)
		{
			state = "jumping";
			image_index = 0;
		}
		
		break;
	}
	#endregion
	
	#region dash
	case "dash":
	{
		sprite_index = spr_bogalhodash;
		
		//aumento de velocidade
		velh = image_xscale * dash_vel;
		
		//sair do dash
		if(image_index >= image_number - 1)
		{
			state = "idle";		
		}
	
		break;
	}
	#endregion
}

if(keyboard_check_pressed(ord("R")))room_restart();
