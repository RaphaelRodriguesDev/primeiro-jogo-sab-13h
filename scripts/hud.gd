extends Control

func _process(delta):
	$CanvasLayer/Label.text = "Frutas: " + str(GlobalVar.Fruits);
