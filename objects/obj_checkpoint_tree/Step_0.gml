if animation_played == false image_index = 0;
if (activated == true && animation_played == false) 
{
    if (image_index >= image_number - 1) { // Check if the animation reached the last frame
        image_speed = 0;                  // Stop the animation
        animation_played = true;                // Mark as activated
        image_index = image_number - 1;   // Ensure the last frame is displayed
	}
}