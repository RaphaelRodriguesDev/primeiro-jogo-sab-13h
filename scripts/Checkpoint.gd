extends Area2D;

onready var changer = get_parent().get_node("Transition_in");

export var path: String

export(String, FILE, "*.tscn") var world_scene;

func _on_Checkpoint_body_entered(body):
	if body.name == "Player":
		# get_tree().change_scene(world_scene)
		changer.change_scene(path)
