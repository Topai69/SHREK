if (!point_found) {
    var startPoint = instance_find(obj_platformPoint, 0); // Trova il primo punto
    var endPoint = instance_find(obj_platformPoint, 1);   // Trova il secondo punto
    
    if (startPoint != noone && endPoint != noone) {
        // Assegna i punti
        startX = startPoint.x;
        startY = startPoint.y;
        endX = endPoint.x;
        endY = endPoint.y;

        // Imposta la posizione iniziale della piattaforma
        x = startX;
        y = startY;
        
        point_found = true; // I punti sono stati trovati
    }
}
