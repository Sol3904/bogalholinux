function perform_attack() {
    // Código para o ataque do inimigo
    // Por exemplo, reduzir a vida do jogador se estiver dentro da área de ataque
    if (distance_to_player < 50) {
		sprite_index = spr_garmjump;
        obj_player.vida_atual -= 10; // Exemplo de dano ao jogador
    }
}
