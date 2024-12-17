if (point_found) {
    if (direction == 1) { 
        // Muove verso il punto finale
        x = lerp(x, endX, 0.05);
        y = lerp(y, endY, 0.05);
        
        // Controllo se ha raggiunto il punto finale
        if (abs(x - endX) < 1 && abs(y - endY) < 1) {
            direction = 0; // Cambia direzione per tornare indietro
        }
    } else if (direction == 0) {
        // Muove verso il punto iniziale
        x = lerp(x, startX, 0.05);
        y = lerp(y, startY, 0.05);
        
        // Controllo se ha raggiunto il punto iniziale
        if (abs(x - startX) < 1 && abs(y - startY) < 1) {
            direction = 1; // Cambia direzione per andare avanti
        }
    }
}
