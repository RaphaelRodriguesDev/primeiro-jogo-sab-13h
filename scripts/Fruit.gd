extends Area2D

func _on_Fruit_body_entered(body):
	if body.name == "Player":
		GlobalVar.Fruits += 1;
		queue_free();
		
	
