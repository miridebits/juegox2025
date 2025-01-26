extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start("INTROaljuego")
	Dialogic.signal_event.connect(_signal)

func _signal(argument:String):
	if argument == "cae":
		get_tree().change_scene_to_file("res://node_3d.tscn")
