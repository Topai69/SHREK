x += moveX;
y += moveY;

//check the start position
if(goingToStart && point_distance(x,y,startX, startY) < currentSpeed){
	goingToStart = false;
	currentSpeed = 0;
	alarm[0] = waitTime;
}