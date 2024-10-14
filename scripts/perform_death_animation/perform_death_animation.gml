function perform_death_animation() {
    // Código para a morte do inimigo (desativar movimento, exibir animação)
    sprite_index = spr_priestkill; // Exemplo de troca de sprite para animação de morte
    instance_destroy(); // Destroi o inimigo após a morte
}
