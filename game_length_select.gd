extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_sixteen_beats_button_pressed() -> void:
	Global.selected_length = 16
	Global.menu_sound.playing = true
	get_tree().change_scene_to_file("res://game.tscn")

func _on_twenty_four_beats_button_pressed() -> void:
	Global.selected_length = 24
	Global.menu_sound.playing = true
	get_tree().change_scene_to_file("res://game.tscn")

func _on_thirty_two_beats_button_pressed() -> void:
	Global.selected_length = 32
	Global.menu_sound.playing = true
	get_tree().change_scene_to_file("res://game.tscn")


func _on_length_input_text_submitted(new_text: String) -> void:
	Global.selected_length = int(new_text)
	get_tree().change_scene_to_file("res://game.tscn")

func _on_sixteen_beats_button_button_down() -> void:
	get_node("BpmButtonsContainer/SixteenBeatsButton").icon = load("res://art_assets/16_beats_button_pressed.png")

func _on_twenty_four_beats_button_button_down() -> void:
	get_node("BpmButtonsContainer/TwentyFourBeatsButton").icon = load("res://art_assets/24_beats_button_pressed.png")

func _on_thirty_two_beats_button_button_down() -> void:
	get_node("BpmButtonsContainer/ThirtyTwoBeatsButton").icon = load("res://art_assets/32_beats_button_pressed.png")
