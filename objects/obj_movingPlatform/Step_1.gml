var _target = endX;
var xtargetY = endY;
if(goingToStart){
	_targetX = startX;
	_targetY = startY;
}

//movement
moveX = sign(_target - x) * currentSpeed;
moveY = sign(_target - y) * currentSpeed;

