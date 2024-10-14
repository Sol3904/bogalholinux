/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var chao = place_meeting(x, y + 1, obj_block)

//olhar pro lado certo
if(velh != 0) xscale = sign(velh);
image_xscale = xscale;


if(!chao)
{
	velv += GRAVIDADE * massa;
	
}

//if(mouse_check_button_pressed(mb_right))
//{
//	state = "attack";
//}






switch(state)
{
	case "idle":
	{
		velh = 0;
		timer_state++;
		if(sprite_index != spr_priestidle)
		{
			//reiniciar a animacao de hit
			image_index = 0;
		}
		sprite_index = spr_priestidle;
		
		//troca de estado
		
		if(position_meeting(mouse_x, mouse_y, self))
		{
			if(mouse_check_button_pressed(mb_right))
			{
				state = "hit";
			}
		}
		//entrar no estado walk
		if(irandom(timer_state) > 300)
		{
			state = choose("walk", "idle", "walk");		
			timer_state = 0;
		}
		
		scr_atk_player_melee(obj_player, dist, xscale)
		
		break;
	}
	
	case "walk":
	{
		timer_state++;
		if(sprite_index != spr_priestwalk)
		{
			image_index = 0;
			velh = choose(1, -1);
		}
		
		sprite_index = spr_priestwalk;
		
		//condicao de saida do estado
		if (irandom(timer_state) > 300)
		{
			state = choose("idle", "walk", "idle");
			timer_state = 0;
		}
		
		scr_atk_player_melee(obj_player, dist, xscale)
		
		break;
	}
	
	case "attack":
	{
		velh = 0;
		if(sprite_index != spr_priestatk)
		{
			image_index = 0;
		}
		sprite_index = spr_priestatk;
		
		if(image_index > image_number-1)
		{
			state = "idle";
		}
		
		//create dmg
		if(image_index >= 2 && dmg == noone)
		{
			dmg = instance_create_layer(x + (sprite_width - 180), y - (sprite_height - 150), layer, obj_dmg);
			dmg.dmg = atk;
			dmg.pai = id;
		}
		
		//destruir obj_dmg
		if(dmg != noone && image_index >= 4)
		{
			instance_destroy(dmg);
			dmg = noone;
		}
		
		//sair do estado
		break;
	}
	
	case "hit":
	{
		if(sprite_index != spr_priesthit)
		{
			//reiniciar a animacao de hit
			image_index = 0;
		}
		sprite_index = spr_priesthit;
		velh = 0;
		
		 show_debug_message("Inimigo atingido! Vida atual: " + string(vida_atual));
		
		//sair do hit
		
		if(image_index > image_number-1)
		{
			//vida restante?
			if(vida_atual > 0)
			{
			   state = "idle";
			}
			else if(vida_atual <= 0)
			{
			   state = "dead";			
			}
			
			
		}
		break;
	}
	
	case "dead":
	{
		if(sprite_index != spr_priestkill)
		{
			//reiniciar a animacao de hit
			image_index = 0;
		}
		sprite_index = spr_priestkill;
		
		//morte real
		if(image_index > image_number-1)
		{
			image_speed = 0;
			image_alpha -= .01;
			
			if(image_alpha <= 0) instance_destroy();
		}
		break;
	}
}