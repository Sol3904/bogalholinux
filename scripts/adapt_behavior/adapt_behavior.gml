function adapt_behavior() {
    // Conectar ao banco de dados
    var db = sqlite3_open("adaptbhvr.db");
    
    // Consultar a frequência dos estados do jogador
    var query = "SELECT state, count FROM player_behavior ORDER BY count DESC;";
    var result = sqlite3_exec(db, query);
    
    // Processar os resultados
    var most_common_state = "";
    var highest_count = 0;
    
    while (sqlite3_fetch_row(result)) {
        var state = sqlite3_column_text(result, 0);
        var count = sqlite3_column_int(result, 1);
        
        // Encontrar o estado mais frequente
        if (count > highest_count) {
            most_common_state = state;
            highest_count = count;
        }
    }
    
    // Adapte o comportamento do inimigo com base no estado mais frequente do jogador
    if (most_common_state == "attacking") {
        state = "idle"; // O inimigo deve se preparar defensivamente
    } else if (most_common_state == "dashing") {
        state = "attack"; // O inimigo pode tentar atacar enquanto o jogador usa dash
    } else if (most_common_state == "jumping") {
        state = "attack"; // O inimigo pode atacar enquanto o jogador está no ar
    } else if (most_common_state == "moving") {
        state = "walk"; // O inimigo tenta se aproximar para atacar
    } else {
        state = "idle"; // Comportamento padrão do inimigo é ficar parado
    }
}
