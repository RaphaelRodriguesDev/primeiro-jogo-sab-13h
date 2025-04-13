extends KinematicBody2D

var motion = Vector2.ZERO;

func _physics_process(delta):
	motion.y += 15

	if is_on_floor():
		
		if motion.x == 0:
			$AnimatedSprite.play("Idle");
		
	move_and_slide(motion, Vector2.UP)
	motion = move_and_slide(motion, Vector2.UP);
