function register_state(state_name) {
    // Verifica se o estado já foi registrado no banco de dados
    var query = "SELECT count FROM player_behavior WHERE state = '" + string(state_name) + "';";
    var result = sqlite3_exec(db, query);
    
    // Se o estado já está registrado, incrementa o contador
    if (sqlite3_fetch_row(result)) {
        var current_count = sqlite3_column_int(result, 0);
        query = "UPDATE player_behavior SET count = " + string(current_count + 1) + " WHERE state = '" + string(state_name) + "';";
        sqlite3_exec(db, query);
    } else {
        // Se o estado não existir, cria uma nova entrada
        query = "INSERT INTO player_behavior (state, count) VALUES ('" + string(state_name) + "', 1);";
        sqlite3_exec(db, query);
    }
}
