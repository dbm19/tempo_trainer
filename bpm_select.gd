extends Control

var sixty_bpm_button 
var hundred_bpm_button
var one_twenty_bpm_button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sixty_bpm_button = get_node("BpmButtonsContainer/SixtyBpmButton")
	hundred_bpm_button = get_node("BpmButtonsContainer/HundredBpmButton")
	one_twenty_bpm_button = get_node("BpmButtonsContainer/OneTwentyBpmButton")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_sixty_bpm_button_pressed() -> void:
	Global.selected_bpm = 60
	Global.menu_sound.playing = true
	get_tree().change_scene_to_file("res://game_length_select.tscn")

func _on_hundred_bpm_button_pressed() -> void:
	Global.selected_bpm = 100
	Global.menu_sound.playing = true
	get_tree().change_scene_to_file("res://game_length_select.tscn")
	
func _on_one_twenty_bpm_button_pressed() -> void:
	Global.selected_bpm = 120
	Global.menu_sound.playing = true 
	get_tree().change_scene_to_file("res://game_length_select.tscn")

func _on_bpm_input_text_submitted(new_text: String) -> void:
	if new_text.is_valid_int() && int(new_text) > 0:
		Global.selected_bpm = int(new_text)
		get_tree().change_scene_to_file("res://game_length_select.tscn")

func _on_sixty_bpm_button_button_down() -> void:
	sixty_bpm_button.icon = load("res://art_assets/60_button_pressed.png")

func _on_hundred_bpm_button_button_down() -> void:
	hundred_bpm_button.icon = load("res://art_assets/100_button_pressed.png")

func _on_one_twenty_bpm_button_button_down() -> void:
	one_twenty_bpm_button.icon = load("res://art_assets/120_button_pressed.png")
