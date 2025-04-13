extends KinematicBody2D

var motion = Vector2.ZERO;
var speed = 100;
var jumpH = 330;

func _physics_process(delta):
	motion.y += 15
	
	if is_on_floor():
		print("CHÃO");
		
		if Input.is_action_pressed("right") or Input.is_action_pressed("left"):
			$AnimatedSprite.play("Run");
		if motion.x == 0:
			$AnimatedSprite.play("Idle");
		if Input.is_action_pressed("jump"):
			toJump(jumpH)
	else:
		print("AR");
		$AnimatedSprite.play("Jump");
	
	for platforms in get_slide_count():
		var collision = get_slide_collision(platforms);
		if collision.collider.has_method("collide_with"):
			collision.collider.collide_with(collision, self);
	
	move_and_slide(motion, Vector2.UP);
	
	
	# MOVIMENTAÇÕES
	if Input.is_action_pressed("right"):
		walkForward(speed, $AnimatedSprite);
	elif Input.is_action_pressed("left"):
		walkBackward(speed, $AnimatedSprite)
	else: 
		motion.x = 0;
	motion = move_and_slide(motion, Vector2.UP);

# DECLARANDO FUNÇÕES

func walkForward(spd, animatedSprite):
	motion.x = spd;
	animatedSprite.flip_h = false;
	
func walkBackward(spd, animatedSprite):
	motion.x = -spd;
	animatedSprite.flip_h = true;
	
func toJump(jumpH):
	motion.y = -jumpH;
	print(jumpH);
	
	
	
