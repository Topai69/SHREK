if !checkpoint_activated
{
	image_index = 0;
}
if checkpoint_activated
{
    // Play the animation by changing the sprite to an animated sprite
    image_index = 5;  // Start the animation from the first frame
    image_speed = 0.1;  // Set the speed of the animation (adjust as needed)
    
    // Mark that the checkpoint animation has been activated
    checkpoint_activated = true;
}