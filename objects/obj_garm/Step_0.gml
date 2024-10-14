/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



// Atualização do estado do inimigo no Step Event

switch (state) {
    case "idle":
        // Se o inimigo está ocioso, pode mudar para andar se estiver longe do jogador
        if (distance_to_player > 100) {
            state = "walk";
        }
        // Ou pode atacar se o jogador estiver próximo
        if (distance_to_player < 50) {
            state = "attack";
        }
        break;

    case "walk":
        // Movimentar-se em direção ao jogador enquanto está no estado 'walk'
        move_towards_player();
        
        // Alterar para ataque se estiver perto o suficiente
        if (distance_to_player < 50) {
            state = "attack";
        }
        break;

    case "attack":
        // Código para realizar o ataque
        perform_attack();
        
        // Após o ataque, pode retornar ao estado 'idle' ou 'walk'
        if (distance_to_player > 100) {
            state = "walk";
        } else {
            state = "idle";
        }
        break;

    case "hit":
        // Se o inimigo foi atingido, ele pode reagir de forma defensiva ou voltar para 'idle'
        perform_hit_reaction();
        state = "idle";
        break;

    case "dead":
        // Se o inimigo está morto, desabilitar movimento/ataque e executar animação de morte
        perform_death_animation()
        break;
}


