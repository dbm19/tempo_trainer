extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://bpm_select.tscn")


func _on_sixteen_beats_button_pressed() -> void:
	Global.selected_length = 16
	get_tree().change_scene_to_file("res://game.tscn")

func _on_twenty_four_beats_button_pressed() -> void:
	Global.selected_length = 24
	get_tree().change_scene_to_file("res://game.tscn")

func _on_thirty_two_beats_button_pressed() -> void:
	Global.selected_length = 32
	get_tree().change_scene_to_file("res://game.tscn")


func _on_length_input_text_submitted(new_text: String) -> void:
	Global.selected_length = int(new_text)
	get_tree().change_scene_to_file("res://game.tscn")
