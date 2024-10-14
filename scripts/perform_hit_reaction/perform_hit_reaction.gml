function perform_hit_reaction() {
    // Reação do inimigo quando ele é atingido (exemplo: reduzir HP)
    vida_atual -= 10;
    if (vida_atual <= 0) {
        state = "dead";
    }
}
