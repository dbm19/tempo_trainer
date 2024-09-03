extends Node

var selected_bpm
var selected_length

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	selected_bpm = 120

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		if get_tree().get_current_scene().name == "GameLengthSelect":
			get_tree().change_scene_to_file("res://bpm_select.tscn")
		else:
			get_tree().change_scene_to_file("res://main_menu.tscn")
