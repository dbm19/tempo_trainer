extends Node

var selected_bpm

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	selected_bpm = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene_to_file("res://main_menu.tscn")
